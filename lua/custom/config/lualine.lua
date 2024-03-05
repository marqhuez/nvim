local opts = {
  options = {
    icons_enabled = false,
    theme = 'nightfly',
    component_separators = '|',
    section_separators = '',
  },
  extensions = {
    'nvim-tree',
  },
}

require('lualine').setup(opts)
