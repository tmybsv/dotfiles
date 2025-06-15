return {
	"stevearc/conform.nvim",
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				go = { "gofmt", "goimports" },
				lua = { "stylua" },
				proto = { "buf" },
				json = { "prettier" },
				-- markdown = { "prettier" },
				yaml = { "prettier" },
				sql = { "pg_format" },
			},
			format_after_save = {
				lsp_format = "fallback",
			},
			-- format_on_save = {
			-- 	lsp_format = "fallback",
			-- 	timeout_ms = 500,
			-- },
		})
	end,
}
