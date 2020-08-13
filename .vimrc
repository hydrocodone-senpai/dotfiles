" hydrocodone's .vimrc

let hostname = substitute(system("hostname"), "\n", "", "")

" ==============================================================================
" vundle: check whitelisted hostnames to see if plugins should be loaded
" ==============================================================================

if (hostname ==# "ryz5")
	filetype off
	set nocompatible
	set rtp+=~/.vim/bundle/Vundle.vim

	call vundle#begin()
	Plugin 'VundleVim/Vundle.vim'
	Plugin 'dylanaraps/wal.vim'
	Plugin 'ycm-core/YouCompleteMe'
	Plugin 'lervag/vimtex'
	Plugin 'mattn/emmet-vim'
	call vundle#end()
endif

"set shell
set shell=/usr/bin/zsh\ -l

"tmux support
if exists('$TMUX')
    autocmd BufEnter * call system("tmux rename-window '" . expand("%:t") . "'")
    autocmd VimLeave * call system("tmux setw automatic-rename")
endif

"enable built-in fuzzy file search
filetype plugin indent on
set path=**
"display all matching files when one tab completes
set wildmenu

"netrw config
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

"appearance
syntax on
colorscheme wal
hi Normal guibg=NONE ctermbg=NONE
set showcmd
set number number
set number relativenumber
set textwidth=80
set formatoptions=roqnm
set formatlistpat=^\\s*[0-9*]\\+[\\]:.)}\\t\ ]\\s*
set tabstop=4
set shiftwidth=4

"undefine comment indicators to support indentation of bulleted lists in .(r)md files
autocmd Filetype md,rmd set comments=
" remove trailing whitespace after every save
autocmd BufWritePre * %s/\s\+$//e

"searching
set incsearch
set hlsearch
set autoindent
set ignorecase
set smartcase
nnoremap <leader><space> :nohlsearch<CR>

"folding
set foldenable

"indentation
autocmd Filetype c set cindent

"utf-8
set enc=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf8,prc

"goyo configuration
let g:goyo_linenr=1
