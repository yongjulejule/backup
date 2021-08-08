call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive' 				"use git things in vim
Plug 'tpope/vim-sensible'				"required
Plug 'preservim/nerdtree'				"filetree
Plug 'dense-analysis/ale'				"syntax check
Plug 'preservim/nerdcommenter'			"comment
Plug 'nathanaelkane/vim-indent-guides'	"highlight indent lines
"Plug 'Yggdroot/indentLine'				"highlight indent lines
Plug 'vim-airline/vim-airline'			"fancy status bar
Plug 'vim-airline/vim-airline-themes' 	"add airline theme
Plug 'airblade/vim-gitgutter'			"see code changes
"Plug 'junegunn/fzf.vim'				"file manager
Plug 'ctrlpvim/ctrlp.vim'				"file manager
Plug 'terryma/vim-multiple-cursors'		"multiple selection
Plug 'Raimondi/delimitMate'				"auto bracket
Plug 'terryma/vim-smooth-scroll'		"smooth scroll
Plug 'tpope/vim-surround'				"smart quotes
Plug 'pbondoer/vim-42header'			"42header
Plug 'easymotion/vim-easymotion'		"easy to deal with words
Plug 'edkolev/promptline.vim'			"shell inside VIM
"Plug 'pangloss/vim-simplefold'			"fold codes
Plug 'vim-scripts/WhiteWash'			"highlights white spaces
"Plug 'wadackel/vim-dogrun'				"color scheme
Plug 'crusoexia/vim-monokai'
"Plug 'nanotech/jellybeans.vim'			"color theme
Plug 'mattn/emmet-vim'
"Plug 'davidhalter/jedi-vim' 			"python autocomplication
Plug 'octol/vim-cpp-enhanced-highlight' "유저 함수 하이라이팅
Plug 'ryanoasis/vim-devicons'			"nerdtree icons
"coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
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
set syntax=1
set encoding=utf8
set termguicolors
set guicursor=n-v-c-i:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,sm:block-blinkwait175-blinkoff150-blinkon175
filetype on 

let g:coc_disable_transparent_cursor = 1
" multi cursor

let g:multi_cursor_quit_key = '<C-c>'
"airline setting
let g:airline_theme='bubblegum'
" Smarter tab line 활성화: 모든 파일 버퍼 출력
let g:airline#extensions#tabline#enabled = 1

" Tab line 구분자 '|' 로 설정
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" Tab line 에 파일명만 출력되도록 설정
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Powerline-font 활성화
let g:airline_powerline_fonts = 1

nnoremap <C-h> :bprevious!<Enter>     "이전 버퍼로 이동
nnoremap <C-l> :bnext!<Enter>         "다음 버퍼로 이동
nnoremap <C-a> :bp <BAR> bd #<Enter>  "현재 버퍼를 닫고 이전 버퍼로 이동

nnoremap <Leader>1 :z%
"nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar> :let @/=_s<Bar><CR>

"for nerd-tree
"autocmd vimenter * NERDTree "automatically start
map <C-d> :NERDTreeToggle<CR>		"open NERDTree with ctrl+d
nmap <Leader>r :NERDTreeFocus<cr>R<c-w><c-p>
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

"for simplefold

"============== 주석 매크로 ==============
func! CmtOn()    "주석 on
exe "'<,'>norm i//"
endfunc

func! CmtOff()    "주석 off
exe "'<,'>norm 2x"
endfunc

vmap <C-_>  <esc>:call CmtOn() <cr>
vmap <C-x> <esc>:call CmtOff() <cr>
nmap <C-_> <esc>v:call CmtOn() <cr>
nmap <C-x> <esc>v:call CmtOff() <cr>


nmap <space> zf%
nmap <space><CR> zd

tnoremap <Esc> <C-\><C-n>


" COC SETTING
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
"inoremap <silent><expr> <TAB>
"      \ pumvisible() ? \"\<C-n>" :
"      \ <SID>check_back_space() ? \"\<TAB>" :
"      \ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? \"\<C-p>" : \"\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
"nmap <silent> <TAB> <Plug>(coc-range-select)
"xmap <silent> <TAB> <Plug>(coc-range-select)
"xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
					
filetype plugin indent on
colorscheme monokai
highlight Comment term=bold ctermfg=103 guifg=#c6abff
highlight Normal  guibg=black 
highlight Linenr  guibg=black term=italic
highlight IndentGuidesOdd  ctermbg=235 guibg=#242424 
highlight IndentGuidesEven ctermbg=233 guibg=#404040
highlight NERDTreeFile ctermfg=140
highlight NERDTreeExecFile ctermfg=146
