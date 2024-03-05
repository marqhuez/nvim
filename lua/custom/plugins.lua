return {
  {
    'christoomey/vim-tmux-navigator',
    lazy = false,
  },
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    init = function()
      require 'custom.config.harpoon'
    end,
  },
  {
    'ggandor/leap.nvim',
    init = function()
      require('leap').add_default_mappings()
    end,
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      require('catppuccin').setup { flavour = 'macchiato' }
      vim.cmd.colorscheme 'catppuccin'
    end,
  },
  {
    'numToStr/Comment.nvim',
    keys = {
      { 'gcc', mode = 'n', desc = 'Comment toggle current line' },
      { 'gc', mode = { 'n', 'o' }, desc = 'Comment toggle linewise' },
      { 'gc', mode = 'x', desc = 'Comment toggle linewise (visual)' },
      { 'gbc', mode = 'n', desc = 'Comment toggle current block' },
      { 'gb', mode = { 'n', 'o' }, desc = 'Comment toggle blockwise' },
      { 'gb', mode = 'x', desc = 'Comment toggle blockwise (visual)' },
    },
    config = function()
      require('Comment').setup()
    end,
  },
  {
    'nvimtools/none-ls.nvim',
    config = function()
      require 'custom.config.null-ls'
    end,
  },
  {
    'windwp/nvim-autopairs',
    opts = {
      fast_wrap = {},
      disable_filetype = { 'TelescopePrompt', 'vim' },
    },
    config = function(_, opts)
      require('nvim-autopairs').setup(opts)

      -- setup cmp for autopairs
      local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
      require('cmp').event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end,
  },
  {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    lazy = false,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('nvim-tree').setup {
        git = {
          ignore = false,
        },
      }
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    config = function()
      require 'custom.config.lualine'
    end,
  },
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = { 'markdown' },
    build = function()
      vim.fn['mkdp#util#install']()
    end,
    init = function()
      vim.g.mkdp_port = '8789'
    end,
  },
  {
    'svermeulen/vim-cutlass',
  },
  {
    'shuntaka9576/preview-asciidoc.vim',
    dependencies = {
      'vim-denops/denops.vim',
    },
  },
}
