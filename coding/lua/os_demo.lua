print("=========================================================")
print("               LUA OS MODULE REFERENCE                   ")
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
    print(string.format("%-16s -> Returns: %-26s | Type: %s", funcName, valStr, typeStr))
end

-- Setup dummy files for filesystem function test cases
local setupFile = "os_sandbox_test.txt"
local f = io.open(setupFile, "w")
if f then f:write("data") f:close() end

-- 1. os.time (Without Arguments)
local currentTimestamp = os.time()
printResult("os.time()", currentTimestamp)

-- 2. os.time (With Explicit Date Table Parameter)
local customTimestamp = os.time({year=2026, month=1, day=1, hour=0, min=0, sec=0})
printResult("os.time(table)", customTimestamp)

-- 3. os.date (Formatted String output)
local dateString = os.date("%Y-%m-%d", currentTimestamp)
printResult("os.date(string)", dateString)

-- 4. os.date (Table generation mode via "*t")
local dateTable = os.date("*t", currentTimestamp)
printResult("os.date(table)", tostring(dateTable))

-- 5. os.difftime
local elapsedSeconds = os.difftime(currentTimestamp, customTimestamp)
printResult("os.difftime", elapsedSeconds)

-- 6. os.clock
local cpuTime = os.clock()
printResult("os.clock", cpuTime)

-- 7. os.getenv
-- Checks common cross-platform system keys
local systemEnv = os.getenv("HOME") or os.getenv("USERPROFILE") or "unknown"
printResult("os.getenv", systemEnv)

-- 8. os.execute
local execSuccess, execType, execCode = os.execute("echo 'Payload'")
printResult("os.execute", execSuccess, execType, execCode)

-- 9. os.rename
local renameSuccess, renameErr = os.rename(setupFile, "os_sandbox_renamed.txt")
printResult("os.rename", renameSuccess, renameErr)

-- 10. os.remove
local removeSuccess, removeErr = os.remove("os_sandbox_renamed.txt")
printResult("os.remove", removeSuccess, removeErr)

-- 11. os.tmpname
local tempFilename = os.tmpname()
printResult("os.tmpname", tempFilename)

-- 12. os.setlocale
local localeResult = os.setlocale("C", "all")
printResult("os.setlocale", localeResult)

-- 13. os.exit
print("\n13. os.exit")
print("  Terminating script immediately with code 0 (Success)...")
os.exit(0)

print("This line will never be seen.")
