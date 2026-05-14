#!/usr/bin/env lua

local s = "one two three four five"
local sl = {}
local i = 1

print("main string:\n" .. s)

local split = function(sp)
	for word in string.gmatch(s, "%a+") do
		sl[i] = word
		i = i + 1
	end
	return sl
end

print("\nsplit string:")

for k, v in pairs(split(s)) do
	print(k, v)
end
