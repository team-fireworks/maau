local process = require("@lune/process")
local fs = require("@lune/fs")

local cwd = process.cwd
local delimiter = if process.os == "windows" then "\\" else "/"

local function path(...: string): string
	return table.concat({ ... }, delimiter)
end

local function cwd_path(...: string): string
	return cwd .. path(...)
end

local function touch_directory(...: string): string?
	local dir = path(...)
	if not fs.isDir(dir) then
		fs.writeDir(dir)
	end
	return dir
end

local function touch_cwd_directory(...: string): string?
	local dir = cwd_path(...)
	if not fs.isDir(dir) then
		fs.writeDir(dir)
	end
	return dir
end

return table.freeze({
	cwd = cwd,
	delimiter = delimiter,
	path = path,
	cwd_path = cwd_path,
	touch_directory = touch_directory,
	touch_cwd_directory = touch_cwd_directory,
	read_file = fs.readFile,
	read_dir = fs.readDir,
})
