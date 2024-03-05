local harpoon = require 'harpoon'

harpoon:setup {
  settings = {
    save_on_toggle = true,
  },
}

vim.keymap.set('n', '<leader>af', function()
  harpoon:list():append()
end, { desc = 'Add file to Harpoon' })
vim.keymap.set('n', '<leader>hg', function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, {
  desc = 'Open Harpoon GUI',
})

vim.keymap.set('n', '<leader>1', function()
  harpoon:list():select(1)
end, { desc = 'Goto Harpoon file 1' })
vim.keymap.set('n', '<leader>2', function()
  harpoon:list():select(2)
end, { desc = 'Goto Harpoon file 2' })
vim.keymap.set('n', '<leader>3', function()
  harpoon:list():select(3)
end, { desc = 'Goto Harpoon file 3' })
vim.keymap.set('n', '<leader>4', function()
  harpoon:list():select(4)
end, { desc = 'Goto Harpoon file 4' })

vim.keymap.set('n', '<C-A-p>', function()
  harpoon:list():prev()
end)
vim.keymap.set('n', '<C-A-n>', function()
  harpoon:list():next()
end)
