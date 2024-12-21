local function requires(packages)
	require("rumman." .. packages)
end

requires("config.options")
requires("config.autocmds")
requires("lib.keys")
requires("config.lazy")
requires("config.keymaps")
requires("after.config.others")

