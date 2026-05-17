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

local ops_syst = function()
	if string.gmatch(uname:read("a"), "Darwin") then
		return "MacOS"
	elseif string.gmatch(uname:read("a"), "Linux") then
		return "Linux"
	end
end

local cmd = function(ops)
	if ops then
		local cmds = string.format("%s %s", info[ops].pkg_manager, info[ops].common_cmd)
		print(cmds)
		os.execute(cmds)
	end
end

local inst = function(ops, pkg)
	if ops and pkg then
		local cmds = string.format("%s install -y %s", info[ops].pkg_manager, pkg)
		print(cmds)
		os.execute(cmds)
	end
end

local main = function()
	local ops = ops_syst()
	if #arg < 1 then
		cmd(ops)
	end

	if arg[1] then
		local pkg = arg[1]
		inst(ops, pkg)
	end
end

main()
