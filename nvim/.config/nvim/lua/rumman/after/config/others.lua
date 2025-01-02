local icons = require("rumman.lib.icons")

vim.fn.sign_define("DiagnosticSignError", { text = icons.diagnostics.Error, texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = icons.diagnostics.Warning, texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = icons.diagnostics.Information, texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = icons.diagnostics.Hint, texthl = "DiagnosticSignHint" })

vim.fn.sign_define("DapBreakpoint", { text = icons.ui.CirclePause, texthl = "Changed", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointCondition", { text = icons.ui.CirclePause, texthl = "Changed", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointRejected", { text = icons.ui.CircleCross, texthl = "", linehl = "@comment.error", numhl = "" })
vim.fn.sign_define("DapStopped", { text = icons.ui.CircleRight, texthl = "", linehl = "@diff.plus", numhl = "" })

vim.diagnostic.config({
  virtual_text = {
    prefix = icons.ui.Circle,
  }
})

