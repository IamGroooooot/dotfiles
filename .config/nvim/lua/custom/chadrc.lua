-- Just an example, supposed to be placed in /lua/custom/

local M = {}

M.plugins = {
   user = {
		["jose-elias-alvarez/null-ls.nvim"] = {
			after = "nvim-lspconfig",
			config = function()
				require("custom.plugins.null-ls")
			end,
		},
	},
}

return M
