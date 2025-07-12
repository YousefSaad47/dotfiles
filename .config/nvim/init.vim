:set scrolloff=8
:set number
:set relativenumber

set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

colorscheme codedark

let mapleader = " "
nnoremap <leader>e :Vexplore<CR>
nnoremap <leader><CR> :source ~/.config/nvim/init.vim<CR>
vnoremap <leader>p "_dp
vnoremap <leader>y "+y
nnoremap <leader>y "+y
nnoremap <leader>Y :%y+<CR>
nnoremap J :m '>+1<CR>==
nnoremap K :m '<-2<CR>==
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr> 

augroup YankHighlight
  autocmd!
  autocmd TextYankPost * silent! lua vim.highlight.on_yank { higroup = 'IncSearch' }
augroup END

call plug#begin('~/.local/share/nvim/plugged')
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
call plug#end()

