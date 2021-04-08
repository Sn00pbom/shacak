call plug#begin()
Plug 'chriskempson/base16-vim'
" Plug 'morhetz/gruvbox'
Plug 'gruvbox-community/gruvbox'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
" Plug 'beeender/Comrade'
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"Plug 'SirVer/ultisnips'
Plug '~/source/vim-sling'
"Plug 'zalefin/vim-sling'
Plug 'triglav/vim-visual-increment'
Plug 'lervag/vimtex'
" Plug 'preservim/nerdtree'
" Plug 'tpope/vim-sleuth'
Plug 'tell-k/vim-autopep8'
Plug 'tpope/vim-repeat'
Plug 'junegunn/vim-easy-align'
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
call plug#end()

" call deoplete#enable()
" Enable deoplete when java file
" autocmd BufRead,BufNewFile *.java *.scala call deoplete#enable()
" autocmd BufRead,BufNewFile *.java *.scala CocDisable

" allow alpha visual increment
set nrformats=alpha

" Open where left off
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

autocmd BufRead,BufNewFile /tmp/calcurse* set filetype=markdown
autocmd BufRead,BufNewFile ~/.calcurse/notes/* set filetype=markdown

" Auto pep8 forcing
let g:autopep8_aggressive=2
let g:autopep8_disable_show_diff=1

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
let g:tex_flavor = 'latex'

" Enable mouse
set mouse=a

" Show ruler column
set colorcolumn=90

func! WordMode()
    set wrap
    set textwidth=90
    set spell spelllang=en_us
endfunction
com! WordMode call WordMode()

" Enter insert mode on terminal open automagically
autocmd TermOpen * startinsert

" Press \ then enter in insert mode to make a newline
" inoremap <leader><CR> <esc>$o

" Handy Maps
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
if system('isgit') == 0
    " in git repo
    nnoremap <C-p> :GitFiles<CR>
else
    " not in git repo
    nnoremap <C-p> :Files<CR>
endif

if has("nvim")
    " Make escape work in the Neovim terminal
    tnoremap <esc> <c-\><c-n>
endif
" nnoremap <C-t> :NERDTreeToggle<CR>
" nnoremap <C-t> :NERDTreeFocus<CR>

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
" inoremap jk <esc>
" inoremap kj <esc>

" Colors and such
set termguicolors
let g:gruvbox_contrast_dark='hard'

if exists('+termguicolors')
    let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'
colorscheme gruvbox
set background=dark
" hi Search gui=underline guifg=yellow guibg=NONE cterm=underline ctermfg=yellow ctermbg=NONE " do sicc yellow underline for searches instead of full highlight
if !exists('g:started_by_firenvim')
    autocmd VimEnter * hi Normal guibg=NONE
endif

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

"Highlight trailing whitespace:
highlight ExtraWhitespace ctermbg=red guibg=red
augroup WhitespaceMatch
	" Remove ALL autocommands for the WhitespaceMatch group.
	autocmd!
	autocmd BufWinEnter * let w:whitespace_match_number =
				\ matchadd('ExtraWhitespace', '\s\+$')
	autocmd InsertEnter * call s:ToggleWhitespaceMatch('i')
	autocmd InsertLeave * call s:ToggleWhitespaceMatch('n')
augroup END
function! s:ToggleWhitespaceMatch(mode)
	let pattern = (a:mode == 'i') ? '\s\+\%#\@<!$' : '\s\+$'
	if exists('w:whitespace_match_number')
		call matchdelete(w:whitespace_match_number)
		call matchadd('ExtraWhitespace', pattern, 10, w:whitespace_match_number)
	else
		" Something went wrong, try to be graceful.
		let w:whitespace_match_number =  matchadd('ExtraWhitespace', pattern)
	endif
endfunction
"Press to trim trailing whitespace
nnoremap <F6> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" FireNVim
let g:firenvim_config = {
			\ 'globalSettings': {
			\ 'alt': 'all',
			\  },
			\ 'localSettings': {
			\ '.*': {
			\ 'cmdline': 'neovim',
			\ 'priority': 0,
			\ 'selector': 'textarea',
			\ 'takeover': 'never',
			\ },
			\ }
			\ }
if exists('g:started_by_firenvim')
    " set background=light

    colorscheme base16-monokai
    set nolist

    " au BufEnter localhost_*ipynb* set filetype=python
    au BufEnter localhost_*ipynb* set filetype=python
    au BufEnter localhost* set guifont=Sauce Code Pro Nerd Font:h10
    au BufEnter localhost* hi! link markdownItalic Normal
    " nnoremap <F7> :set filetype=markdown<CR>
    " nnoremap <F8> :set filetype=tex<CR>
endif

set noshowmode " Needs to be at the bottom to work for some reason
