local fs = require("@lune/fs")
local stdio = require("@lune/stdio")
local process = require("@lune/process")
local argparse = require("../lune_packages/argparse")
local chalk = require("../luau_packages/chalk")
local fs_utils = require("./fs_utils")

local cli = argparse("maau", "The Many Accounts Audio Uploader for Roblox.")

local sync = cli:command(
	"sync",
	"Syncs assets. " .. "If targetting the cloud, audio uploads are spread across API Keys specified in -k"
)
do
	sync:option("-c --config", "Path to maau config file"):default(fs_utils.cwd_path(".maau", "config.toml"))
	sync:option("-k --keys", "Path to cloud API keys file"):default(fs_utils.cwd_path(".maau", "keys.toml"))
	sync:option("-t --target", "Where maau should sync assets to [possible values: cloud, studio, debug]")
	sync:option("--dry-run", "Skip asset syncing and only display what assets will be synced")
	sync:action(function(...)
		print(...)
	end)
end

local list = cli:command("list", "List assets in the lockfile")
do
end

local setup = cli:command("setup", "Configures maau in an existing directory")
do
	setup:argument("PATH"):default(".")
	setup:action(function(args: {
		PATH: string,
	})
		local config_directory = fs_utils.path(args.PATH, ".maau")
		fs_utils.touch_directory(config_directory)
		fs.writeFile(fs_utils.path(config_directory, "config.toml"), "")
		fs.writeFile(fs_utils.path(config_directory, "keys.toml"), "")
	end)
end

cli:parse()
