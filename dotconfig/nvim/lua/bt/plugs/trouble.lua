return {
	"folke/trouble.nvim",
	cmd = "Trouble",
	keys = {
		{
			"<leader>tt",
			"<cmd>Trouble diagnostics toggle<cr>",
		},
		{
			"<leader>tc",
			"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
		},
		{
			"<leader>ts",
			"<cmd>Trouble symbols toggle focus=false<cr>",
		},
		{
			"<leader>tl",
			"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
		},
		{
			"<leader>tL",
			"<cmd>Trouble loclist toggle<cr>",
		},
		{
			"<leader>tq",
			"<cmd>Trouble qflist toggle<cr>",
		},
	},
	config = function()
		local trouble = require("trouble")
		trouble.setup({
			auto_preview = false,
			user_diagnostic_signs = false,
			throttle = {
				delay = 50,
				max = 1000,
			},
			modes = {
				symbols = {
					symbols = {},
					filter = { fuzzy = false },
				},
			},
		})
	end,
}
