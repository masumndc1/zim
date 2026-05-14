#!/usr/bin/env lua

local uname = io.popen("uname -a")
local info = {
	MacOS = {
		pkg_manager = "port",
		common_cmd = "selfupdate",
	},
	debian = {
		pkg_manager = "apt",
		common_cmd = "update",
	},
}

local operating_system = function()
	if string.gmatch(uname:read("a"), "Darwin") then
		return "MacOS"
	elseif string.gmatch(uname:read("a"), "Linux") then
		return "Linux"
	end
end

local cmd = function(ops)
	if ops then
		cmds = string.format("%s %s", info[ops].pkg_manager, info[ops].common_cmd)
		print(cmds)
		os.execute(cmds)
	end
end

local main = function()
	local ops = operating_system()
	cmd(ops)
end

main()
