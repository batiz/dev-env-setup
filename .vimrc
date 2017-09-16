set nobackup
set noswapfile

" Always show statusline
set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

set nocompatible              " required
filetype off                  " required

call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-plug'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nanotech/jellybeans.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdcommenter'
Plug 'sjl/gundo.vim'
Plug 'godlygeek/tabular'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'othree/html5.vim'
Plug 'wincent/command-t', {
    \   'do': 'rvm use system && rake make'
    \ }
Plug 'mileszs/ack.vim'
Plug 'sjbach/lusty'
Plug 'tpope/vim-fugitive'
Plug 'fatih/vim-go'
Plug 'tpope/tpope-vim-abolish'
Plug 'qpkorr/vim-bufkill'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Shougo/vimshell.vim'
Plug 'Shougo/vimfiler.vim'
Plug 'Shougo/unite.vim'
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/neossh.vim'
Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
Plug 'luochen1990/rainbow'
Plug 'qpkorr/vim-renamer'

call plug#end()
filetype plugin on


set nu
set laststatus=2
set backspace=2
set t_Co=256
set clipboard=unnamedplus
syntax on

" Airline config
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1


let mapleader=","

" Syntastic options
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

let g:syntastic_mode_map = {
	\ "mode": "passive",
	\ "active_filetypes": [],
	\ "passive_filetypes": [] }

" Syntastic python
let g:syntastic_python_checkers = ['flake8']

" Syntastic javascript
let g:syntastic_javascript_checkers = ['gjslint']

" Syntastic golang
let g:syntastic_go_checkers = ['golint']


" Comment Toggle Uses NERDCommenter
nmap \\ <leader>c<space>
xmap \\ <leader>c<space>

" Undo three
let g:gundo_prefer_python3 = 1
nmap <leader>u :GundoToggle<CR>

" Spell checking english
function SpellCheckToggle()
	if !exists("b:spell_check_is_on")
		let b:spell_check_is_on = 0
	endif
	if b:spell_check_is_on
		set nospell
		let b:spell_check_is_on = 0
	else
		setlocal spell spelllang=en_us
		let b:spell_check_is_on = 1
	endif
endfunction
nmap <leader>s :call SpellCheckToggle()<CR>

"Incsearch mapping
map / <Plug>(incsearch-easymotion-/)
map ? <Plug>(incsearch-easymotion-?)
map g/ <Plug>(incsearch-easymotion-stay)

set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

"Command-t filter some file types
let g:CommandTWildIgnore=&wildignore . ",*.pyc,*.a"
let g:CommandTMaxFiles=200000

"Ack use ag if installed
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

"Ack Plugin shortcut
nmap <leader>a :Ack ""<Left>

"Ack on current cursor word
nmap <leader>A :Ack <C-r><C-w><CR>

"Lusty hide errors
set hidden

"Lusty load in memory before LustyBufferGrep
nmap <leader>lg :bufdo edit<CR>:LustyBufferGrep<CR>

"VimFiler
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_define_wrapper_commands = 1
let g:vimfiler_tree_leaf_icon = '¦'
let g:vimfiler_tree_opened_icon = '▼'
let g:vimfiler_tree_closed_icon = '▷'
let g:vimfiler_file_icon = '-'
let g:vimfiler_readonly_file_icon = '*'
let g:vimfiler_marked_file_icon = '√'
call vimfiler#custom#profile('default', 'context', {
      \ 'safe' : 0,
      \ 'explorer' : 1,
      \ 'toggle' : 1,
      \ 'columns' : 'type',
      \ 'status' : 1,
      \ })

nmap <leader>f :VimFilerExplore<CR>
nmap <leader>ff :VimFilerExplore -find<CR>

"NeoComplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_auto_close_preview = 1

"Rainbow
let g:rainbow_active = 1
let g:rainbow_conf = {
	\ 'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\}

autocmd FileType go setlocal omnifunc=gocomplete#Complete

color jellybeans
