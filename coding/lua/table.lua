-- Define the target filename
local filename = "table_demo.lua"

-- The complete Lua source code to write
local scriptContent = [[
print("=========================================================")
print("             LUA TABLE MODULE REFERENCE                  ")
print("=========================================================\n")

-- Helper function to print values alongside their precise data type
local function printResult(funcName, result, altValue)
    local valStr = tostring(result)
    local typeStr = type(result)
    if altValue ~= nil then
        valStr = valStr .. ", " .. tostring(altValue)
        typeStr = typeStr .. ", " .. type(altValue)
    end
    print(string.format("%-15s -> Return Value(s): %-16s | Type: %s", funcName, valStr, typeStr))
end

-- Helper to format arrays cleanly for viewing
local function formatArray(arr)
    local items = {}
    for i = 1, #arr do items[i] = tostring(arr[i]) end
    return "{ " .. table.concat(items, ", ") .. " }"
end

-- 1. table.insert (Append mode)
local listA = {"Alpha", "Beta"}
table.insert(listA, "Gamma")
printResult("table.insert(3)", "void (mutates table)")
print("                 Current List: " .. formatArray(listA))

-- 2. table.insert (Positional shift mode)
table.insert(listA, 1, "First")
printResult("table.insert(pos)", "void (mutates table)")
print("                 Current List: " .. formatArray(listA))

-- 3. table.remove (Pop last element)
local popped = table.remove(listA)
printResult("table.remove()", popped)

-- 4. table.remove (Positional pull element)
local shifted = table.remove(listA, 1)
printResult("table.remove(pos)", shifted)
print("                 Remaining List: " .. formatArray(listA))

-- 5. table.concat
local segments = {"path", "to", "bin"}
local pathString = table.concat(segments, "/")
printResult("table.concat", pathString)

-- 6. table.sort (Default ascending numeric)
local scores = {80, 40, 95, 15}
table.sort(scores)
printResult("table.sort", "void (mutates table)")
print("                 Sorted Array: " .. formatArray(scores))

-- 7. table.sort (Custom comparator predicate)
local users = { {name="Zack", age=30}, {name="Alex", age=25} }
table.sort(users, function(a, b) return a.name < b.name end)
printResult("table.sort(comp)", "void (mutates table)")
print("                 Sorted Objects: " .. users[1].name .. ", " .. users[2].name)

-- 8. table.move
local source = {"X", "Y", "Z"}
local destination = {"A", "B", "C", "D", "E"}
-- Syntax: move(src, start, end, dest_start, dest)
local movedTable = table.move(source, 1, 2, 3, destination)
printResult("table.move", "returns dest table", type(movedTable))
print("                 Merged Array: " .. formatArray(destination))

-- 9. table.pack
-- Captures arguments safely including 'nil' values, generating a size metadata field 'n'
local packed = table.pack("Valid", nil, "Valid2")
printResult("table.pack", "table", type(packed))
print("                 Total Items Captured (packed.n): " .. packed.n)

-- 10. table.unpack
local rgb = {"Red", "Green", "Blue"}
local r, g, b = table.unpack(rgb)
print(string.format("%-15s -> Return Value(s): %-16s | Type: %s, %s, %s", "table.unpack", r..", "..g..", "..b, type(r), type(g), type(b)))
]]

-- Open the file for writing
local file, err = io.open(filename, "w")

if file then
	-- Write code content to disk file
	file:write(scriptContent)
	file:close()
	print("Success: File generated at '" .. filename .. "'\n")
	print("---------------------------------------------------------")
	print("                      RUNNING SCRIPT                     ")
	print("---------------------------------------------------------")

	-- Load and run the file immediately
	dofile(filename)
else
	print("Error creating demo file: " .. tostring(err))
end
