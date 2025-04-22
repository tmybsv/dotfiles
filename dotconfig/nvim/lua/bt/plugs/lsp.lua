return {
	"neovim/nvim-lspconfig",
	config = function()
		vim.diagnostic.config({
			float = {
				border = "none",
			},
			update_in_insert = false,
			virtual_text = true,
			severity_sort = true,
		})

		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(event)
				local opts = { buffer = event.buf }

				local function map(mode, lhs, rhs)
					vim.keymap.set(mode, lhs, rhs, vim.tbl_extend("force", opts, {}))
				end

				map("n", "gd", vim.lsp.buf.definition)
				map("n", "gD", vim.lsp.buf.declaration)
				map("n", "gl", vim.diagnostic.open_float)
				map("n", "K", vim.lsp.buf.hover)
				map("n", "<leader>ca", vim.lsp.buf.code_action)
				map("n", "<leader>rn", vim.lsp.buf.rename)
				map("i", "<c-h>", vim.lsp.buf.signature_help)
			end,
		})

		local lspconfig = require("lspconfig")
		local servers = {
			gopls = {
				telemetry = {
					enabled = false,
				},
			},
			ccls = {},
			pyright = {},
			lua_ls = {
				settings = {
					Lua = {
						runtime = { version = "LuaJIT" },
						diagnostics = { globals = { "vim" } },
						workspace = { library = vim.api.nvim_get_runtime_file("", true) },
						telemetry = { enable = false },
					},
				},
			},
		}

		for server, config in pairs(servers) do
			lspconfig[server].setup(config)
		end
	end,
}
