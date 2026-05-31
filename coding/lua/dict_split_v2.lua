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

for i, k in pairs(t) do
	print(i, k)
end

--[[
output: run on almalinux 9

documentation_url       https://wiki.almalinux.org/
id      almalinux
logo    fedora-logo-icon
ansi_color      0;34
redhat_support_product_version  9.8
redhat_support_product  AlmaLinux
support_end     2032-06-01
bug_report_url  https://bugs.almalinux.org/
cpe_name        cpe:/o:almalinux:almalinux:9::baseos
pretty_name     AlmaLinux 9.8 (Olive Jaguar)
platform_id     platform:el9
almalinux_mantisbt_project_version      9.8
version 9.8 (Olive Jaguar)
almalinux_mantisbt_project      AlmaLinux-9
id_like rhel centos fedora
version_id      9.8
home_url        https://almalinux.org/
name    AlmaLinux

-- ]]
