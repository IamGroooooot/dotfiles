local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {
   b.formatting.prettierd.with { filetypes = { "html", "markdown", "css", "typescript", "typescriptreact", "javascript", "javascriptreact", "json" } },
   b.code_actions.eslint_d.with { filetypes = {"javascript", "javascriptreact", "typescript", "typescriptreact"} },
}

require("null-ls").setup({
  debug = true,
  sources = sources,

  -- format on save
  on_attach = function(client)
      if client.server_capabilities.documentFormattingProvider then
        vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()"
      end
  end,
})