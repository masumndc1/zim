#!/usr/bin/env lua

-- this script will print script name and
-- parameters of lua script 

function pos_param()
  for a=0, #arg do 
    print(arg[a])
    a = a +1 
  end
end

pos_param()
