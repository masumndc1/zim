#!/usr/bin/env lua

-- I want to print the output in colored font.
-- local red = '\27[31m'
local yellow = '\27[33m'
local lightgreen = '\27[36m'
local green = '\27[32m'
local blue = '\27[34m'
local purple = '\27[35m'
local white = '\27[37m'

local long_string = function()
  local n = io.popen("tput cols")
  print(lightgreen .. string.rep("-", n:read()))
end

local git_operation = function(msg)
  long_string()
  os.execute ('git add .')
  print(green .. "Commiting with msg '" .. msg .. white)
  os.execute ("git commit -m '" .. msg .. "' ")
  print(purple .."Pulling down now" .. white)
  os.execute ('git pull --rebase')
  print(blue .. "Pushing now to master" .. white)
  os.execute ('git push origin master')
  long_string()
end

local main = function ()
    if #arg < 1 then
        print( yellow .. "usage: ./gt.lua \"msg\"" .. white)
        os.exit()
    end

    if arg[1] then
        local msg = arg[1]
        git_operation(msg)
    end
end

main()
