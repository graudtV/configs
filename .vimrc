syntax on
set number
set tabstop=4
set shiftwidth=4
set hlsearch
set incsearch
set rnu " relative line numbers

"autocompletion settings 
set complete+=kspell
set shortmess+=c

" vim-plug plugins
call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'morhetz/gruvbox'
Plug 'jiangmiao/auto-pairs'
" Plug 'easymotion/vim-easymotion'
" https://github.com/ervandew/supertab
Plug 'vim-scripts/AutoComplPop'
call plug#end()

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
function! InsertTabWrapper()
	return pumvisible() ? "\<C-y>" : "\<Tab>"
endfunction
inoremap <silent> <Tab> <c-r>=InsertTabWrapper()<cr>

colorscheme gruvbox
set background=dark

" let g:mapleader=';'

map <C-n> :NERDTreeToggle<CR>
map <Leader> <Plug>(easymotion-prefix)

map <Space> <C-d>
map <S-J> <C-d>
map <S-K> <C-u>
map <C-j> <C-y>
map <C-k> <C-e>
