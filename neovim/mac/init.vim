set nocompatible              " required
filetype off                  " required

call plug#begin('~/.config/nvim/plugged')

Plug 'junegunn/vim-plug'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nanotech/jellybeans.vim'
Plug 'w0rp/ale'
Plug 'scrooloose/nerdcommenter'
Plug 'sjl/gundo.vim'
Plug 'godlygeek/tabular'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'othree/html5.vim'
Plug 'wincent/command-t',  {
    \   'do': 'cd ruby/command-t/ext/command-t && ruby extconf.rb && make'
    \ }
Plug 'mileszs/ack.vim'
Plug 'sjbach/lusty'
Plug 'tpope/vim-fugitive'
Plug 'fatih/vim-go'
Plug 'tpope/tpope-vim-abolish'
Plug 'qpkorr/vim-bufkill'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'stamblerre/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'davidhalter/jedi-vim'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'vim-vdebug/vdebug'
Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install'}
Plug 'kristijanhusak/deoplete-phpactor'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'luochen1990/rainbow'
Plug 'zchee/deoplete-clang'
Plug 'rhysd/vim-clang-format'
Plug 'guns/xterm-color-table.vim'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

call plug#end()
filetype plugin on

set nobackup
set noswapfile
set nu
set laststatus=2
set backspace=2
set t_Co=256
set clipboard=unnamedplus
syntax on

set shell=/usr/local/bin/tmux

" Airline config
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1


let mapleader=","

" Ale options
let g:ale_linters = {
\	'python': ['flake8'],
\	'javascript': ['gjslint'],
\	'go': ['gometalinter'],
\	'yaml': ['yamllint']
\}

let g:ale_go_gometalinter_options = "--disable-all --enable=goimports --enable=golint
\	--enable=varcheck --enable=unconvert
\	--enable=deadcode --enable=ineffassign --enable=errcheck
\	--enable=goconst --enable=vet
\	--enable=megacheck
\	--warn-unmatched-nolint"


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
let g:CommandTWildIgnore=&wildignore . ",*.pyc,*.a,*.snap,*/vendor,*/dist"
let g:CommandTMaxFiles=200000

"Ack use ag if installed
if executable('ag')
  let g:ackprg = 'ag --vimgrep --path-to-ignore ~/.ignore'
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

"Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
autocmd CompleteDone * silent! pclose!

"neosnippet
let g:neosnippet#enable_completed_snippet = 1
let g:neosnippet#enable_snipmate_compatibility = 1

"Rainbow

let g:rainbow_active = 1
let g:rainbow_conf = {
\	'guifgs': ['royalblue3', 'darkorchid3', 'seagreen3', 'firebrick3'],
\	'operators': '',
\	'ctermfgs': [20, 91, 49, 160],
\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\}

"Vim-Bookmark
call unite#custom#profile('source/vim_bookmarks', 'context', {
	\   'winheight': 13,
	\   'direction': 'botright',
	\   'start_insert': 0,
	\ })

"Vdebug options
if !exists('g:vdebug_options')
  let g:vdebug_options = {}
endif
let g:vdebug_options.ide_key='PHPSTORM'
let g:vdebug_options.path_maps={'/workspace/src': '/Users/juanpena/dev/src'}
let g:vdebug_options.break_on_open=0
let g:vdebug_options.on_close='stop'

let g:vdebug_keymap = {
\    "run" : "<F5>",
\    "run_to_cursor" : "<leader>c",
\    "step_over" : "<leader>n",
\    "step_into" : "<Leader>s",
\    "step_out" : "<Leader>o",
\    "close" : "<F6>",
\    "detach" : "<F7>",
\    "set_breakpoint" : "<F10>",
\    "get_context" : "<F11>",
\    "eval_under_cursor" : "<F12>",
\    "eval_visual" : "<Leader>e",
\}

"deoplete-clang
let g:deoplete#sources#clang#libclang_path='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libclang.dylib'
let g:deoplete#sources#clang#clang_header='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang'

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

color jellybeans
