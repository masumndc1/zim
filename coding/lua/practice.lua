#!/usr/bin/lua

     do
       local var, limit, step = 10, 100, 2
       if not (var and limit and step) then error() end
       while (step > 0 and var <= limit) or (step <= 0 and var >= limit) do
         -- local v = 2
         print(var)
         var = var + step
       end
     end
     -- [[ this is written as comment]]
