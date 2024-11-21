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
				"alpha"
			}
		},
		prompt = {
			enabled = false,
			prefix = {{ " " }}
		}
	}
}

