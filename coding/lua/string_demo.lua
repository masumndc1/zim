print("=========================================================")
print("             LUA STRING MODULE REFERENCE                 ")
print("=========================================================\n")

-- Helper function to print values alongside their precise data type
local function printResult(funcName, result)
	print(string.format("%-18s -> Return Value: %-16s | Type: %s", funcName, tostring(result), type(result)))
end

-- 1. string.len
local length = string.len("Hello")
printResult("string.len", length)

-- 2. string.lower
local lowerStr = string.lower("LUA Programming")
printResult("string.lower", lowerStr)

-- 3. string.upper
local upperStr = string.upper("lua programming")
printResult("string.upper", upperStr)

-- 4. string.reverse
local reversed = string.reverse("stressed")
printResult("string.reverse", reversed)

-- 5. string.rep
local repeated = string.rep("Abc", 3, "-")
printResult("string.rep", repeated)

-- 6. string.sub
local substring = string.sub("StandardLua", 9, 11)
printResult("string.sub", substring)

-- 7. string.byte
local internalByte = string.byte("A")
printResult("string.byte", internalByte)

-- 8. string.char
local character = string.char(66)
printResult("string.char", character)

-- 9. string.format
local formatted = string.format("Score: %d out of %d", 95, 100)
printResult("string.format", formatted)

-- 10. string.find
-- Returns starting index, ending index of matches
local startIdx, endIdx = string.find("The quick brown fox", "brown")
print(
	string.format(
		"%-18s -> Return Values: %-16s | Type: %s, %s",
		"string.find",
		startIdx .. ", " .. endIdx,
		type(startIdx),
		type(endIdx)
	)
)

-- 11. string.match
-- Extracts specific matched text via string patterns
local contentMatch = string.match("Item ID: #4912", "%d+")
printResult("string.match", contentMatch)

-- 12. string.gmatch
-- Returns an iterator function used for structural processing loops
local iterator = string.gmatch("Word1 Word2", "%w+")
printResult("string.gmatch", iterator)

-- 13. string.gsub
-- Replaces instances and returns modified string plus substitution total count
local modifiedStr, replacementCount = string.gsub("apple, banana, apple", "apple", "kiwi")
print(
	string.format(
		"%-18s -> Return Values: %-16s | Type: %s, %s",
		"string.gsub",
		"'" .. modifiedStr .. "', " .. replacementCount,
		type(modifiedStr),
		type(replacementCount)
	)
)

-- 14. string.pack
-- Binds data structures into a binary byte string format (e.g., '>i4' is Big-Endian 4-byte Int)
local binaryData = string.pack(">i4", 1024)
printResult("string.pack", "Binary Data String")

-- 15. string.unpack
-- Extracts values directly from binary data strings
local unpackedValue, nextPos = string.unpack(">i4", binaryData)
print(
	string.format(
		"%-18s -> Return Values: %-16s | Type: %s, %s",
		"string.unpack",
		unpackedValue .. ", " .. nextPos,
		type(unpackedValue),
		type(nextPos)
	)
)
