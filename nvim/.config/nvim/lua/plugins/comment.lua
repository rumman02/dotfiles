return{
	"numToStr/Comment.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		toggler = {
			line = "gcl",
			block = "gcb"
		},
		opleader = {
			line = "gcl",
			block = "gcb"
		},
		extra = {
			above = "gcO",
			below = "gco",
			eol = "gcA",
		}
	}
}

