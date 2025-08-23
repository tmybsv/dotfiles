return {
	"tmybsv/blame.nvim",
	config = function()
		local blame = require("blame")
		blame.setup({
			vim.keymap.set("n", "<leader>gb", "<cmd>BlameToggle<CR>"),
		})
	end,
}
