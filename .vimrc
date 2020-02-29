"hydrocodone's .vimrc

"vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'dylanaraps/wal.vim'
Plugin 'ycm-core/YouCompleteMe'

call vundle#end()

"disable vi compatibility
set nocompatible

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

"compiler script
set shellcmdflag=-ic
map <leader>c :!compile <c-r>%<CR>

"goyo configuration
let g:goyo_linenr=1
