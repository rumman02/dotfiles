--   _____ _      ____  ____          _      
--  / ____| |    / __ \|  _ \   /\   | |     
-- | |  __| |   | |  | | |_) | /  \  | |     
-- | | |_ | |   | |  | |  _ < / /\ \ | |     
-- | |__| | |___| |__| | |_) / ____ \| |____ 
--  \_____|______\____/|____/_/    \_\______|
--  global variables are used for reusing variables
--  also for, access some useful settings in a single place

-- variables ======================================================================
local g = vim.g

-- safe require ===================================================================
REQUIRE = function(module)
	-- not break everything if any of plugin is broken
	local status_ok, plugin = pcall(require, module)

	if not status_ok then
		vim.notify("WARNING!!! " .. '"'.. module .. '"' .. " plugin is not found!!!")
		return
	end

	return plugin
end

-- map leaders ====================================================================
g.mapleader = " "
g.maplocalleader = ";"
BUFLEADER = "\\"
LSPLEADER = ","

-- lazy plugin manager ============================================================
LAZY = {}

