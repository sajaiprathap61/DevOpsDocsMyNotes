" ------------------------
" General Settings
" ------------------------

" Enable line numbers
set number

" Enable relative line numbers
"set relativenumber

" Enable syntax highlighting
syntax enable

" Set color scheme
colorscheme desert

" Enable line wrapping
set wrap

" Enable auto-indentation for better code formatting
filetype plugin indent on

" Show matching parentheses and brackets
set showmatch

" Enable auto-completion (for better completion experience)
set completeopt=menuone,noinsert,noselect

" Enable mouse support
set mouse=a

" Enable search highlighting
set hlsearch

" Enable incremental search
set incsearch

" Set tab and indentation settings
set tabstop=2
set shiftwidth=2
set expandtab

" Enable auto-save for undo history
set undofile
set undodir=~/.vim/undodir

" ------------------------
" Plugin Configuration (Using Vim-Plug)
" ------------------------

call plug#begin('~/.local/share/nvim/plugged')

" Plugin for LSP and auto-completion
Plug 'neovim/nvim-lspconfig'                 " LSP support
Plug 'hrsh7th/nvim-cmp'                     " Auto-completion plugin
Plug 'hrsh7th/cmp-nvim-lsp'                 " LSP completion source for nvim-cmp
Plug 'hrsh7th/cmp-buffer'                   " Buffer completion source for nvim-cmp
Plug 'hrsh7th/cmp-path'                     " Path completion source for nvim-cmp
Plug 'L3MON4D3/LuaSnip'                     " Snippets
Plug 'saadparwaiz1/cmp_luasnip'             " LuaSnip source for nvim-cmp

" Plugin for Treesitter (Improves syntax highlighting and other features)
"Plug 'nvim-treesitter/nvim-treesitter'      " Syntax highlighting and parsing
"Plug 'nvim-treesitter/nvim-treesitter-refactor'  " Refactor features
"Plug 'nvim-treesitter/playground'           " Playground to visualize tree-sitter

" Plugin for File Explorer
Plug 'preservim/nerdtree'                   " NERDTree file explorer
Plug 'ryanoasis/vim-devicons'               " Devicons for NERDTree

" Git integration
Plug 'tpope/vim-fugitive'                   " Git commands in Neovim

" Plugin for React (JSX, TSX, etc.)
Plug 'pangloss/vim-javascript'              " JavaScript syntax and indentation
Plug 'maxmellon/vim-jsx-pretty'             " JSX syntax highlighting for better React development

" Plugin for Auto Pairs
Plug 'jiangmiao/auto-pairs'                 " Auto-pairs for parentheses, brackets, quotes, etc.

" Plugin for Tree-sitter for better CSS/HTML/JS support
" Plug 'windwp/nvim-ts-autotag'               " Auto-closing HTML tags

" Plugins for Code Formatting
Plug 'jose-elias-alvarez/null-ls.nvim'      " Use external tools like Prettier for formatting
Plug 'MunifTanjim/prettier.nvim'            " Prettier integration for Neovim

" ------------------------
" End Plugin Configuration
" ------------------------

call plug#end()

" ------------------------
" LSP Configuration for JavaScript/React/Node
" ------------------------

lua <<EOF
local lspconfig = require('lspconfig')

-- Configure for NodeJS and JavaScript/React
lspconfig.ts_ls.setup{
  on_attach = function(client, bufnr)
    -- Enable completion
    require('completion').on_attach(client, bufnr)
    -- Format on save
    vim.api.nvim_command('autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()')
  end
}
EOF

" ------------------------
" Treesitter Configuration (for better syntax highlighting)
" ------------------------

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = { 
    "html", "css", "javascript", "typescript", "json", "lua", "tsx", "jsx" 
  },  -- Ensure that jsx is included
  highlight = { enable = true },
  indent = { enable = true },
  autotag = { enable = true },  -- Automatically close HTML tags
}
EOF

" ------------------------
" Key Mappings for Productivity
" ------------------------

" Toggle NERDTree file explorer
map <Leader>n :NERDTreeToggle<CR>

" Toggle treesitter playground for visualizing AST
map <Leader>p :TSPlaygroundToggle<CR>

" ------------------------
" Additional Settings for a Better Experience
" ------------------------

" Enable clipboard support (system clipboard)
set clipboard=unnamedplus

" Highlight current line
set cursorline

" Enable line numbers for search
set number

" Enable folding (code folding)
set foldmethod=syntax
set foldlevel=99

