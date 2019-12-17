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
  print("pulling down first")
  os.execute ('git add .')
  print("commiting with msg")
  os.execute ("git commit -m '" .. msg .. "' ")
  print("pushing now to upstream")
  os.execute ('git push origin master')
  long_string()
end

--[[ 
 string=arg[1]
 print(string)
--]]

git_operation(arg[1])
