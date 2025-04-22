return {
	"stevearc/conform.nvim",
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				go = { "gofmt", "goimports" },
				lua = { "stylua" },
			},
			format_on_save = {
				lsp_format = "fallback",
			},
		})
	end,
}
