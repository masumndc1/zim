print("=========================================================")
print("               LUA IO MODULE REFERENCE                   ")
print("=========================================================\n")

-- Helper function to print values alongside their precise data type
local function printResult(funcName, val1, val2)
    local valStr = tostring(val1)
    local typeStr = type(val1)
    if val2 ~= nil then
        valStr = valStr .. ", " .. tostring(val2)
        typeStr = typeStr .. ", " .. type(val2)
    end
    print(string.format("%-14s -> Returns: %-26s | Type: %s", funcName, valStr, typeStr))
end

-- Create dummy sandbox files for the demo operations
local textFile = "io_test_sandbox.txt"
local dumpFile = "io_test_output.txt"
local f = io.open(textFile, "w")
f:write("Line One\nLine Two\nLine Three\n")
f:close()

-- 1. io.open
local fileHandle, openErr = io.open(textFile, "r")
printResult("io.open", fileHandle, openErr)

-- 2. io.type
local handleType = io.type(fileHandle)
printResult("io.type", handleType)

-- 3. io.output
local currentOut = io.output(dumpFile) -- Redirects standard implicit output
printResult("io.output", currentOut)

-- 4. io.write
-- Since io.output was changed, this implicitly writes to 'io_test_output.txt'
local writeStatus = io.write("Implicit write payload data\n")
printResult("io.write", writeStatus)

-- Reset implicit output stream back to terminal stdout safely
io.output(io.stdout)

-- 5. io.input
local currentIn = io.input(textFile) -- Redirects standard implicit input
printResult("io.input", currentIn)

-- 6. io.read
-- Implicitly reads a single line from the textFile setup above
local readLine = io.read("l")
printResult("io.read", readLine)

-- Reset implicit input stream back to terminal stdin safely
io.input(io.stdin)

-- 7. io.flush
local flushStatus = io.flush()
printResult("io.flush", flushStatus)

-- 8. io.lines
-- Returns an iterator function loop that yields file lines sequentially
local linesIterator = io.lines(textFile)
printResult("io.lines", linesIterator)

-- 9. fileHandle:read (Explicit)
local explicitLine = fileHandle:read("l")
printResult("fh:read", explicitLine)

-- 10. fileHandle:seek
-- Moves file pointer offset to beginning of the file (0 bytes)
local currentPos = fileHandle:seek("set", 0)
printResult("fh:seek", currentPos)

-- 11. fileHandle:flush
local explicitFlush = fileHandle:flush()
printResult("fh:flush", explicitFlush)

-- 12. fileHandle:close
local closeStatus = fileHandle:close()
printResult("fh:close", closeStatus)

-- Show closed handle state modification
printResult("io.type(closed)", io.type(fileHandle))

-- 13. io.popen
-- Opens a one-way system process pipeline (e.g. system directory list command)
local isWindows = package.config:sub(1,1) == "\\"
local cmd = isWindows and "dir" or "ls"
local pipeHandle = io.popen(cmd)
printResult("io.popen", pipeHandle)
if pipeHandle then pipeHandle:close() end

-- Cleanup generated scratch files from filesystem
os.remove(textFile)
os.remove(dumpFile)
