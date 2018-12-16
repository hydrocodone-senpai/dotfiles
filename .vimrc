syntax on

"pathogen
execute pathogen#infect()

"some quality of life stuff
set showcmd
set cursorline
set number number
set number relativenumber
inoremap <Space><Space> <Esc>/<++><Enter>"_c4l

"searching
set incsearch
set hlsearch
nnoremap <leader><space> :nohlsearch<CR>

"folding
set foldenable

"compiler script
set shellcmdflag=-ic
map <leader>c :!compiler <c-r>%<CR>

"shortcuts
inoremap (( ()<++><Esc>4hi
inoremap '' ''<++><Esc>4hi
inoremap "" ""<++><Esc>4hi
inoremap [[ []<++><Esc>4hi
inoremap {{ {}<++><Esc>4hi

"rmd shortcuts
autocmd FileType rmd inoremap ;t ```{r,echo=FALSE}<Enter><++><-read.xlsx('figures/<++>.xlsx',namedRegion='<++>')<Enter>kable(<++>,caption='<++>',align='c',booktabs='T',linesep="",col.names=<++>)<Space>%>%<Enter>kable_styling(latex_options=c('striped','hold_position'))<Enter>```<Enter><++><Esc>5ki
autocmd FileType rmd inoremap ;x \textrm{}<++><Esc>4hi
autocmd FileType rmd inoremap ;f \frac{<++>}{<++>}<++><Esc>Bi
autocmd Filetype rmd inoremap ;b ****<++><Esc>5hi
autocmd Filetype rmd inoremap ;i **<++><Esc>4hi
autocmd Filetype rmd inoremap ;m $$<++><Esc>4hi
autocmd Filetype rmd inoremap ;g ```{r,echo=FALSE,out.width='100%',fig.align='center',fig.cap="<++>"}<Enter>knitr::include_graphics("figures/<++>.png")<Enter>```<Enter><++><Esc>3ki
autocmd Filetype rmd inoremap ;e \begin{equation}<Enter><++><Enter>\end{equation}<Enter><++><Esc>3ki
autocmd Filetype rmd inoremap ;a \begin{align}<Enter><++><Enter>\end{align}<Enter><++><Esc>3ki
autocmd Filetype rmd inoremap ;h ---<Enter>title:<Space><++><Enter>author:<Space><++><Enter>date:<Space><++><Enter>output:<Space>pdf_document<Enter>---<Enter><++><Esc>ggi
