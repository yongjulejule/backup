call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive' 				"use git things in vim
Plug 'tpope/vim-sensible' 				"required
Plug 'preservim/nerdtree'				"filetree
Plug 'dense-analysis/ale'				"syntax check
Plug 'preservim/nerdcommenter'			"comment
Plug 'nathanaelkane/vim-indent-guides'	"highlight indent lines
"Plug 'Yggdroot/indentLine'				"highlight indent lines
Plug 'vim-airline/vim-airline'			"fancy status bar
Plug 'vim-airline/vim-airline-themes' 	"add airline theme"
Plug 'airblade/vim-gitgutter'			"see code changes
"Plug 'junegunn/fzf.vim'				"file manager
Plug 'ctrlpvim/ctrlp.vim'				"file manager
Plug 'terryma/vim-multiple-cursors'		"multiple selection
Plug 'Raimondi/delimitMate'				"auto bracket
Plug 'terryma/vim-smooth-scroll'		"smooth scroll
Plug 'zxqfl/tabnine-vim'				"auto complete
Plug 'tpope/vim-surround'				"smart quotes
Plug 'pbondoer/vim-42header'			"42header
Plug 'easymotion/vim-easymotion'		"easy to deal with words
Plug 'edkolev/promptline.vim'			"shell inside VIM
Plug 'xuhdev/SingleCompile'				"simple compiler
Plug 'pangloss/vim-simplefold'			"fold codes
Plug 'vim-scripts/WhiteWash'			"highlights white spaces
"Plug 'wadackel/vim-dogrun'				"color scheme
Plug 'crusoexia/vim-monokai'
"Plug 'nanotech/jellybeans.vim'			"color theme

call plug#end()

set nocompatible
set number
set cindent
set autoindent
set smartindent
set hlsearch
set tabstop=4
set shiftwidth=4
set mouse=a
set cursorline
filetype on

" multi cursor

let g:multi_cursor_quit_key = '<C-c>'
"airline setting
let g:airline_theme='simple'
" Smarter tab line 활성화: 모든 파일 버퍼 출력
let g:airline#extensions#tabline#enabled = 1

" Tab line 구분자 '|' 로 설정
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" Tab line 에 파일명만 출력되도록 설정
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Powerline-font 활성화
let g:airline_powerline_fonts = 1

nnoremap <C-h> :bprevious!<Enter>    " 이전 버퍼로 이동
nnoremap <C-l> :bnext!<Enter>        " 다음 버퍼로 이동
nnoremap <C-q> :bp <BAR> bd #<Enter> " 현재 버퍼를 닫고 이전 버퍼로 이동

"nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar> :let @/=_s<Bar><CR>

"for nerd-tree
"autocmd vimenter * NERDTree "automatically start
map <C-d> :NERDTreeToggle<CR>		"open NERDTree with ctrl+d

"for nerd-commenter
let g:NERDSpaceDelims = 1 " Add spaces after comment delimiters by default
let g:NERDCompactSexyComs = 1 " Use compact syntax for prettified multi-line comments
let g:NERDCommentEmptyLines = 1 " Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDTrimTrailingWhitespace = 1	" Enable trimming of trailing whitespace when uncommenting

"for syntastic tool
let g:ale_sign_column_always = 1

"for vim-indent-guide
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0

"for ctrlp
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|public$\|log$\|tmp$\|vendor$',
  \ 'file': '\v\.(exe|so|dll)$'
  \ }

"for singlecompile
nmap <F9> :SCCompile<cr>
nmap <F10> :SCCompileRun<cr>

"for simplefold
let g:SimpylFold_docstring_preview=1

filetype plugin indent on
colorscheme monokai
highlight Comment term=bold ctermfg=103
highlight Normal  ctermbg=16
highlight Linenr  ctermbg=16 term=italic
highlight IndentGuidesOdd  ctermbg=235 
highlight IndentGuidesEven ctermbg=233
