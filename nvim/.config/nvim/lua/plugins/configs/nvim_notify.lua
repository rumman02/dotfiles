local nvim_notify = require("notify")

---@diagnostic disable-next-line: undefined-field
nvim_notify.setup({
	icons = {
		DEBUG = "",
		ERROR = "",
		INFO = "",
		TRACE = "✎",
		WARN = "",
	},
	minimum_width = 10,
	render = "compact",
	stages = "slide",
	time_formats = {
		notification = "%T",
		notification_history = "%FT%T",
	},
	timeout = 2000,
	animate = true,
})

