--   _____ _      ____  ____          _      
--  / ____| |    / __ \|  _ \   /\   | |     
-- | |  __| |   | |  | | |_) | /  \  | |     
-- | | |_ | |   | |  | |  _ < / /\ \ | |     
-- | |__| | |___| |__| | |_) / ____ \| |____ 
--  \_____|______\____/|____/_/    \_\______|
--  global variables are used for reusing variables
--  also for, access some useful settings in a single place

-- safe require ===================================================================
-- not break everything if any of plugin is broken
REQUIRE = function(module)
	local status_ok, plugin = pcall(require, module)

	if not status_ok then
		vim.notify("WARNING!!! " .. '"'.. module .. '"' .. " plugin is not found!!!")
		return
	end

	return plugin
end

-- lazy plugin manager ============================================================
LAZY = {}

