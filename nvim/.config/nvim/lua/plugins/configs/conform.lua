local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { "prettierd", "prettier", stop_after_first = true },
		typescript = { "prettierd", "prettier", stop_after_first = true },
		javascriptreact = { "prettierd", "prettier", stop_after_first = true },
		typescriptreact = { "prettierd", "prettier", stop_after_first = true },
		html = { "prettierd", "prettier", "htmlbeautifier", stop_after_first = true },
		css = { "prettierd", "prettier", stop_after_first = true },
		scss = { "prettierd", "prettier", stop_after_first = true },
		json = { "prettierd", "prettier", stop_after_first = true },
		yaml = { "prettierd", "prettier", "yamlfix", stop_after_first = true },
		markdown = { "prettierd", "prettier", stop_after_first = true },
		graphql = { "prettierd", "prettier", stop_after_first = true },
		python = { "isort ", "black", stop_after_first = false },
		svelte = { "prettierd", "prettier", stop_after_first = true },
		java = { "gogle-java-format" },
		kotlin = { "ktlint" },
		ruby = { "standardrb" },
		erb = { "htmlbeautifier" },
		bash = { "beautysh" },
		proto = { "buf" },
		rust = { "rustfmt" },
		toml = { "taplo" },
	}
})


