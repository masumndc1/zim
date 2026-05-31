#!/usr/bin/env lua

local str = "os=ubuntu"
local spl = "="
local t = {}

local match = string.match(str, spl)
-- print(match)

if string.len(match) then
	for k, v in string.gmatch(str, "(%w+)" .. spl .. "(%w+)") do
		-- print(k, v)
		t[k] = v
	end
end

for i, _ in pairs(t) do
	print(i, t[i])
end

--[[ output
os      ubuntu
--]]
