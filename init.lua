local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')

-- Plugins essenciais
Plug('brunovcosta/crossover')
Plug('neovim/nvim-lspconfig')
Plug('github/copilot.vim')
Plug('nvim-lua/plenary.nvim')
Plug('junegunn/fzf', {['do'] = vim.fn['fzf#install']})

-- Plugins para desenvolvimento web
Plug("pangloss/vim-javascript")
Plug("leafgarland/typescript-vim")
Plug("maxmellon/vim-jsx-pretty")
Plug("jparise/vim-graphql")

vim.call('plug#end')

-- FZF
vim.api.nvim_set_keymap('n', '<C-p>', ':FZF<CR>', { noremap = true, silent = true })

-- Configurações do Crossover
vim.g.crossover_insert_color = 53
vim.g.crossover_normal_color = 55

-- Configuração dos servidores de linguagem
local lspconfig = require('lspconfig')
lspconfig.pyright.setup {}
lspconfig.tsserver.setup {}

-- Mapas globais para diagnósticos
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Autocomando para mapear teclas após a conexão do LSP
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Habilitar a conclusão desencadeada por <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Mapas locais do buffer
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

-- Modificações pessoais
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

-- Navegação entre painéis
vim.api.nvim_set_keymap('n', '<C-j>', '<C-W>j', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-W>k', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-h>', '<C-W>h', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-W>l', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-Down>', '<C-W>j', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-Up>', '<C-W>k', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-Left>', '<C-W>h', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-Right>', '<C-W>l', { noremap = true })
vim.api.nvim_set_keymap('n', '<BS>', 'X', { noremap = true })

-- Configuração de renderização para tmux
vim.o.enc = 'utf-8'

-- Registro padrão unnamedplus
vim.o.clipboard = 'unnamedplus'

-- Ativar a sintaxe
vim.cmd("syntax on")
