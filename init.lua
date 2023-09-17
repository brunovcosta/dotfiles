local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')
Plug('brunovcosta/crossover')
Plug('neovim/nvim-lspconfig')
Plug('nvim-lua/plenary.nvim')
Plug(
  'mrcjkb/haskell-tools.nvim',{
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  branch = '2.x.x', -- Recommended
  ft = { 'haskell', 'lhaskell', 'cabal', 'cabalproject' },
})
-- Language Server
Plug("junegunn/fzf", {run = ":call fzf#install()" })
vim.call('plug#end')

-- FZF
vim.api.nvim_set_keymap('n', '<C-p>', ':FZF<CR>', {noremap = true})

-- Crossover
vim.g.crossover_insert_color = 53
vim.g.crossover_normal_color = 55

-- Setup language servers.
local lspconfig = require('lspconfig')
lspconfig.pyright.setup {}
lspconfig.tsserver.setup {}


-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

-- Personal modifications
vim.wo.scroll = 3
vim.wo.relativenumber = true
vim.wo.number = true
vim.wo.wrap = false
vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.bo.shiftwidth = 4
vim.bo.autoindent = true
vim.o.hlsearch = true
vim.o.incsearch = true
vim.bo.swapfile = false
vim.o.list = true
vim.o.listchars = 'tab:| '
vim.o.mouse = 'nv'

-- Navigation between panels
vim.api.nvim_set_keymap('n', '<C-j>', '<C-W>j', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-W>k', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-h>', '<C-W>h', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-W>l', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-Down>', '<C-W>j', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-Up>', '<C-W>k', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-Left>', '<C-W>h', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-Right>', '<C-W>l', {noremap = true})
vim.api.nvim_set_keymap('n', '<BS>', 'X', {noremap = true})

-- Vim render error with tmux
vim.o.enc = 'utf-8'

-- Default register unnamedplus
vim.o.clipboard = 'unnamedplus'

vim.cmd("syntax on")

