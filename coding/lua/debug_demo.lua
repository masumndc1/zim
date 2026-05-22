print("=========================================================")
print("             LUA DEBUG MODULE REFERENCE                  ")
print("=========================================================\n")

-- Helper function to print values alongside their precise data type
local function printResult(funcName, val1, val2, val3)
    local valStr = tostring(val1)
    local typeStr = type(val1)
    if val2 ~= nil then
        valStr = valStr .. ", " .. tostring(val2)
        typeStr = typeStr .. ", " .. type(val2)
    end
    if val3 ~= nil then
        valStr = valStr .. ", " .. tostring(val3)
        typeStr = typeStr .. ", " .. type(val3)
    end
    print(string.format("%-18s -> Returns: %-26s | Type: %s", funcName, valStr, typeStr))
end

-- 1. debug (The Table Namespace Container)
printResult("1. debug Table", debug)

-- 2. debug.getinfo
local function infoDemo()
    local info = debug.getinfo(1, "Sln")
    printResult("2. debug.getinfo", info)
    print("                   └─ Function Name: " .. tostring(info.name))
end
infoDemo()

-- 3. debug.traceback
local function traceDemo()
    local stackTrace = debug.traceback("Ctx")
    printResult("3. debug.traceback", "string (multi-line)")
end
traceDemo()

-- 4 & 5. debug.getlocal & debug.setlocal
local function localDemo()
    local myVar = "Old"
    local name, val = debug.getlocal(1, 1)
    printResult("4. debug.getlocal", name, val)

    local setName = debug.setlocal(1, 1, "New")
    printResult("5. debug.setlocal", setName)
    print("                   └─ Variable Mutated To: " .. myVar)
end
localDemo()

-- 6 & 7. debug.getupvalue & debug.setupvalue
local upVar = "Outer"
local function closureDemo() return upVar end

local upName, upVal = debug.getupvalue(closureDemo, 1)
printResult("6. debug.getupvalue", upName, upVal)

local setUpName = debug.setupvalue(closureDemo, 1, "Mutated")
printResult("7. debug.setupvalue", setUpName)

-- 8 & 9. debug.getmetatable & debug.setmetatable
local primitiveNum = 77
local setMetaOk = debug.setmetatable(primitiveNum, { __index = { double = function(n) return n * 2 end } })
printResult("8. debug.setmetatable", setMetaOk)

local fetchedMeta = debug.getmetatable(primitiveNum)
printResult("9. debug.getmetatable", fetchedMeta)
print("                   └─ Metatable Applied Method: " .. primitiveNum:double())

-- 10 & 11. debug.gethook & debug.sethook
local function myHook() end
debug.sethook(myHook, "l")
local currentHook, mask, count = debug.gethook()
printResult("10. debug.gethook", currentHook, mask, count)

local clearHookOk = debug.sethook() -- Remove hook
printResult("11. debug.sethook", "void")

-- 12. debug.getregistry
local regTable = debug.getregistry()
printResult("12. debug.getregistry", regTable)

-- 13 & 14. debug.getuservalue & debug.setuservalue
local mockMetaTable = { customTag = "SecureStream" }
local setUsrOk = debug.setuservalue(io.stdout, mockMetaTable)
printResult("13. debug.setuservalue", setUsrOk)

local retrievedUsr = debug.getuservalue(io.stdout)
printResult("14. debug.getuservalue", retrievedUsr)

-- 15 & 16. debug.upvalueid & debug.upvaluejoin
local function factory(x) return function() return x end end
local f1 = factory(10)
local f2 = factory(20)

local id1 = debug.upvalueid(f1, 1)
printResult("15. debug.upvalueid", id1)

debug.upvaluejoin(f2, 1, f1, 1)
printResult("16. debug.upvaluejoin", "void")
print("                   └─ Re-checking IDs matching: " .. tostring(debug.upvalueid(f1, 1) == debug.upvalueid(f2, 1)))

-- 17. debug.debug
print("\n17. debug.debug")
print("  Launching dynamic live terminal loop.")
print("  -> TYPE: cont (to complete execution)")
debug.debug()
print("  Debug terminal gracefully suspended.")
