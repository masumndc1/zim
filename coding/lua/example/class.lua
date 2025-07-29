#!/usr/bin/env lua

-- exmaple 1
local person = {
	name = "Alice",
	age = 25,

	greet = function(self)
		print("Hi! I'm " .. self.name)
	end,
}

-- person:greet()
-- person.greet(person) == person:greet()
person:greet()
-- person.greet(self)
-- person.greet(person)

-- example 2
local newPerson = function(name, age)
	local obj = {
		name = name,
		age = age,
		greet = function(self)
			print("Hello, my name is " .. self.name)
		end,
	}
	return obj
end

local john = newPerson("John", 30)
-- john:greet()
john:greet()

-- example 3
-- __index makes the object inherit methods from Person.
-- in this case __index makes object bos to inherit methods from Person.

local Person = {}

function Person:new(name, age)
	local obj = {
		name = name,
		age = age,
	}
	setmetatable(obj, { __index = Person })

	function Person:greet()
		print("hey I am " .. self.name)
	end

	function Person:farewall()
		print("hey, see you then " .. self.name)
	end

	return obj
end

local bob = Person:new("bob", 40)
bob:greet()
bob:farewall()

local t = {}
t.x = 10
print("t.x", t.x)
print("t.y", t.y)
local meta = {
	__index = function()
		print("> from __index")
		return t.x + 2
	end,
	__call = function()
		print("> from call")
		return t.x + 1
	end,
}

setmetatable(t, meta)
-- t.__index = t
print("if t.y not there", t.y)
print("increase t by_one", t())

-- example 4
local error = {
	new = function(self, code, msg)
		local o = {}
		setmetatable(o, self)
		self.__index = self
		-- another way of doing in a single line
		-- setmetatable(o, { __index = self })
		o.msg = msg
		o.code = code
		return o
	end,

	__tostring = function(self)
		return self.code, self.msg
	end,
}

local err = error:new(200, "done")
print(err.msg, err.code)
print(err:__tostring())
-- output --
-- done    200
-- 200     done
--
-- exmaple 5
--[[
local http = require("socket.http")
local body, status = http.request("http://example.com")

if status == 200 then
	-- print(body)
	if string.gmatch(body, "example") then
		print("found a match")
	else
		print("nothing found")
	end
else
	print("Request failed with status:", status)
end
-- ]]

local ok, type, status = os.execute("ls")
if ok then
	print(type, status)
end
