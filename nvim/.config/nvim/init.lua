--  _   _ ______ ______      _______ __  __ 
-- | \ | |  ____/ __ \ \    / /_   _|  \/  |
-- |  \| | |__ | |  | \ \  / /  | | | \  / |
-- | . ` |  __|| |  | |\ \/ /   | | | |\/| |
-- | |\  | |___| |__| | \  /   _| |_| |  | |
-- |_| \_|______\____/   \/   |_____|_|  |_|
-- https://neovim.io

-- user globals ===================================================================
require("user.globals")

-- nvim options ===================================================================
require("core.options")

-- lazy plugin manager ============================================================
require("lazy.init")

-- user globals ===================================================================
require("core.commands")

-- user autocmds ==================================================================
require("user.autocmds")

