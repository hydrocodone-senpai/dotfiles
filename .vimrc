"hydrocodone's .vimrc

"pathogen
execute pathogen#infect()

"appearance
syntax on
colorscheme wal
set showcmd
set number number
set number relativenumber

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

"compiler script
set shellcmdflag=-ic
map <leader>c :!compiler <c-r>%<CR>

"rmd shortcuts
autocmd Filetype rmd inoremap <Tab><Space> <Esc>/<++><Enter>"_c4l
autocmd FileType rmd inoremap :t ```{r,echo=FALSE}<Enter><++><-read.xlsx('figures/<++>.xlsx',namedRegion='<++>')<Enter>kable(<++>,caption='<++>',align='c',booktabs='T',linesep="",col.names=<++>)<Space>%>%<Enter>kable_styling(latex_options=c('striped','hold_position'))<Enter>```<Enter><++><Esc>5ki
autocmd FileType rmd inoremap :x \textrm{}<++><Esc>4hi
autocmd FileType rmd inoremap :f \frac{<++>}{<++>}<++><Esc>Bi
autocmd Filetype rmd inoremap :b ****<++><Esc>5hi
autocmd Filetype rmd inoremap :i **<++><Esc>4hi
autocmd Filetype rmd inoremap :m $$<++><Esc>4hi
autocmd Filetype rmd inoremap :g ```{r,echo=FALSE,out.width='100%',fig.align='center',fig.pos="h",fig.cap="<++>"}<Enter>knitr::include_graphics("~/Images/figures/<++>.png")<Enter>```<Enter><++><Esc>3ki
autocmd Filetype rmd inoremap :e \begin{equation}<Enter><++><Enter>\end{equation}<Enter><++><Esc>3ki
autocmd Filetype rmd inoremap :a \begin{align}<Enter><++><Enter>\end{align}<Enter><++><Esc>3ki
autocmd Filetype rmd inoremap :h ---<Enter>title:<Space><++><Enter>author:<Space><++><Enter>date:<Space><++><Enter>output:<Space>pdf_document<Enter>---<Enter><++><Esc>ggi

"html shortcuts
autocmd Filetype html inoremap <Tab><Space> <Esc>/<++><Enter>"_c4l
autocmd Filetype html inoremap :t <th><++></th><++><Esc>Bi

"goyo configuration
let g:goyo_linenr=1
