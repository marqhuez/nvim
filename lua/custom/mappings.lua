local M = {}

M.general = {
  n = {
    ['<C-h>'] = { '<cmd> TmuxNavigateLeft<CR>', 'Window Left' },
    ['<C-l>'] = { '<cmd> TmuxNavigateRight<CR>', 'Window Right' },
    ['<C-j>'] = { '<cmd> TmuxNavigateUp<CR>', 'Window Up' },
    ['<C-k>'] = { '<cmd> TmuxNavigateDown<CR>', 'Window Down' },
  },
}

M.custom = {
  n = {
    ['<C-c>'] = { 'y', 'Copy' },
    ['<C-z>'] = { 'u', 'Undo' },
    ['<C-y>'] = { '<C-r>', 'Redo' },
    -- ['<C-s>'] = { '<cmd> w <CR>', 'Save' },
    ['<C-s>'] = {
      function()
        vim.cmd [[w]]
        vim.lsp.buf.format()
      end,
      'Save and format',
    },
    ['<A-d>'] = { 'yyp', 'Duplicate line' },
    --       vim.lsp.buf.format {

    ['j'] = { 'k', 'Up' },
    ['k'] = { 'j', 'Down' },

    ['<C-d>'] = { '<C-d>zz' },
    ['<C-u>'] = { '<C-u>zz' },

    ['<Leader>cs'] = { ':lua vim.lsp.buf.hover()<CR>', 'Show tooltip' },
    ['<leader>rl'] = { '<cmd> set rnu! <CR>', 'Toggle relative number' },

    ['<C-h>'] = { '<C-w>h', 'Window left' },
    ['<C-l>'] = { '<C-w>l', 'Window right' },
    ['<C-j>'] = { '<C-w>j', 'Window down' },
    ['<C-k>'] = { '<C-w>k', 'Window up' },

    ['<C-n>'] = { '<cmd> NvimTreeToggle <CR>', 'Toggle nvimtree' },

    ['K'] = {
      function()
        vim.lsp.buf.hover()
      end,
      'LSP hover',
    },

    ['gi'] = {
      require('telescope.builtin').lsp_implementations,
      'LSP implementation',
    },

    ['<C-p>'] = {
      function()
        vim.lsp.buf.signature_help()
      end,
      'LSP signature help',
    },

    ['<leader>D'] = {
      function()
        vim.lsp.buf.type_definition()
      end,
      'LSP definition type',
    },

    ['<leader>ca'] = {
      function()
        vim.lsp.buf.code_action()
      end,
      'LSP code action',
    },

    ['<leader>fd'] = {
      function()
        vim.diagnostic.open_float { border = 'rounded' }
      end,
      'Floating diagnostic',
    },

    ['<leader>q'] = {
      function()
        vim.diagnostic.setloclist()
      end,
      'Diagnostic setloclist',
    },

    ['<leader>mp'] = { ':MarkdownPreviewToggle<CR>', 'Toggle Markdown Preview' },
    ['<leader>ap'] = { ':AsciidocPreview<CR>', 'Asciidoc Preview' },

    ['<C-o>'] = { '<C-o>zz' },

    ['x'] = { 'd', 'Cut' },
    ['xx'] = { 'dd', 'Cut' },

    ['í'] = { 'dl', 'Delete char' },

    ['<leader>x'] = { ':q<CR>', 'Close buffer' },

    ['<leader>tf'] = { ':NvimTreeFindFile<CR>', 'Find current file in tree' },

    ['<leader>lr'] = { ':LspRestart<CR>', 'Restart LSP Server' },
  },
  s = {
    ['j'] = { 'k', 'Up' },
    ['k'] = { 'j', 'Down' },
  },
  x = {
    ['j'] = { 'k', 'Up' },
    ['k'] = { 'j', 'Down' },

    ['x'] = { 'd', 'Cut' },
  },
  v = {
    ['<C-z>'] = { 'u', 'Undo' },
    ['<C-y>'] = { '<C-r>', 'Redo' },
    ['j'] = { 'k', 'Up' },
    ['k'] = { 'j', 'Down' },
    ['J'] = { ":m '<-2<CR>gv=gv" },
    ['K'] = { ":m '>+1<CR>gv=gv" },

    ['x'] = { 'd', 'Cut' },

    ['p'] = { '"_dP' },

    ['v'] = { '<Esc>', 'Exit visual mode' },
  },
  i = {
    ['<C-z>'] = { '<C-o>:u<CR>', 'Undo' },
    ['<C-y>'] = { '<C-o><C-r>', 'Redo' },
    ['<C-s>'] = { '<cmd> w <CR>', 'Save' },
    ['jk'] = { '<Esc>', 'Exit insert mode' },
    ['kj'] = { '<Esc>', 'Exit insert mode' },
    ['<C-d>'] = { '<C-o>yy<C-o>p', 'Duplicate line' },

    ['<C-h>'] = { '<Left>', 'Move left' },
    ['<C-j>'] = { '<Up>', 'Move up' },
    ['<C-k>'] = { '<Down>', 'Move down' },
    ['<C-l>'] = { '<Right>', 'Move right' },

    ['<C-e>'] = { '<C-o>e<C-o>l', 'Jump a word' },
    ['<C-b>'] = { '<C-o>b<C-o>h', 'Jump a word' },

    ['<C-p>'] = {
      function()
        vim.lsp.buf.signature_help()
      end,
      'LSP signature help',
    },
  },
  o = {
    ['j'] = { 'k', 'Up' },
    ['k'] = { 'j', 'Down' },
  },
}

local function set_section_map(section_values)
  if section_values.plugin then
    return
  end

  section_values.plugin = nil

  for mode, mode_values in pairs(section_values) do
    local default_opts = vim.tbl_deep_extend('force', { mode = mode }, mapping_opt or {})
    for keybind, mapping_info in pairs(mode_values) do
      -- merge default + user opts
      local opts = vim.tbl_deep_extend('force', default_opts, mapping_info.opts or {})

      mapping_info.opts, opts.mode = nil, nil
      opts.desc = mapping_info[2]

      vim.keymap.set(mode, keybind, mapping_info[1], opts)
    end
  end
end

for _, sect in pairs(M) do
  set_section_map(sect)
end

vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>fw', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })

vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
