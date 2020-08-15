call plug#begin()
Plug 'chriskempson/base16-vim'
Plug 'morhetz/gruvbox'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"Plug 'SirVer/ultisnips'
Plug '~/source/vim-sling'
"Plug 'zalefin/vim-sling'
Plug 'triglav/vim-visual-increment'
Plug 'lervag/vimtex'
Plug 'preservim/nerdtree'
call plug#end()

" General
set nocompatible
filetype plugin on
syntax on
set encoding=utf-8
set number relativenumber
set hidden
set wrap
set showbreak=+++
set showmatch " Highlight matching brace
set nohlsearch
set smartcase
set ignorecase
set incsearch
set autoindent
set shiftwidth=4	" Number of auto-indent spaces
set smartindent	" Enable smart-indent
" set smarttab	" Enable smart-tabs
set expandtab "expand tabs - translate them to spaces
set softtabstop=4	" Number of spaces per Tab
set backspace=indent,eol,start
set formatoptions-=cro
autocmd FileType * setlocal formatoptions-=o " formatoptions-=c formatoptions-=r " disable auto comment newline

" Vimtex
let g:vimtex_view_method='zathura'

" Enable mouse
set mouse=a

" Enter insert mode on terminal open automagically
autocmd TermOpen * startinsert

" Press \ then enter in insert mode to make a newline
inoremap <leader><CR> <esc>$o

" Handy Maps
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
" nnoremap <C-p> :FZF<CR>
nnoremap <C-p> :GitFiles<CR>
if has("nvim")
    " Make escape work in the Neovim terminal
    tnoremap <esc> <c-\><c-n>
endif
" nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-t> :NERDTreeFocus<CR>

" Quick Tab Navigation
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt

" Sling
" let g:sling#sling_path="gnils.sh"
let g:sling#edit_on_missing=1
nnoremap <F5> :Sling<CR>

" Snappy updating
set updatetime=50

" Lazy normal mode
inoremap jk <esc>
inoremap kj <esc>

" Colors and such
set termguicolors
" colorscheme base16-atelier-lakeside
colorscheme gruvbox
" hi Search gui=underline guifg=yellow guibg=NONE cterm=underline ctermfg=yellow ctermbg=NONE " do sicc yellow underline for searches instead of full highlight
autocmd VimEnter * hi Normal guibg=NONE

" Show 'invisible' characters
set listchars=eol:¬,tab:❯─❯,trail:~,extends:>,precedes:<,space:•
set list

" non-retarded splitting
set splitbelow splitright

" Gitgutter settings
set signcolumn=yes

" COC settings
" Some server may have issues with backup files
set nobackup
set nowritebackup

set cmdheight=2

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
	    \ pumvisible() ? "\<C-n>" :
	    \ <SID>check_back_space() ? "\<TAB>" :
	    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
    inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Airline
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1

set noshowmode " Needs to be at the bottom to work for some reason
