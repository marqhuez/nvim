vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.relativenumber = true

vim.opt.clipboard = 'unnamedplus'
vim.cmd [[highlight Cursor guifg=white guibg=#9d9d9d]]
vim.opt.swapfile = false
require 'custom.mappings'

local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
parser_config.embedded_template = {
  install_info = {
    url = 'https://github.com/tree-sitter/tree-sitter-embedded-template',
    files = { 'src/parser.c' },
    requires_generate_from_grammar = true,
  },
  filetype = 'ejs',
}
