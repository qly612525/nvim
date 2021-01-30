" ===
" === Auto load for first time uses
" ===
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif

" ====================
" === Editor Setup ===
" ====================

" ===
" === System
" ===
let &t_ut=''
set autochdir

" ===
" === Editor Behavior
" ===
set exrc
set secure
set number
set relativenumber
set cursorline
set hidden
set noexpandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set list
set listchars=tab:\|\ ,trail:▫
set scrolloff=4
set ttimeoutlen=0
set notimeout
set viewoptions=cursor,folds,slash,unix
set wrap
set tw=0
set indentexpr=
set foldmethod=indent
set foldlevel=99
set foldenable
set formatoptions-=tc
set splitright
set splitbelow
set noshowmode
set showcmd
set wildmenu
set ignorecase
set smartcase
set shortmess+=c
set inccommand=split
set completeopt=longest,noinsert,menuone,noselect,preview
set ttyfast "should make scrolling faster
set lazyredraw "same as above
set visualbell
silent !mkdir -p ~/.config/nvim/tmp/backup
silent !mkdir -p ~/.config/nvim/tmp/undo
"silent !mkdir -p ~/.config/nvim/tmp/sessions
set backupdir=~/.config/nvim/tmp/backup,.
set directory=~/.config/nvim/tmp/backup,.
if has('persistent_undo')
	set undofile
	set undodir=~/.config/nvim/tmp/undo,.
endif
set colorcolumn=100
set updatetime=100
set virtualedit=block

" ===
" === 不同文件缩进设置
" ===
" ts -> tabstop sw -> shiftwidth sts -> shifttabstop
autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd FileType cpp setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype typescript setlocal ts=2 sw=2 sts=0 expandtab

" ===
" === Basic Mappings
" ===
let mapleader=" "

" Search
noremap <Leader><CR> :nohlsearch<CR>

" ===
" === Window Management
" ===
noremap <Leader>w <C-w>w
noremap <Leader>k <C-w>k
noremap <Leader>j <C-w>j
noremap <Leader>h <C-w>h
noremap <Leader>l <C-w>l

" ===
" === split the screens to up, down, left, right
" ===
noremap sk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap sj :set splitbelow<CR>:split<CR>
noremap sh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap sl :set splitright<CR>:vsplit<CR>

" ===
" === Tab management
" ===
noremap tc :tabe<CR>
noremap th :-tabnext<CR>
noremap tl :+tabnext<CR>

" ===
" === Terminal Mapping
" ===
" open a terminal window
noremap <Leader>/ :set splitbelow<CR>:split<CR>:res -10<CR>:term<CR>

tnoremap <ESC> <C-\><C-N> " from terminal edit to terminal mode.
tnoremap <C-Q> <C-\><C-N><C-O> " from terminal mode to normal mode.
tnoremap <C-o><Esc> <Esc> " map <esc> button to <C-o><esc> 

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim/plugged')

" Treesitter need nightly neovim
" Plug 'nvim-treesitter/nvim-treesitter', {'do': 'TSUpdate'}

" welcome page
Plug 'mhinz/vim-startify'

" Pretty Dress
Plug 'bpietravalle/vim-bolt'
"Plug 'ajmwagar/vim-deus'
Plug 'rakr/vim-one'

" Status line
Plug 'ojroques/vim-scrollstatus'
Plug 'theniceboy/eleline.vim'

" General Highlighter
Plug 'RRethy/vim-hexokinase', {'do': 'make hexokinase'}
Plug 'RRethy/vim-illuminate'

" vista
" clap

" File Navigation
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'Yggdroot/LeaderF', {'do': ':LeaderfInstallCExtension'}
Plug 'airblade/vim-rooter'
Plug 'pechorin/any-jump.vim'

" Auto Complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'wellle/tmux-complete.vim'

" Git
Plug 'airblade/vim-gitgutter'

" HTML, CSS, JavaScript, Typescript, PHP, JSON, etc.
Plug 'elzr/vim-json'
Plug 'neoclide/jsonc.vim'
Plug 'othree/html5.vim'
Plug 'alvan/vim-closetag'
Plug 'yuezk/vim-js', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'heavenshell/vim-jsdoc', {'for': ['javascript', 'javascript.jsx','typescript'], 'do': 'make install'}
Plug 'leafgarland/typescript-vim'
" Plug 'peitalin/vim-jsx-typescript'

" jsdoc
Plug 'heavenshell/vim-jsdoc', {'for': ['javascript', 'javascript.jsx', 'typescript'], 'do': 'mak    e install'}

" glsl
Plug 'tikhomirov/vim-glsl'

" file-header
Plug 'ahonn/vim-fileheader'

" Editor Enhancement
Plug 'rhysd/accelerated-jk'
Plug 'mg979/vim-visual-multi'
Plug 'jiangmiao/auto-pairs'
Plug 'godlygeek/tabular'
Plug 'sakshamgupta05/vim-todo-highlight'
Plug 'vim-scripts/vim-auto-save'
Plug 'luochen1990/rainbow'
Plug 'tomtom/tcomment_vim'

" leetcode 刷题
Plug 'iandingx/leetcode.vim'


call plug#end()

" =======================
" === Plugins Setting ===
" =======================

" ===
" === Dress color
" ===
" set gui true color support
set termguicolors
set background=dark        " for the light version
let g:one_allow_italics = 1 " I love italic for comments
colorscheme one


" let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
" let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" set background=dark    " Setting dark mode
" colorscheme deus
" let g:deus_termcolors=256

hi NonText ctermfg=gray guifg=grey10

" ===
" === Fzf
" ===
set rtp+=/usr/local/opt/fzf

noremap <c-p> :Leaderf file<CR>
noremap <silent> <c-f> :Rg<CR>
noremap <silent> <c-h> :History<CR>

if has("nvim")
    " Escape inside a FZF terminal window should exit the terminal window
    " rather than going into the terminal's normal mode.
    autocmd FileType fzf tnoremap <buffer> <Esc> <Esc>
endif

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let g:fzf_preview_window = 'right:60%'
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
" See `man fzf-tmux` for available options
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }


"===
" === Leaderf
" ===
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_PreviewCode = 1
let g:Lf_ShowHidden = 1
let g:Lf_ShowDevIcons = 1
let g:Lf_IgnoreCurrentBufferName = 1
let g:Lf_WildIgnore = {
        \ 'dir': ['.git', 'vendor', 'node_modules'],
	\ 'file': ['__vim_project_root']
\}
let g:Lf_UseMemoryCache = 0
let g:Lf_UseCache = 0

" ===
" === Rooter
" ===
let g:rooter_change_directory_for_non_project_files = 'current'

" ===
" === coc.vim
" ===
let g:coc_global_extensions = [
	\ 'coc-css',
	\ 'coc-diagnostic',
	\ 'coc-explorer',
	\ 'coc-gitignore',
	\ 'coc-html',
	\ 'coc-json',
	\ 'coc-lists',
	\ 'coc-prettier',
	\ 'coc-pyright',
	\ 'coc-python',
	\ 'coc-snippets',
	\ 'coc-sourcekit',
	\ 'coc-stylelint',
	\ 'coc-syntax',
	\ 'coc-tasks',
	\ 'coc-translator',
	\ 'coc-tslint-plugin',
	\ 'coc-tsserver',
	\ 'coc-vetur',
	\ 'coc-vimlsp',
	\ 'coc-yaml']

if has("patch-8.1.1564")
	set signcolumn=number
else
	set signcolumn=yes
endif

inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <c-space> coc#refresh()

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

noremap tt :CocCommand explorer<CR>

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" coc-snippets
imap <C-l> <Plug>(coc-snippets-expand)
vmap <C-j> <Plug>(coc-snippets-select)
let g:coc_snippet_next='<C-j>'
let g:coc_snippet_prev='<C-k>'

" ===
" === html, css, js, ts, react
" ===
" set filetypes as typescriptreact
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

" dark red
hi tsxTagName guifg=#E06C75
hi tsxComponentName guifg=#E06C75
hi tsxCloseComponentName guifg=#E06C75

" orange
hi tsxCloseString guifg=#F99575
hi tsxCloseTag guifg=#F99575
hi tsxCloseTagName guifg=#F99575
hi tsxAttributeBraces guifg=#F99575
hi tsxEqual guifg=#F99575

" yellow
hi tsxAttrib guifg=#F8BD7F cterm=italic

" === 
" === Git
" ===
let g:gitgutter_map_keys = 0

" ===
" === Editor Enhancement
" ===
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)
let g:accelerated_jk_acceleration_table = [2, 4, 7, 15]

" todo-HighLight
let g:todo_highlight_config = {
\   'TODO': {
\     'gui_fg_color': '#0f0fff',
\     'gui_bg_color': '#affd3a',
\   },
\   'FIXME': {
\     'gui_fg_color': '#000000',
\     'gui_bg_color': '#af2d3a',
\   }
\}

" rainbow
let g:rainbow_active = 1

" ===
" === Vim Visual Multi
" ===
nmap <C-j> <C-Down>
nmap <C-k> <C-Up>

" ===
" === leet code 
" ===
let g:leetcode_browser='chrome'
let g:leetcode_china=1
