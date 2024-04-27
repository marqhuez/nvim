local currentHour = tonumber(os.date '%H')
local theme = 'Tomorrow'

if currentHour >= 21 then
  theme = 'nightfly'
end

local opts = {
  options = {
    icons_enabled = false,
    theme = theme,
    component_separators = '|',
    section_separators = '',
  },
  extensions = {
    'nvim-tree',
  },
}

require('lualine').setup(opts)
