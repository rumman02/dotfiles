return {
	{
		"ellisonleao/gruvbox.nvim",
		cmd = { "Colorscheme gruvbox" },
		priority = 1000,
		opts = {
			contrast = "",
			overrides = {
				SignColumn = { bg = "none" },
				FlashLabel = { fg = "#fff100" },
				-- FloatBorder = { link = "GruvboxBg2" },
				-- CmpBorder = { link = "GruvboxBg2" },
				-- CmpDocBorder = { link = "GruvboxBg2" },
				-- WhichKeyBorder = { link = "GruvboxBg2" },
				-- NeotreeNormal = { bg = "#1c1c1c" },
				-- NeotreeNormalNC = { bg = "#1c1c1c" },
			},
			dim_inactive = false,
			transparent_mode = false,
		}
	}
}

