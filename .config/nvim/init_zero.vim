let mapleader =","

set path+=**


if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif


call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'kana/vim-textobj-user'
Plug 'vimwiki/vimwiki'
Plug 'lervag/vimtex'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'mattn/vim-lsp-settings'
Plug 'wellle/tmux-complete.vim'
Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}
Plug 'jpalardy/vim-slime'
call plug#end()


let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
nmap <leader>0 <plug>(vimtex-compile)
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

let g:slime_target = "tmux"
let g:slime_paste_file = "$HOME/.slime_paste"

set nocompatible
syntax enable
filetype plugin on

set colorcolumn=80
highlight ColorColumn ctermbg=233

set wildmenu
set directory=~/.config/nvim/swap//
set clipboard+=unnamedplus
set noswapfile
set encoding=utf-8
set number relativenumber
set showcmd
set clipboard+=unnamedplus
vnoremap . :normal .<CR>

set splitbelow splitright

" Shortcutting split navigation, saving a keypress:
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Do the same for vim built-in terminal
tnoremap <C-j> <C-w>j
tnoremap <C-k> <C-w>k
tnoremap <C-h> <C-w>h
tnoremap <C-l> <C-w>l

command! MakeTags !ctags -R .

" Automatically deletes all trailing whitespace and newlines at end of file on save.
"autocmd BufWritePre * %s/\s\+$//e
"autocmd BufWritePre * %s/\n\+\%$//e

" 4 space tabs
set sw=4
set ts=4
set sts=4

" netrw options
let g:netrw_banner=0 "disable banner
let g:netrw_liststyle=3 "tree view

" nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>3jwf>a

" Disable diagnostics on LSP
let g:lsp_diagnostics_enabled = 0

" sending blocks (clearing previous output)
noremap <leader>tb (y)<C-w>wpa<C-l><CR><C-\><C-n><C-w>p)

" sending lines
noremap <leader>tl Vy<C-w>wpa<CR><C-\><C-n><C-w>pj

" sending visual selection
noremap <leader>ts y<C-w>wpa<CR><C-\><C-n><C-w>p
