return {
  "folke/flash.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		search = {
			exclude = {
				"Telescope",
				"TelescopePrompt",
				"noice",
				"flash_prompt",
				"notify",
				"alpha",
				function(win)
					-- exclude non-focusable windows
					return not vim.api.nvim_win_get_config(win).focusable
				end,
			}
		},
		modes = {
			char = {
				keys = {}
			}
		},
		prompt = {
			enabled = false,
			prefix = {{ " " }}
		}
	}
}

