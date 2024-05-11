local null_ls = require 'null-ls'

local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics

local sources = {
  formatting.prettierd,
  formatting.prettierd.with {
    extra_filetypes = { 'prisma', 'astro', 'svelte', 'vue' },
  },
  formatting.phpcsfixer,
  formatting.black,
  formatting.gofmt,
  lint.eslint,
  lint.phpcs.with {
    extra_args = function()
      if vim.fn.filereadable 'phpcs.xml' == 1 then
        return { 'phpcs.xml' }
      else
        return {}
      end
    end,
  },
  lint.phpmd.with {
    extra_args = function()
      if vim.fn.filereadable 'phpmd.xml' == 1 then
        return { 'phpmd.xml' }
      else
        return { 'cleancode,codesize,controversial,design,naming,unusedcode' }
      end
    end,
  },
  formatting.stylua,
  lint.shellcheck,
}

-- local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

null_ls.setup {
  sources = sources,
  -- on_attach = function(client, bufnr)
  -- if client.supports_method 'textDocument/formatting' then
  --   vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
  --   vim.api.nvim_create_autocmd('BufWritePre', {
  --     group = augroup,
  --     buffer = bufnr,
  --     callback = function()
  --       vim.lsp.buf.format {
  --         filter = function(client)
  --           -- apply whatever logic you want (in this example, we'll only use null-ls)
  --           return client.name == 'null-ls'
  --         end,
  --         bufnr = bufnr,
  --       }
  --     end,
  --   })
  -- end
  -- end,
}
