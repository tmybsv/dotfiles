return {
	"mishkafreddy2009/fzyf.nvim",
	config = function()
		local fzyf = require("fzyf")
		fzyf.setup({
			vim.keymap.set("n", "<leader>ff", ":FzyfFindFile<CR>"),
			vim.keymap.set("n", "<leader>fl", ":FzyfLiveGrep<CR>"),
			vim.keymap.set("n", "<leader>fn", ":FzyfLookupConfig<CR>"),
		})
	end,
}
