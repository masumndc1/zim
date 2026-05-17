#!/usr/bin/env lua

local _G = _G

for n in pairs(_G) do
	print(n)
end

--[[
output:
warn
ipairs
assert
loadfile
rawlen
debug
type
next
io
error
pcall
table
os
rawset
arg
setmetatable
pairs
rawequal
math
xpcall
rawget
load
getmetatable
_G
coroutine
utf8
dofile
collectgarbage
print
tonumber
tostring
package
string
_VERSION
select
require
--]]
