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
