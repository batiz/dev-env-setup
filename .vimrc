set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'nanotech/jellybeans.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'sjl/gundo.vim'
Plugin 'godlygeek/tabular'
Plugin 'easymotion/vim-easymotion'
Plugin 'haya14busa/incsearch.vim'
Plugin 'haya14busa/incsearch-easymotion.vim'
Plugin 'othree/html5.vim'
Plugin 'wincent/command-t'
Plugin 'mileszs/ack.vim'
Plugin 'sjbach/lusty'
Plugin 'tpope/vim-fugitive'
Plugin 'fatih/vim-go'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


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

let g:ycm_autoclose_preview_window_after_completion=1

" Syntastic options
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

" Syntastic python
let g:syntastic_python_checkers = ['flake8']

" Syntastic javascript
let g:syntastic_javascript_checkers = ['gjslint']

" Syntastic golang
let g:syntastic_go_checkers = ['golint']

function Flake8ColumnLength()
	let g:syntastic_python_flake8_args='--max-line-length=120'
	edit
endfunction
nmap <leader>l :call Flake8ColumnLength()<CR>

" YouCompleteMe definition
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Comment Toggle Uses NERDCommenter
nmap \\ <leader>c<space>
xmap \\ <leader>c<space>

" Undo three
nnoremap <F5> :GundoToggle<CR>

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

" Mode paste toggle
function ModePasteToggle()
	if !exists("b:mode_paste_is_on")
		let b:mode_paste_is_on = 0
	endif
	if b:mode_paste_is_on
		set nopaste
		set noinsertmode
		let b:mode_paste_is_on = 0
	else
		set paste
		set insertmode
		let b:mode_paste_is_on = 1
	endif
endfunction
nmap <leader>p :call ModePasteToggle()<CR>

"Incsearch mapping
map / <Plug>(incsearch-easymotion-/)
map ? <Plug>(incsearch-easymotion-?)
map g/ <Plug>(incsearch-easymotion-stay)

"map /  <Plug>(incsearch-forward)
"map ?  <Plug>(incsearch-backward)
"map g/ <Plug>(incsearch-stay)

set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

"Command-t filter some file types
let g:CommandTWildIgnore=&wildignore . ",*.pyc"

"Ack Plugin shortcut
nmap <leader>a :Ack ""<Left>

"Ack on current cursor word
nmap <leader>A :Ack <C-r><C-w><CR>

"Lusty hide errors
set hidden

"Lusty load in memory before LustyBufferGrep
nmap <leader>lg :bufdo edit<CR>:LustyBufferGrep<CR>

color jellybeans
