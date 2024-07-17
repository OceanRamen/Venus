local lovely = require ("lovely")
local nativefs = require ("nativefs")

assert(load(nativefs.read(lovely.mod_dir .. "/Venus/core/".."venus.lua")))()
assert(load(nativefs.read(lovely.mod_dir .. "/Venus/core/".."globals.lua")))()

function inspectDepth(tbl, indent, depth)
	if depth and depth > 5 then
		return "Depth limit reached"
	end

	if type(tbl) ~= "table" then
		return "Not a table"
	end

	local str = ""
	indent = indent or 0

	for k, v in pairs(tbl) do
		local formatting = string.rep("  ", indent) .. tostring(k) .. ": "
		if type(v) == "table" then
			str = str .. formatting .. "\n"
			str = str .. inspectDepth(v, indent + 1, (depth or 0) + 1)
		elseif type(v) == "function" then
			str = str .. formatting .. "function\n"
		elseif type(v) == "boolean" then
			str = str .. formatting .. tostring(v) .. "\n"
		else
			str = str .. formatting .. tostring(v) .. "\n"
		end
	end

	return str
end
