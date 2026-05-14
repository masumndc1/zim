#!/usr/bin/env lua

local Fileinfo = {}
Fileinfo.__index = Fileinfo

function Fileinfo.new(filename)
	local self = setmetatable({}, Fileinfo)
	self._filename = filename
	return self
end

function Fileinfo:get_filename()
	return self._filename
end

local my_file = Fileinfo.new("/Users/khuddin/learn.lua")

print(my_file:get_filename())
print(my_file.get_filename(my_file))

-- method1:
-- using function of sring
local orig = "hello world"
local modi = string.gsub(orig, "world", "lua")
print("method1: " .. modi)

-- method2:
-- oop
local modi2 = orig:gsub("world", "lua")
print("method2: " .. modi2)

-- method3:
-- passing orig as self
local modi3 = orig.gsub(orig, "world", "lua")
print("method3: " .. modi3)
