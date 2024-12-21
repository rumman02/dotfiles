local comment = require("Comment")
local comment_leader = require("rumman.lib.keys").comment.leaders.globals

comment.setup({
	toggler = {
		line = comment_leader .. "l",
		block = comment_leader .. "b",
	},
	opleader = {
		line = comment_leader .. "l",
		block = comment_leader .. "b",
	},
	extra = {
		above = comment_leader .. "O",
		below = comment_leader .. "o",
		eol = comment_leader .. "A",
	},
})

