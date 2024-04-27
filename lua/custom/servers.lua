local servers = {
  phpactor = {},
  svelte = { filetypes = { 'svelte' } },
  tsserver = {
    filetypes = { 'vue', 'typescript' },
    init_options = {
      plugins = {
        {
          name = '@vue/typescript-plugin',
          location = '/home/marqhuez/.nvm/versions/node/v20.11.1/lib/node_modules/@vue/typescript-plugin',
          languages = { 'typescript', 'vue' },
        },
      },
    },
  },
  tailwindcss = {},
  pylsp = {},
  -- clangd = {},
  -- gopls = {},
  -- pyright = {},
  -- rust_analyzer = {},
  -- tsserver = {},
  -- html = { filetypes = { 'html', 'twig', 'hbs'} },

  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
      -- NOTE: toggle below to ignore Lua_LS's noisy `missing-fields` warnings
      -- diagnostics = { disable = { 'missing-fields' } },
    },
  },
}

return servers
