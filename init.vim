"my new nvim configuration

" UTF-8 😤
scripte utf-8

" Epic true colors
if (has('termguicolors'))
  set termguicolors
end

syntax on
filetype plugin indent on

set number
set noerrorbells
set autoindent
set tabstop=4 softtabstop=4
set shiftwidth=4
set noswapfile
set smartindent
set expandtab
set cindent
set autoindent
set smartcase
set wildmenu
set showmatch
set mouse=a

" long line bad
set colorcolumn=80

let mapleader = " "


"Pluginns here
call plug#begin('~/.local/share/nvim/plugged')
Plug 'davidhalter/jedi-vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'dense-analysis/ale'
Plug 'sbdchd/neoformat'
Plug 'scrooloose/nerdtree'
Plug 'neomake/neomake'
Plug 'kiteco/vim-plugin'
Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'machakann/vim-highlightedyank'
Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }
Plug 'junegunn/goyo.vim'
Plug 'jaredgorski/spacecamp'
Plug 'wakatime/vim-wakatime'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'rhysd/vim-clang-format'
Plug 'sheerun/vim-polyglot'
Plug 'maximbaz/lightline-ale'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
call plug#end()

let g:clang_format#auto_format=1
let g:neomake_python_enabled_makers = ['pylint']
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
" Don't forget to start deoplete 
let g:deoplete#enable_at_startup = 1 " Less spam 

" All the languages Kite supports
let g:kite_supported_languages = ['*']
let g:kite_tab_complete=1
set completeopt+=menuone
set completeopt+=noselect
autocmd CompleteDone * if !pumvisible() | pclose | endif
set belloff+=ctrlg  " if vim beeps during completion
set statusline=%<%f\ %h%m%r%{kite#statusline()}%=%-14.(%l,%c%V%)\ %P
set laststatus=2  " always display the status lineo
let g:kite_log=1

""use TAB as the mapping
inoremap <silent><expr> <TAB>
    \ pumvisible() ?  "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "" {{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction "" }}}

if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

highlight ColorColumn ctermbg=DarkGrey guibg=#333333
colorscheme spacecamp

" lightline lintinig
let g:lightline = {}

let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_infos': 'lightline#ale#infos',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }

let g:lightline.component_type = {
      \     'linter_checking': 'right',
      \     'linter_infos': 'right',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'right',
      \ }

let g:lightline.active = { 'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ]] }

let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_infos = "\uf129"
let g:lightline#ale#indicator_warnings = "\uf071"
let g:lightline#ale#indicator_errors = "\uf05e"
let g:lightline#ale#indicator_ok = "\uf00c"

"colorscheme spacecamp

    let g:lightline = {
          \ 'colorscheme': 'spaceduck',
          \ }

" Easier file saving
inoremap <C-s> <Esc>:w<CR>
nnoremap <C-s> :w<CR>
nnoremap <leader><space> :w<CR>
nnoremap <leader>W :Wall<CR>

" Easier splits
nnoremap C-w v :vsplit<cr>
nnoremap C-w h :hsp<cr>

" Reload buffer with <leader>R
nnoremap <leader>r :e!<CR>
" Reload vimrc
nnoremap <leader>R :source ~/.config/nvim/init.vim<CR>

" Close windows easier
nnoremap <leader>q :q<CR>

" <leader>g toggles Goyo
nnoremap <silent> <leader>g :Goyo<cr>

" Indentation hacks
vnoremap <tab> >gv
vnoremap >> >gv
vnoremap << <gv
nnoremap >> >gv
nnoremap << <gv

" Tabs
nnoremap L :tabn<cr>
nnoremap H :tabp<cr>
cabbrev t tabe

" run code, useful for ctfs and cp
augroup compileandrun
  autocmd!
  autocmd filetype python nnoremap <f5> :w <bar> :!python % <cr>
  autocmd filetype python nnoremap <f6> :w <bar> :15sp <bar> :te exec python % <cr>
  autocmd filetype cpp nnoremap <f5> :w <cr> :!g++ -std=c++11 % -Wall -g -o %.out <cr>
  autocmd filetype cpp nnoremap <f6> :te exec ./%.out <cr>
 "autocmd filetype cpp nnoremap <f5> :w <cr> :!clear ; g++ --std=c++17 %; ./a.out; rm a.out<cr>
  autocmd filetype java nnoremap <f5> :w <bar> !javac % && java %:r <cr>
  autocmd filetype c nnoremap <f5> :w <bar> !make %:r && ./%:r <cr>
augroup END

