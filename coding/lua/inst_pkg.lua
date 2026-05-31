#!/usr/bin/env lua

local file, err = io.open("/etc/os-release", "r")
local spl = "="
local t = {}

if not file then
	print("Could not open file: " .. err)
	return
end

for line in file:lines() do
	-- print(line)

	local match = line:match(spl)
	-- print(match)

	if match then
		for k, v in line:gmatch('([^=]+)="?([^"]*)"?') do
			-- print(k, v)
			if #k > 0 and #v > 0 then
				t[k:lower()] = v
			end
		end
	end
end

--[[
for k, v in pairs(t) do
        print(k, v)
end
print(t['id'])
--]]

if t["id"] and t["id"] == "almalinux" then
	os.execute("sudo yum install -y neovim")
elseif t["id"] and t["id"] == "ubuntu" or t["id"] == "debian" then
	os.execute("sudo apt install -y neovim")
elseif t["id"] and t["id"] == "opensuse" then
	os.execute("sudo zypper install -y neovim")
end
