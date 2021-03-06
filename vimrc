""" Inspiration from janus' vimrc & holman/dotfiles

" Base
set nocompatible
filetype off
set encoding=utf-8

" ---------------------------------------------------------------------------
"  Vundle
" ---------------------------------------------------------------------------
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

" Plugins!
"   Reload in vim: :source %
"   :PluginInstall
Plugin 'Shougo/vimproc.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Shougo/unite.vim'

" Plugins - Colorschemes
Plugin 'altercation/vim-colors-solarized'
Plugin 'sjl/badwolf'
Plugin 'morhetz/gruvbox'
Plugin 'w0ng/vim-hybrid'
Plugin 'ciaranm/inkpot'
Plugin 'tomasr/molokai'
Plugin 'sickill/vim-monokai'

" Plugins - Langs
Plugin 'pangloss/vim-javascript'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-rails'
Plugin 'digitaltoad/vim-jade'
Plugin 'nono/vim-handlebars'
Plugin 'wavded/vim-stylus'
Plugin 'plasticboy/vim-markdown'
Plugin 'elixir-lang/vim-elixir'
Plugin 'rodjek/vim-puppet'

" Plugins - Integrations
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-surround'
" Plugin 'scrooloose/syntastic'
" Plugin 'git://git.wincent.com/command-t.git'
Plugin 'bling/vim-airline'
Plugin 'mattn/webapi-vim'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'airblade/vim-gitgutter'
Plugin 'rizzatti/funcoo.vim'
Plugin 'rizzatti/dash.vim'

" Interface
" Plugin 'taglist-plus'
Plugin 'rainbow_parentheses.vim'
Plugin 'bad-whitespace'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Gist.vim'
Plugin 'godlygeek/tabular'


" Snipmate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
"Plugin 'carlosgaldino/elixir-snippets'

" Vundle: end
call vundle#end()


" ---------------------------------------------------------------------------
"  Base
" ---------------------------------------------------------------------------
filetype plugin indent on
set mouse=a

" ---------------------------------------------------------------------------
"  Ignores
" ---------------------------------------------------------------------------
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/log/*
" Node.js
set wildignore+=*node_modules/* " ignore node_modules
" Erlang/Elixir
set wildignore+=*.beam,erl_crash.dump,gproc_dist_*,*Mnesia.*@*,deps,_build

" ----------------------------------------------------------------------------
"  Text Formatting
" ----------------------------------------------------------------------------

set autoindent             " automatic indent new lines
set smartindent            " be smart about it
inoremap # X<BS>#
set nowrap                 " do not wrap lines
set softtabstop=2          " yep, two
set shiftwidth=2           " ..
set tabstop=4
set expandtab              " expand tabs to spaces
set nosmarttab             " fuck tabs
set formatoptions+=n       " support for numbered/bullet lists
set textwidth=120           " wrap at 120 chars by default
set virtualedit=block      " allow virtual edit in visual block ..

" ----------------------------------------------------------------------------
"  Remapping
" ----------------------------------------------------------------------------

" lead with &
let mapleader = "&"

" ----------------------------------------------------------------------------
"  UI
" ----------------------------------------------------------------------------

set ruler                  " show the cursor position all the time
set noshowcmd              " don't display incomplete commands
set nolazyredraw           " turn off lazy redraw
set number                 " line numbers
set wildmenu               " turn on wild menu
set wildmode=list:longest,full
set ch=2                   " command line height
set backspace=2            " allow backspacing over everything in insert mode
set whichwrap+=<,>,h,l,[,] " backspace and cursor keys wrap to
set shortmess=filtIoOA     " shorten messages
set report=0               " tell us about changes
set nostartofline          " don't jump to the start of line when scrolling
set noshowmode             " disable showmode (powerline shows it)

syntax enable              " enable syntax
set background=dark        " use solarized dark
"""colorscheme solarized      " use solarized colorscheme
colorscheme badwolf

set foldmethod=marker      " code folding with markers

" ----------------------------------------------------------------------------
"  .swp files
" ----------------------------------------------------------------------------

set backupdir=~/.vim/backup
set directory=~/.vim/backup

" ----------------------------------------------------------------------------
" Visual Cues
" ----------------------------------------------------------------------------

set showmatch              " brackets/braces that is
set mat=5                  " duration to show matching brace (1/10 sec)
set incsearch              " do incremental searching
set laststatus=2           " always show the status line
set ignorecase             " ignore case when searching
set smartcase              " smart case
set hlsearch               " highlight searches
set visualbell             " shut the fuck up

" ----------------------------------------------------------------------------
"  Powerline
" ---------------------------------------------------------------------------
"let g:Powerline_symbols = 'fancy'
"let g:Powerline_theme = 'skwp' " solarized
"let g:Powerline_colorscheme = 'skwp' " solarized
"call Pl#Theme#InsertSegment('ws_marker', 'after', 'lineinfo') " white spaces
let g:airline_powerline_fonts=1

" ----------------------------------------------------------------------------
"  The NerdTree
" ----------------------------------------------------------------------------
" Open the tree if no files specified
"autocmd vimenter * if !argc() | NERDTree | endif
" Close vim if the tree is last buffer
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif 
" Ignores
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$', '\node_modules/', 'tmp/']
let NERDTreeRespectWildIgnore=1
" Map <Leader>n to toggle the tree
map <Leader>n :NERDTreeToggle<CR>

" ----------------------------------------------------------------------------
"  CoffeeScript
" ----------------------------------------------------------------------------
au BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable " Fold on indent (hit zi)
au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab " default indent
"au BufWritePost *.coffee silent CoffeeMake!     " recompile file when written
"au BufWritePost *.coffee silent CoffeeMake! -b | cwindow | redraw! " recompiles silentely

" ----------------------------------------------------------------------------
"  Rainbow Parantheses
" ----------------------------------------------------------------------------
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" ---------------------------------------------------------------------------
"  Markdown
" ---------------------------------------------------------------------------
let g:vim_markdown_folding_disabled=1

" ---------------------------------------------------------------------------
"  Gist
" ---------------------------------------------------------------------------
let g:gist_clip_command = 'pbcopy'
let g:gist_open_browser_after_post = 1
let g:gist_post_private = 1

" ---------------------------------------------------------------------------
"  Syntastic
" ---------------------------------------------------------------------------
let syntastic_mode_map = { 'passive_filetypes': ['html', 'hbs'] }

" ---------------------------------------------------------------------------
"  Strip all trailing whitespace in file
" ---------------------------------------------------------------------------
function! StripWhitespace ()
    exec ':%s/ \+$//gc'
endfunction
map ,s :call StripWhitespace ()<CR>

" ---------------------------------------------------------------------------
"  Ident Guides
" ---------------------------------------------------------------------------
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_exclude_filetypes = ['help'] " nerdtree
" Colors: From Badwolf, Odd bwc.mediumgravel, Even deepgravel
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd guibg=#35322d ctermbg=236
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#242321 ctermbg=234
au VimEnter * IndentGuidesEnable

" ---------------------------------------------------------------------------
"  Ctrl-P
" ---------------------------------------------------------------------------
let g:ctrlp_root_markers = ['.ctrlp']
" Custom ignores (not in wildignore) (for example docs/ is too vague but ExDoc makes too much files! :))
let g:ctrlp_custom_ignore = '\v[\/](docs)$'

" ---------------------------------------------------------------------------
"  Git Gutter
" ---------------------------------------------------------------------------
let g:gitgutter_sign_added = '|'
let g:gitgutter_sign_modified = '|'
let g:gitgutter_sign_removed = '|'
let g:gitgutter_sign_removed_first_line = '|'
let g:gitgutter_sign_modified_removed = '|'

