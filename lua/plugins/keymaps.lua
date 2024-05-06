-- telescope

local builtin = require('telescope.builtin')
vim.keymap.set('n', 'ff', builtin.find_files, {})
vim.keymap.set('n', 'fg', builtin.live_grep, {})
vim.keymap.set('n', 'fb', builtin.buffers, {})
vim.keymap.set('n', 'fh', builtin.help_tags, {})

-- tree

vim.keymap.set('n', 'ne', ':NvimTreeFindFileToggle<cr>')

-- buffers

vim.keymap.set('n', 'n', ':bn<cr>')
vim.keymap.set('n', 'p', ':bp<cr>')
vim.keymap.set('n', 'x', ':bd<cr>')
