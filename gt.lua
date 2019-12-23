#!/usr/bin/env lua

--[[ 
 function for to print long string of star
 honestly this was not a good way to pass
 string value in function
 http://lua-users.org/lists/lua-l/2010-08/msg00300.html
--]]

function long_string()
  print(string.rep("-", 70))
end

function git_operation(msg)
  long_string()
--[[
I want to print the output in colored font.
the whole color scheme is coming from colr.png of
this folder. the general coler codes are below
print('\27[31mred')
print('\27[32mgreen')
print('\27[33myellow')
print('\27[34mblue')
print('\27[35mpurple')
print('\27[36mlightgreen')
print('\27[37mwhite')
--]]
  print("\27[35m Pulling down first \27[37m")
  os.execute ('git pull')
  os.execute ('git add .')
  print("\27[32m Commiting with msg '" .. msg .. "' \27[37m")
  os.execute ("git commit -m '" .. msg .. "' ")
  print("\27[34m Pushing now to upstream \27[37m")
  os.execute ('git push origin master')
  long_string()
end

git_operation(arg[1])
