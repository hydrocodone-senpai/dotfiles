"hydrocodone's .vimrc

"pathogen
execute pathogen#infect()

"disable vi compatibility
set nocompatible

"enable built-in fuzzy file search
filetype plugin on
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

"rmd shortcuts
autocmd Filetype rmd inoremap <Tab><Space> <Esc>/<++><Enter>"_c4l
autocmd FileType rmd inoremap :t ```{r,echo=FALSE}<Enter><++><-read.xlsx('figures/<++>.xlsx',namedRegion='<++>')<Enter>kable(<++>,caption='<++>',align='c',booktabs='T',escape='F',linesep="",col.names=<++>)<Space>%>%<Enter>kable_styling(latex_options=c('striped','HOLD_position'))<Enter>```<Enter><++><Esc>5ki
autocmd FileType rmd inoremap :x \textrm{}<++><Esc>4hi
autocmd FileType rmd inoremap :f \frac{<++>}{<++>}<++><Esc>Bi
autocmd Filetype rmd inoremap :b ****<++><Esc>5hi
autocmd Filetype rmd inoremap :i **<++><Esc>4hi
autocmd Filetype rmd inoremap :m $$<++><Esc>4hi
autocmd Filetype rmd inoremap :g ```{r,fig.cap=cap,out.width="100%"}<Enter>cap<Space>=<Space><++><Enter>include_graphics("figures/<++>.png")<Enter>```<Enter><++><Esc>3ki
autocmd Filetype rmd inoremap :e \begin{equation}<Enter><++><Enter>\end{equation}<Enter><++><Esc>3ki
autocmd Filetype rmd inoremap :a \begin{align}<Enter><++><Enter>\end{align}<Enter><++><Esc>3ki
autocmd Filetype rmd inoremap :h ---<Enter>title:<Space><++><Enter>author:<Space><++><Enter>date:<Space><++><Enter>output:<Space>pdf_document<Enter>---<Enter><++><Esc>ggi
autocmd Filetype rmd inoremap :s \SI{<++>}{<++>}<++><Esc>Bi

"html shortcuts
autocmd Filetype html inoremap <Tab><Space> <Esc>/<++><Enter>"_c4l
autocmd Filetype html inoremap :t <th><++></th><++><Esc>Bi

"goyo configuration
let g:goyo_linenr=1
