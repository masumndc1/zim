------- expressions and their derivatives

local table, string, math
    = table, string, math

local io = io -- debugging

local os = require 'os' -- debugging
local require = require

require 'tabutil'

local print = print -- debugging

local stringf = string.format

local function xverbosef(...) return io.stderr:write(string.format(...)) end
local function verbosef(...) end
--verbosef=xverbosef

local getmetatable, setmetatable, type, assert, pairs, ipairs, tostring, next
    = getmetatable, setmetatable, type, assert, pairs, ipairs, tostring, next

local rawequal, rawget, error, unpack, loadstring
    = rawequal, rawget, error, unpack, loadstring

module(...)

__doc = { }

-- an expression is one of
--   * a number
--   * a variable (string)
--   * a table with an 'op' and a list of subexpressions
--   * a linear sum with expression keys and multiplier values



local prec = { ['or'] = 0,
               ['and'] = 1,
               lt = 2, le = 2, gt = 2, ge = 2, ne = 2, eq = 2,
               concat = 3,
               add = 4, sub = 4,
               mul = 5, div = 5, mod = 5,
               len = 6, ['not'] = 6, unm = 6,
               pow = 7,
             }

local infix = { ['or'] = 'or', ['and'] = 'and',
                lt = '<', le = '<=', gt = '>', ge = '>=', ne = '~=', eq = '==',
                concat = '..',
                add = '+', sub = '-',
                mul = '*', div = '/', mod = '%',
                ['not'] = 'not', len = '#', unm = '-',
                pow = '^',
              }

local ac = { add = true, mul = true }

local singleid = { add = true, mul = true, ['or'] = true, ['and'] = true }


local linsums = setmetatable({ }, { __mode = 'k'})

local expmeta = { __index =
                       function(t, k)
                         if linsums[t] then
                           return 0
                         else
                           return nil
                         end
                       end,
                }

local lexi_lt

do
  -- hash-consing is needed to ensure equality test works on linear sums...
  local cache = setmetatable({ }, { __mode = 'kv' })
  local function argtab(t, x)
    if t[x] then
      return t[x]
    else
      local u = setmetatable({ }, { __mode = 'kv' })
      t[x] = u
      return u
    end
  end

  function apply(op, ...)
    assert(infix[op])
    local l = { ... }
    if singleid[op] and #l == 1 then return l[1] end
    if ac[op] then table.sort(l, lexi_lt) end
    table.insert(l, 1, op)
    local t = cache
    while #l > 1 do
      t = argtab(t, table.remove(l, 1))
    end
    local last = table.remove(l, 1)
    if not t[last] then
      t[last] = setmetatable({ op = op, ... }, expmeta)
    end
    return t[last]
  end
end

--
--  function apply(op, ...)
--    assert(infix[op])
--    return setmetatable({ op = op, ... }, expmeta)
--  end

local function hashcons(e)
  return apply(e.op, unpack(e))
end

local linear_sum
do
  local t2t = { }
  function t2t.table(x)
    if linsums[x] then return x
    else return t2t.default(x) end
  end
  function t2t.number(x) return { x } end
  function t2t.default(x) return { [x] = 1 } end

  function linear_sum(x)
    if linsums[x] then
      return x
    else
      local e = setmetatable((t2t[type(x)] or t2t.default)(x), expmeta)
      linsums[e] = true
      return e
    end
  end
end

local function isexp(e)
  return getmetatable(e) == expmeta
end

local function as_constant(linsum)
  for v, k in pairs(linsum) do
    if v ~= 1 and k ~= 0 then
      return nil
    end
  end
  return linsum[1]
end

function as_product(linsum)
  local sv, sk -- single v, single k

  for v, k in pairs(linsum) do
    if k ~= 0 then
      if sv then return nil
      else sv, sk = v, k
      end
    end
  end
  return sv, sk
end

local function simplify(e)
  if linsums[e] then
    local k = as_constant(e)
    if k then return k end

    local v, k = as_product(e)
    if v and k then
      if k == 1 then
        return v
      else
        return expmeta.__mul(v, k)
      end
    end
  end

  return e
end


lexi_lt = function(e1, e2)
--  e1 = simplify(e1)
--  e2 = simplify(e2)

  if isexp(e1) ~= isexp(e2) then
    return isexp(e2)
  elseif not isexp(e1) then
    if type(e1) == type(e2) then
      return e1 < e2
    else
      return type(e1) < type(e2)
    end
  elseif linsums[e1] == linsums[e2] then
    if linsums[e1] then
      local ps1 = table.map(function(v, k) return { val = v, key = k } end, e1)
      local ps2 = table.map(function(v, k) return { val = v, key = k } end, e2)
      if #ps1 == #ps2 then
        local function lt(p1, p2)
          return lexi_lt(p1.key, p2.key) or
                 not lexi_lt(p2.key, p1.key) and lexi_lt(p1.val, p2.val)
        end
        table.sort(ps1, lt)
        table.sort(ps2, lt)
        return table.lt(ps1, ps2, lt)
      else
        return #ps1 < #ps2
      end
    else
      if #e1 == #e2 then
        if table.lt(e1, e2, lexi_lt) then
          return true
        elseif table.lt(e2, e1, lexi_lt) then
          return false
        else
          return e1.op < e2.op
        end
      else
        return #e1 < #e2
      end
    end
  else
    return linsums[e1]
  end
end

local function wrap1(f, show)
  return function(...)
    local answer = f(...)
    show(answer, ...)
    return answer
  end
end

local _ = wrap1(lexi_lt, function(lt, e1, e2)
                           xverbosef('==>  %s  %s  %s\n', tostring(e1),
                                     answer and '< ' or '>=', tostring(e2))
                         end)

local function toexp(e)
  if getmetatable(e) ~= expmeta then
    return linear_sum(e)
  else
    return e
  end
end

function expmeta.__add(x, y)
  if x == 0 then return y
  elseif y == 0 then return x
  elseif type(x) == 'number' and type(y) == 'number' then
    return x + y
  else
    local z = linear_sum(0)
    x = linear_sum(x)
    y = linear_sum(y)
    for v, k in pairs(x) do z[v] = k end
    for v, k in pairs(y) do z[v] = z[v] + k end
    return z
  end
end

function sum(terms)
  local z = linear_sum(0)
  for _, x in ipairs(terms) do
    x = linear_sum(x)
    for v, k in pairs(x) do z[v] = z[v] + k end
  end
  return z
end

function expmeta.__sub(l, r)
  if r == 0 then return l
  elseif type(l) == 'number' and type(r) == 'number' then
    return l - r
  else
    local z = linear_sum(0)
    l = linear_sum(l)
    r = linear_sum(r)
    for v, k in pairs(l) do z[v] = k end
    for v, k in pairs(r) do z[v] = z[v] - k end
    return z
  end
end

function expmeta._unm(e) return 0 - e end

local function unpower(e)
  if isexp(e) and e.op == 'pow' then
    return simplify(e[1]), e[2]
  else
    return simplify(e), 1
  end
end

local function unpowerl(l)
  local root, exp = { }, { }
  for i, e in ipairs(l) do
    root[i], exp[i] = unpower(e)
  end
  return root, exp
end

local function merge_powers(l, r)
  local lroot, lexp = unpowerl(l)
  local lpos = table.invert(lroot)
  for _, e in ipairs(r) do
    local root, exp = unpower(e)
    local i = lpos[root]
    if i then
      lexp[i] = lexp[i] + exp
    else
      table.insert(lroot, root)
      table.insert(lexp, exp)
    end
  end
  for i = 1, #lroot do
    lroot[i] = expmeta.__pow(lroot[i], lexp[i])
  end
  return lroot
end

function expmeta.__mul(l, r)
  if l == 1 then return r
  elseif r == 1 then return l
  elseif l == 0 then return 0
  elseif r == 0 then return 0
  elseif type(l) == 'number' and type(r) == 'number' then
    return l * r
  elseif type(l) == 'number' then
    if linsums[r] then
      r = table.copy(r)
      linsums[r] = true
    else
      r = linear_sum(r)
    end
    for v, k in pairs(r) do r[v] = l * k end
    return r
  elseif type(r) == 'number' then
    return expmeta.__mul(r, l)
  else
    local function mul_args(e)
      e = simplify(e)
      if type(e) == 'table' and e.op == 'mul' then
        return e
      else
        return { e }
      end
    end
    args = merge_powers(mul_args(l), mul_args(r))
    if #args == 1 then
      return args[1]
    else
      table.sort(args, lexi_lt)
      return apply('mul', unpack(args))
    end
  end
end

function expmeta.__div(l, r)
  if type(l) == 'number' and type(r) == 'number' then
    return l / r
  elseif type(r) == 'number' then
    return expmeta.__mul(l, 1.0/r)
  else
    return apply('div', l, r)
  end
end

function expmeta.__pow(l, r)
  if r == 0 then return 1
  elseif r == 1 then return l
  elseif type(l) == 'number' and type(r) == number then return math.pow(l, r)
  else return apply('pow', l, r)
  end
end

function remove_zeroes(e)
  local delenda = { }
  for v, k in pairs(e) do
    if k == 0 then
      table.insert(delenda, v)
    end
  end
  for _, v in ipairs(delenda) do e[v] = nil end
  return e
end


function free_variables(e)
  local visited = { }
  local function visit(e)
    if type(e) == 'string' then
      visited[e] = true
    elseif linsums[e] then
      for v, k in pairs(remove_zeroes(e)) do visit(v); visit(k) end
    elseif isexp(e) then
      for _, e in ipairs(e) do
        visit(e)
      end
    end
  end
  visit(e)

  return pairs(visited)
end

function is_free_in(v, e)
  if type(e) == 'string' then
    return v == e
  elseif linsums[e] then
    if e[v] ~= 0 then return true end
    for _, k in pairs(e) do
      if is_free_in(v, k) then return true end
    end
    return false
  elseif isexp(e) then
    for _, e in ipairs(e) do
      if is_free_in(v, e) then return true end
    end
    return false
  else
    return false
  end
end

function expmeta.__eq(e1, e2)
  e1 = simplify(e1)
  e2 = simplify(e2)

  if rawequal(e1, e2) then
    return true
  elseif not (linsums[e1] or linsums[e2]) then
    if e1.op ~= e2.op or #e1 ~= #e2 then
      return false
    elseif ac[e1.op] then
      local left = { } -- to what index on left does right exp correspond to?
      for i = 1, #e1 do
        local found = false
        for j = 1, #e2 do
          if not left[j] and e1[i] == e2[j] then
            left[j] = i
            found = true
            break
          end
        end
        if not found then return false end
      end
      return true
    else
      for i = 1, #e2 do
        if e1[i] ~= e2[i] then return false end
      end
      return true
    end
  else
    e1 = linear_sum(e1)
    e2 = linear_sum(e2)
    for v1, k1 in pairs(e1) do
      if simplify(e2[v1]) ~= simplify(k1) then return false end
    end
    for v2, k2 in pairs(e2) do
      if simplify(e1[v2]) ~= simplify(k2) then return false end
    end
    return true
  end
end

function rename_variables(e, rho)
  if linsums[e] then
    local eprime = linear_sum(0)
    for w, k in pairs(e) do
      eprime = eprime + expmeta.__mul(k, rename_variables(w, rho))
    end
    return eprime
  elseif type(e) == 'table' then
    local args = table.copy(e)
    for i = 1, #e do args[i] = rename_variables(e[i], rho) end
    return apply(e.op, unpack(args))
  elseif rho[e] then
    return rho[e]
  else
    return e
  end
end



expmeta.__eqzzz = wrap1(expmeta.__eq,
                     function(eq, e1, e2)
                       xverbosef('***  %s  %s  %s\n', tostring(e1),
                                 eq and '==' or '~=', tostring(e2))
                     end)



function subst(v, z) -- substitute z for v (v goes to z)
  assert(type(v) == 'string')
  local visiting = { }
  local expressions = { }
  local function dosubst(e, k)
    if k == 'op' then return e end -- hack to enable table.map
    table.insert(expressions, e)
    if visiting[e] then
      for i = 1, #expressions do
        local e2 = expressions[i]
        xverbosef('%3d. %s> %s\n', i, e == e2 and '***' or '===', tostring(e2))
      end
      error('Cycle in expression!')
    end
    visiting[e] = true

    if linsums[e] then
      local eprime = linear_sum(0)
      for w, k in pairs(e) do
        eprime = eprime + expmeta.__mul(k, dosubst(w))
      end
      table.remove(expressions)
      visiting[e] = false
      return simplify(eprime)
    elseif type(e) == 'table' then
      local eprime = apply(e.op, unpack(table.map(dosubst, e)))
      table.remove(expressions)
      visiting[e] = false
      return eprime
    elseif e == v then
      table.remove(expressions)
      visiting[e] = false
      return z
    else
      table.remove(expressions)
      visiting[e] = false
      return e
    end
  end
  local raw = dosubst
  local indent = 0
  local _ = function(e, k)
              local pfx = string.rep(' ', indent)
              indent = indent + 2
              xverbosef('%-2d%ssubstituting %s for %s in %s\n',
                        indent/2, pfx, tostring(z), v, tostring(e))
              local eprime = raw(e, k)
              indent = indent - 2
              xverbosef('  %s  yields %s\n', pfx, tostring(eprime))
              return eprime
            end
  return dosubst
end




local function bracket(e, op)
  local outer = assert(prec[op])
  e = simplify(e) --- eliminate trivial linear sums
  local inner = linsums[e] and prec.add
    or isexp(e) and assert(prec[e.op], 'No precedence for ' .. e.op)
    or prec.pow + 1
  if inner > outer then
    return expimage(e)
  else
    return string.format('(%s)', expimage(e))
  end
end

function expimage(e)
  local leadingsign, prefix
  if type(e) == 'string' or type(e) == 'number' then
    return tostring(e)
  elseif linsums[e] then
    local function mul(k, v) -- elide multiplicative units
      if k == 1 then return bracket(v, 'add')
      else return string.format('%s * %s', bracket(k, 'mul'), bracket(v, 'mul'))
      end
    end
    -- positive terms, negative terms, constant
    local pos, neg, oth, const = { }, { }, { }, 0
    for v, k in pairs(e) do
      v = simplify(v)
      if type(v) == 'string' then
        if k > 0 then
          table.insert(pos, v)
        elseif k < 0 then
          table.insert(neg, v)
        end
      elseif v == 1 then
        assert(const == 0)
        const = k
      else
        table.insert(oth, v)
      end
    end
    pos = table.map(function(v) return mul( e[v], v) end, pos)
    oth = table.map(function(v) return mul( e[v], v) end, oth)
    neg = table.map(function(v) return mul(-e[v], v) end, neg)
    table.sort(pos); table.sort(neg); table.sort(oth)
    pos = table.concat(pos, ' + ')
    oth = table.concat(oth, ' + ')
    neg = table.concat(neg, ' - ')
    if #neg > 0 then
      neg = ' - ' .. neg
    end
    if #oth > 0 and (#neg + #pos > 0) then
      oth = ' + ' .. oth
    end
    if #pos + #neg + #oth == 0 then
      return tostring(const)
    elseif const > 0 and (#pos + #oth) == 0 then
      return table.concat { const, neg }
    elseif const > 0 then
      const = string.format(' + %s', tostring(const))
    elseif const < 0 then
      const = string.format(' - %s', tostring(-const))
    else
      const = ''
    end
    return table.concat { pos, neg, oth, const }
  elseif isexp(e) then
    assert(infix[e.op])
    assert(#e > 0)
    local args = { }
    for i = 1, #e do
      args[i] = bracket(e[i], e.op)
    end
    if #args > 2 then assert(ac[e.op]) end
    if #args > 1 then
      return table.concat(args, ' ' .. infix[e.op] .. ' ')
    else
      return table.concat { infix[e.op], ' ', args[1] }
    end
  end
end

expmeta.__tostring = expimage

if os.getenv 'DEBUG' then
  local ft = require 'filetable'
  expmeta.__tostring = ft.tostring
end



local derivs = { }

function derivs.mul(x, e)
  local z = 0
  for i = 1, #e do
    local l = table.copy(e)
    local d = simplify(deriv(x, table.remove(l, i)))
    if d ~= 0 then
      z = expmeta.__add(z, expmeta.__mul(hashcons(l), d))
    end
  end
  return simplify(z)
end

function derivs.sub(x, e)
  local sub = expmeta.__sub
  if #e == 1 then return sub(0, deriv(x, e[1]))
  elseif #e == 2 then return sub(deriv(x, e[1]), deriv(x, e[2]))
  else
    error('subtraction with #e not 1 or 2')
  end
end

function derivs.pow(x, e)
  local root, exp = unpower(e)
  local mul, pow = expmeta.__mul, expmeta.__pow
  if type(exp) == 'number' then
    return mul(mul(exp, pow(root, exp - 1)), deriv(x, root))
  elseif is_free_in(x, e) then
    error('Cannot differentiate ' .. tostring(e) .. ' wrt ' .. x)
  else
    return 0
  end
end

function deriv(x, e)
  if linsums[e] then
    local z = linear_sum(0)
    local mul = expmeta.__mul
    for v, k in pairs(e) do
      z = z + mul(deriv(x, v), k) + mul(v, deriv(x, k))
    end
    return simplify(z)
  elseif isexp(e) then
    return derivs[e.op](x, e)
  elseif x == e then
    return 1
  else
    return 0
  end
end

function isnumber(e)
  if type(e) == 'number' then return true
  elseif not linsums[e] then return false
  else
    for k, v in pairs(e) do
      if not isnumber(k) or not isnumber(e) then
        return false
      end
    end
    return true
  end
end

function tonumber(e)
  assert(isnumber(e))
  if type(e) == 'number' then return e
  elseif not linsums[e] then assert(false)
  else
    for k, v in pairs(e) do
      if not isnumber(k) or not isnumber(e) then
        assert(false)
      end
    end
    for k, v in pairs(e) do
      return k * v
    end
    assert(false)
  end
end

function tofunction(e)
  local reserved = require 'reserved_words'
  local luanames, inuse = { }, { }
  local function luaname(s)
    if not luanames[s] then
      local x = s:gsub('%W', '_')
      if reserved[x] or not x:find '^[%a_]' then
        x = '_' .. x
      end
      if inuse[x] then
        local n = 2
        while inuse[x .. '_' .. n] do n = n + 1 end
        x = x .. '_' .. n
      end
      assert(not inuse[x])
      inuse[x] = s
      luanames[s] = x
    end
    return luanames[s]
  end

  local init = { }
  for x in free_variables(e) do
    table.insert(init, stringf('  local %s = xs[%q]\n', luaname(x), x))
  end
  local f = ([[
return function(xs)
%s
  return %s
end]]):format(table.concat(init), expimage(rename_variables(e, luanames)))
  f = assert(loadstring(f), 'Converting f to function failed')
  return f()
end



--[[
function derivs.pow(x, e)
  if type(e[2]) == 'number'
]]

var = linear_sum

local show = function() end
--show = print

local function derivtest()
  local x, y, z = var 'x', var 'y', var 'z'
  local err = (x - 3)^2 + (y - 4)^2 + (z - 5)^2
  local dx = deriv('x', err)
  local dy = deriv('y', err)
  show('dx ==', dx)
  show('dy ==', dy)
  assert(dx == 2 * (x - 3))
  assert(dy == 2 * (y - 4))
  local ddx = deriv('x', dx)
  assert(ddx == 2)

  assert(y * z == z * y)
  assert(y^2 * z == z * y^2)

  show(1 + y * z, z * y + 1)
  assert(1 + y * z == z * y + 1)

  show '----'
  show(deriv('x', z - x))
  assert(simplify(deriv('x', z - x)) == -1)
  show '----'
  show(deriv('x', (z - x)^2))
  assert(deriv('x', (z - x)^2) == 2 * (x - z))

  show '----'
  show(deriv('x', x * y ^ 2 * z))
  assert(deriv('x', x * y ^ 2 * z) == z * y ^ 2)
  show '----'
  show(deriv('x', x * y ^ 2 * z + (z - x) ^ 2))
  show(2 * (x - z) + z * y^2)
  assert(tostring(deriv('x', x * y ^ 2 * z + (z - x) ^ 2)) ==
       tostring(2 * (x - z) + z * y^2))
end


local function stringtest()
  local x, y, z = var 'x', var 'y', var 'z'
  assert(x)
  show '----'
  show(tostring(2*x))
  assert(tostring(2*x) == '2 * x')
  local e  = 2 * x + 'y'
  assert(tostring(e) == '2 * x + y')
  local em = 2 * x - 'y'
  show(tostring(em))
  assert(tostring(em) == '2 * x - y')

  show '----'
  show(tostring(x-3))
  assert(tostring(x-3) == 'x - 3')
  show '----'
  show(tostring((x-3)^2))
  assert(tostring((x-3)^2) == '(x - 3) ^ 2')



  local err = (x - 3)^2 + (y - 4)^2 + (z - 5)^2
  show '----'
  show(tostring(err))
  local sums = { '(x - 3) ^ 2', '(y - 4) ^ 2', '(z - 5) ^ 2' }
  local errstrings = { }
  local p = require 'permutations'
  for l in p.of_list(sums) do
    errstrings[table.concat(l, ' + ')] = true
  end
  assert(errstrings[tostring(err)])

  show '----'
  show(tostring(x * x))
  show '----'
  show(tostring(x^2 * x^3))
  assert(tostring(x^2 * x^3) == 'x ^ 5')

end

local function funtest()
  local x, y, z = var 'x', var 'y', var 'z'
  show(x^2 + y^2)
  local ss = tofunction(x^2 + y^2)
  assert(ss { x = 3, y = 4 } == 25)
  assert(ss { x = 0, y = 0 } == 0)
  assert(ss { x = 1.2, y = 3.4} == 1.2^2 + 3.4^2)
end

local function subst_test()
  local x, y, z, w = var 'x', var 'y', var 'z', var 'w'
  local err = (x - 3)^2 + (y - 4)^2 + (z - 5)^2 + 1
  local err2 = subst('x', w)(err)
  local err2b = (w - 3)^2 + (y - 4)^2 + (z - 5)^2 + 1
  show(err2)
  show(err2b)
  assert(tostring(err2) == tostring(err2b))
  local err3 = subst('x', 2 * y + z + 1)(err)
  local err3b = (2 * y + z - 2)^2 + (y - 4)^2 + (z - 5)^2 + 1
  show(err3)
  show(err3b)
  assert(tostring(err3) == tostring(err3b))
end


function minimize(e, initial, epsilon)
  if epsilon == nil and type(initial) == 'number' then
    initial, epsilon = nil, initial
  end

  local vars = { }
  for x in free_variables(e) do table.insert(vars, x) end
  table.sort(vars)
  local derivs = table.map(function(x) return deriv(x, e) end, vars)
  local partials = {}
  for i = 1, #derivs do
    partials[i] = { }
    for _, x in ipairs(vars) do
      partials[i][x] = tofunction(deriv(x, derivs[i]))
    end
  end
  derivs = table.map(tofunction, derivs)
  local newton = require 'newton'
  if not initial then
    initial = { }
    for _, x in ipairs(vars) do initial[x] = 0 end
  end
  local ef = tofunction(e)
  local function shout(x)
    io.stderr:write(stringf('Expression to be minimized is %.5g\n', ef(x)))
  end
  if verbosef ~= xverbosef then
    shout = function() end
  end
  return newton.findzero(derivs, partials, initial, epsilon, shout, 50)
end

local function mintest()
  local newton = require 'newton'
  local x, y, z = var 'x', var 'y', var 'z'
  if true then
    local err = (x - 3)^2 + (y - 4)^2 + (z - 5)^2 + 1
    local f = tofunction(err)
    local derivs = {deriv('x', err), deriv('y', err), deriv('z', err)}
    local partials = {}
    for i = 1, #derivs do
      show '---------'
      show(derivs[i])
      partials[i] = { }
      for x in free_variables(err) do
        show(x, deriv(x, derivs[i]))
        partials[i][x] = tofunction(deriv(x, derivs[i]))
      end
    end
    show '####################################################'
    derivs = table.map(tofunction, derivs)
    local min = newton.findzero(derivs, partials, { x = 0, y = 0, z = 0 }, 1e-15)
    show '######### DONE! ##########'
    for k, v in pairs(min) do show(k, v) end
    assert(newton.close_to(min.x, 3))
    assert(newton.close_to(min.y, 4))
    assert(newton.close_to(min.z, 5))
    assert(newton.close_to(f(min), 1.0))
  end

  local e2 = (x-1)^4 + (y - 2)^2 + (z - 3)^6
  local e2f = tofunction(e2)
  local min = minimize(e2, 1e-20)
  assert(newton.close_to(min.x, 1))
  assert(newton.close_to(min.y, 2))
  assert(newton.close_to(min.z, 3, 1e-3))
  show(e2f(min))
  assert(newton.close_to(e2f(min), 0))
end

subst_test()

derivtest()

stringtest()

funtest()

mintest()
