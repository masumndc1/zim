local posix = require 'posix'

assert(io.popen)

function os.capture(cmd, raw)
  local f = assert(io.popen(cmd, 'r'))
  local s = assert(f:read('*a'))
  f:close()
  if raw then return s end
  s = string.gsub(s, '^%s+', '')
  s = string.gsub(s, '%s+$', '')
  s = string.gsub(s, '[\n\r]+', ' ')
  return s
end

function os.runf(...) return os.execute(string.format(...)) end

function os.oexists(file)
  local f, msg = io.open(file, 'r')
  if f then
    f:close()
    return true
  else
    return false, msg
  end
end

os.readable = os.exists

function os.exists(file)
  local t, msg = posix.stat(file)
  if t then
    return true
  else
    return false, msg
  end
end

function os.size(file)
  local t, msg = posix.stat(file)
  if t then
    return assert(t.size)
  else
    return nil, msg
  end
end

function os.readable(file)
  local n, msg = posix.access(file, 'r')
  if n == 0 then
    return true
  else
    return false, msg
  end
end

function os.writeable(file)
  local n, msg = posix.access(file, 'w')
  if n == 0 then
    return true
  else
    return false, msg
  end
end

function os.bg(cmd)
  local pid = assert(posix.fork())
  if pid == 0 then
    os.exit(os.execute(cmd))
    assert(false, 'finished executing in forked process')
  else
    return pid
  end
end

local quote_me = '[^%w%+%-%=%@%_%/]' -- easier to complement what doesn't need quotes
local strfind = string.find

function os.quote(s)
  if strfind(s, quote_me) or s == '' then
    return "'" .. string.gsub(s, "'", [['"'"']]) .. "'"
  else
    return s
  end
end

assert(os.quote [[three]] == [[three]])
assert(os.quote [[three"]] == [['three"']])
assert(os.quote [[your mama]] == [['your mama']])
assert(os.quote [[$i]] == [['$i']])

local quote = os.quote

function os.execv(t)
  local u = { }
  for i, v in ipairs(t) do
    u[i] = quote(v)
  end
  return os.execute(table.concat(u, ' '))
end


function os.basename(s, ext)
  s = s:gsub([=[.*[\/]]=], '')
  if ext then
    s = s:gsub(ext:gsub('%W', '%%%1'), '')
  end
  return s
end

function os.varsub(s, t)
  local function sub(v)
    local function try(pat)
      local k, rest = v:match(pat)
      if k and t[k] then
        return v:gsub(pat, tostring(t[k]))
      end
    end
    return try '^{(.-)}' or try '^(%a[%w_]*)' or try '^.'
  end
  return (s:gsub('$([^%$]+)', sub))
end

string.varsub = string.varsub or os.varsub

if false then
  local t = { hello = 'howdy', world = 'Earth', ['*'] = 'one two three' }
  assert(os.varsub("$hello world", t) == "howdy world")
  assert(os.varsub("$hello, world", t) == "howdy, world")
  assert(os.varsub("${hello}world", t) == "howdyworld")
  assert(os.varsub("${hello}$world", t) == "howdyEarth", 'brackets')
  assert(os.varsub("args are $*", t) == "args are one two three", 'star')
end
