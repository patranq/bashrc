colorscheme monokai

set number
set mouse=r
set laststatus=2
set ruler
set wrap
set colorcolumn=80
set incsearch
set hlsearch
set autoindent
set tabstop=4
set noexpandtab
set shiftwidth=8

"filetype on
syntax on

"This part is used if powerline-status is installed
"python from powerline.vim import setup as powerline_setup
"python powerline_setup()
"python del powerline_setup


"This paragraph is used to highlight TABs
set list
set listchars=tab:._

"=====REMAPPINGS=====
"Get out of Insert mode
	:imap jj <esc>

"Move one line up or down
nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>

"=====FUNCTIONS=====
"Function to rename the variable under the cursor
function! Rnvar()
  let word_to_replace = expand("<cword>")
  let replacement = input("new name: ")
  execute '%s/\(\W\)' . word_to_replace . '\(\W\)/\1' . replacement . '\2/gc'
endfunction
