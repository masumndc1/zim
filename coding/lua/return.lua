-- pick a safe command to test (e.g., 'echo hello')
local cmd = "echo hello"

-- run the function and trap ALL return values inside a table
print("command: " .. cmd)
local returns = { os.execute(cmd) }

-- print the data type and value of every item returned
print("\n--- Return Format Results ---")
print("Total number of values returned: " .. #returns)
print("\n--- Return values ---")

for index, value in ipairs(returns) do
	print(index, value)
end
