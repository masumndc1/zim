require 'posix'

posix.__doc = posix.__doc or { }
local __doc = posix.__doc

__doc.isdir = [[function(path) returns boolean or nil, msg
Tells whether path is a directory.]]

function posix.isdir(s)
  local t, msg = posix.stat(s)
  if t then return t.type == 'directory'
  else return t, msg
  end
end

function posix.dirname(s)
  s = s:gsub('/$', '')
  local s, n = s:gsub('/[^/]*$', '')
  if n == 1 then return s else return '.' end
end

function posix.basename(s, ext)
  s = s:gsub('/$', ''):gsub('^.*/', '')
  if ext then
    return (s:gsub(ext:gsub('%W', '%%%1') .. '$', ''))
  else
    return s
  end
end

require 'stringutil'

__doc.braceexpand = [[
function(s) returns iterator
Iterates through brace expansions of s, in a subset of ksh functionality.
]]

local suspend = coroutine.yield

function posix.braceexpand(s)
  return coroutine.wrap(function()
    local pre, brace, post = s:match('^(.-)(%b{})(.*)$')
    if pre then
      for field in brace:sub(2, -2):split(',') do
        for t in posix.braceexpand(field) do
          for u in posix.braceexpand(post) do
            suspend(table.concat {pre, t, u})
          end
        end
      end
    else
      suspend(s)
    end
  end)
end


local escape_chars = '^$()%.*+-?' --- don't escape square brackets
local escape = { }
for c in escape_chars:gmatch '.' do escape[c] = true end
assert(not escape['/'])

local function glob_to_pats(glob, all)
  local function translate(pos, char)
    if char == '?' then return { '.' }
    elseif char == '*' then
      if all or (pos > 1 and glob:sub(pos-1, pos-1) ~= '/') then
        return { ".*" }
      else
        return { "", "[^%.].*" }
      end
    elseif escape[char] then
      return { "%" .. char }
    else
      return { char }
    end
  end

  local function tx_class(s)
    -- print('adding class [' .. s .. '] = ', (s:gsub('[^%w%-]', '%%%1')))
    return (s:gsub('[^%w%-]', '%%%1'))
  end

  local prefixes = { '' }
  local function add_element(s)
    if s ~= '' then
      for i = 1, #prefixes do prefixes[i] = prefixes[i] .. s end
    end
  end

  local function tx_outer(s, start)
    if not s:find '%W' then
      -- print('========> adding ' .. s)
      add_element(s)
    else
      for pre, pos, char, post in s:gmatch('(%w-)()(%W)(%w*)') do
        local np = { }
        for _, trans in ipairs(translate(pos + start - 1, char)) do
          for k, prefix in ipairs(prefixes) do
            -- print('========> adding ' .. table.concat {pre, trans, post})
            table.insert(np, table.concat {prefix, pre, trans, post})
          end
        end
        prefixes = np
      end
    end
  end

  local rest, start = glob, 1
  while true do
    -- print('prefix starts at ' .. start)
    local pre, cstart, class = rest:match('^(.-)()(%[.*)$')
    if class then
      cstart = cstart + start - 1
      -- print('****> prefix ' .. pre)
      tx_outer(pre, start)
--      print('class starts at pos ' .. cstart)
      if class:find '^%[%^%].-%]' then
        class, start, rest = class:match '^%[%^%](.-)%]()(.*)$'
        add_element('[^%]' .. tx_class(class).. ']')
      elseif class:find '^%[%].-%]' then
        class, start, rest = class:match '^%[%](.-%)]()(.*)$'
        add_element('[%]' .. tx_class(class).. ']')
      elseif class:find '^%[(.-)%]' then
        class, start, rest = class:match '^%[(.-)%]()(.*)$'
        add_element('[' .. tx_class(class).. ']')
      else
        assert(class:find '^%[')
        add_element '['
        start, rest = 2, class:sub(2)
      end
      start = start + cstart - 1
      -- print('next start is ' .. start, rest)
    else
      -- print('adding rest', rest, ' at pos ' .. start)
      tx_outer(rest, start)
      break
    end
  end

  return prefixes
end

local function elements(t)
  local i = 0
  return function () i = i + 1; return t[i] end
end

local function globpats(glob, all)
  return elements(glob_to_pats(glob, all))
end

posix.globpats = globpats -- debugging

require 'tabutil'

local function expand_dir(dirpath, patset, emptyprefix)
  if next(patset, nil) == nil then return end
  local filepats = table.of_tables { }
--  io.stderr:write('Looking in ', dirpath, ' for:\n')
  for p in pairs(patset) do
    local first, rest = p:match('^(.-)/(.*)$')
    if first then
      filepats['^' .. first .. '$'][rest] = true
    else
      filepats['^' .. p .. '$'][true] = true
    end
--    io.stderr:write('  ', first or p, '\n')
  end

  assert(posix.isdir(dirpath), 'dirpath is not a directory!')
  assert(posix.files)
  local files, msg = posix.files(dirpath)
  if not files then
    io.stderr:write(dirpath, ': ', msg, '\n') -- real error, real message
  else
    for file in files do
      local whatnext = { }
      for pat, next in pairs(filepats) do
        if file:find(pat) then
          for k in pairs(next) do
            whatnext[k] = true
          end
        end
      end
      local path = dirpath == '/' and '/' .. file or
                   emptyprefix and file or
                   dirpath .. '/' .. file
      if whatnext[true] then
        suspend(path)
      end
      whatnext[true] = nil
      if next(whatnext, nil) ~= nil and posix.isdir(path) then
        expand_dir(path, whatnext)
      end
    end
  end
end

function posix.glob(glob, all)
  assert(posix.files)
  local files = { }
  for file in coroutine.wrap(function()
                          local relpats, abspats = { }, { }
                          for pat in posix.braceexpand(glob) do
                            for pat in globpats(pat, all) do
                              if pat:find '^/' then
                                abspats[pat:gsub('^/', '')] = true
                              else
                                relpats[pat] = true
                              end
                            end
                          end
                          expand_dir('.', relpats, true)
                          expand_dir('/', abspats)
                        end) do
    table.insert(files, file)
  end
  table.sort(files)
  return elements(files)
end
