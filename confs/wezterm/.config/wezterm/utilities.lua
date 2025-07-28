local wez = require("wezterm")

---@private
---@class bar.utilities
local H = {}

---@type string
H.home = (os.getenv("USERPROFILE") or os.getenv("HOME") or wez.home_dir or ""):gsub("\\", "/")

---@type boolean
H.is_windows = package.config:sub(1, 1) == "\\"

---waits for a specified throttle time before proceeding.
---@param throttle number
---@param last_update number
---@return boolean
H._wait = function(throttle, last_update)
	local current_time = os.time()
	return current_time - last_update < throttle
end

---get basename for dir/file, removing ft and path
---@param s string
---@return string?
---@return number?
H._basename = function(s)
	if type(s) ~= "string" then
		return nil
	end
	local name = s:match("[^/\\]*$") -- match everything after the last / or \
	if name then
		return name:gsub("%.%w+$", "") -- remove extension if present
	end
	return nil
end

---add spaces to each side of a string
---@param s string
---@param space number
---@param trailing_space number
---@return string
H._space = function(s, space, trailing_space)
	if type(s) ~= "string" or type(space) ~= "number" then
		return ""
	end
	local spaces = string.rep(" ", space)
	local trailing_spaces = spaces
	if trailing_space ~= nil then
		trailing_spaces = string.rep(" ", trailing_space)
	end
	return spaces .. s .. trailing_spaces
end

-- local helper to check if a table is a list
local function is_list(t)
	if type(t) ~= "table" then
		return false
	end
	local count = 0
	for _ in pairs(t) do
		count = count + 1
	end
	return #t == count
end

--- Performs a deep merge of `src` into `dest`.
--- It recursively merges map-like tables.
--- NOTE: This function has specific behavior for lists. If both `dest` and `src` are
--- considered lists (no string keys), it will concatenate them. However, this can
--- lead to unexpected deep-merging of list elements if one of them is not a pure list.
--- For simple list concatenation, prefer using `H.concat`.
--- Use `H.merge` for deeply nested configuration tables where you want to merge values.
---
--- @param dest table The destination table, which will be modified.
--- @param src table The source table.
--- @return table The modified destination table.
function H.merge(dest, src)
	if is_list(dest) and is_list(src) then
		for _, v in ipairs(src) do
			table.insert(dest, v)
		end
		return dest
	end

	-- Otherwise, deep merge them as maps
	for k, v in pairs(src) do
		if type(v) == "table" and not is_list(v) then
			if type(dest[k]) ~= "table" or is_list(dest[k]) then
				dest[k] = {} -- Create a new map if one doesn't exist or is a list
			end
			H.merge(dest[k], v)
		else
			dest[k] = v
		end
	end
	return dest
end

--- Concatenates multiple lists into a single new list.
--- This is a shallow, safe operation for combining lists like keybindings.
--- It creates a new list containing elements from all provided lists, preserving the originals.
--- Use this instead of `H.merge` when you simply want to append lists together.
---
--- @param ... any number of list-like tables to concatenate.
--- @return table A new table containing all elements from the provided lists.
function H.concat(...)
	local new_list = {}
	for i = 1, select("#", ...) do
		local list = select(i, ...)
		if type(list) == "table" then
			for _, v in ipairs(list) do
				table.insert(new_list, v)
			end
		end
	end
	return new_list
end

return H
