#!/usr/bin/env lua

-- a simple lua script to test something

function ping_test()
  os.execute('ping -c 2 ' .. arg[1])
end

ping_test(arg[1])
