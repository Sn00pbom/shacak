set nocompatible

"autocmd FileType python map <buffer> <F5> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
"autocmd FileType python imap <buffer> <F5> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

let g:run_cmd="echo 'Default Command -> Run let g:run_cmd=\"ls -a\"'"
noremap  <F5> :exec "!" . g:run_cmd<CR>
inoremap  <F5> <esc>:exec "!" . g:run_cmd<CR>
" automatically set run_cmd as current file if python
autocmd FileType python let g:run_cmd="python3 %"

inoremap jk <esc>
inoremap kj <esc>

" vimtex
let g:vimtex_view_method='zathura'

func! SymbolMap()
    " Abbreviations
    " imap handles insert-only mappings
    " Symbols gotten from https://en.wikipedia.org/wiki/List_of_mathematical_symbols
    inoremap \pm ±
    inoremap \times ×
    inoremap \div ÷
    inoremap \sqrt √
    inoremap \sum ∑
    inoremap \dots ...
    inoremap \ne ≠
    inoremap \approx ≈
    inoremap \equiv ≡

    inoremap \le ≤
    inoremap \ge ≥

    inoremap \therefore ∴
    inoremap \because ∵
    inoremap \to →
    inoremap \iff ↔
    inoremap \vdash ⊢

    inoremap \and ∧
    inoremap \or ∨
    inoremap \neg ⫬
    inoremap \xor ⊕

    inoremap \false ⊥
    inoremap \true ⊤

    inoremap \subseteq ⊆
    inoremap \subset ⊂
    inoremap \in ∈
    inoremap \notin ∉
    inoremap \fa ∀
    inoremap \te ∃
    inoremap \B 𝔹
    inoremap \C ℂ
    inoremap \N ℕ
    inoremap \P ℙ
    inoremap \Q ℚ
    inoremap \R ℝ
    inoremap \Z ℤ
    inoremap \U 𝕌

    inoremap \infty ∞
    inoremap \int ∫
    inoremap \grad ∇

    inoremap \da —
    inoremap \chk ✓

    inoremap \Ga Γ
    inoremap \De Δ
    inoremap \Th Θ
    inoremap \La Λ
    inoremap \Xi Ξ
    inoremap \Pi Π
    inoremap \Si Σ
    inoremap \Ph Φ
    inoremap \Ps Ψ
    inoremap \Om Ω
    inoremap \al α
    inoremap \be β
    inoremap \ga γ
    inoremap \de δ
    inoremap \ep ε
    inoremap \ze ζ
    inoremap \et η
    inoremap \th θ
    inoremap \io ι
    inoremap \ka κ
    inoremap \la λ
    inoremap \mu μ
    inoremap \xi ξ
    inoremap \pi π
    inoremap \rh ρ
    inoremap \si σ
    inoremap \ta τ
    inoremap \ps ψ
    inoremap \om ω
    inoremap \ph ϕ
endfu
com! SymbolMap call SymbolMap()

func! WordProcessorMode()
  setlocal formatoptions=1
  setlocal noexpandtab
  map j gj
  map k gk
  setlocal spell spelllang=en_us
  set thesaurus+=/Users/sbrown/.vim/thesaurus/mthesaur.txt
  set complete+=s
  set formatprg=par
  setlocal wrap
  setlocal linebreak
  setlocal showbreak=
endfu
com! WP call WordProcessorMode()

" Color Scheme
set termguicolors
"colorscheme base16-circus
colorscheme base16-atelier-lakeside
"colorscheme quantum
let g:colorscheme_switcher_exclude_builtins=1



" Compat stuff:
set encoding=utf-8 " Force vim to use utf-8
set hidden " for use with ctrlspace
set showtabline=1 " for use with ctrlspace

" You complete me
let g:ycm_auto_trigger=1
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_min_num_of_chars_for_completion=1

" Ultisnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-v>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Gitgutter config
set updatetime=300
set signcolumn=yes

" vim-notes config
":let g:notes_suffix = '.znot'
":let g:notes_directories = ['~/Dropbox/Notes']
filetype plugin on


"" Airline
let g:airline_powerline_fonts=1
"let g:airline_theme='quantum'
"let g:airline_theme='monokai_pro'
"let g:airline_theme='violet'
let g:airline#extensions#tabline#enabled=1

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" Vim
runtime! debian.vim

if has("syntax")
  syntax on
endif

if has("autocmd")
    filetype plugin indent on
endif

"set showcmd
set autowrite

"" General
"set nowrap
set wrap
set number	" Show line numbers
set relativenumber " Show relative line numbers
set linebreak	" Break lines at word (requires Wrap lines)
set showbreak=+++	" Wrap-broken line prefix
set textwidth=200 " Line wrap (number of cols)
set showmatch	" Highlight matching brace
"set errorbells	" Beep or flash screen on errors
"set vb " Beep or flash screen on errors
 
set hlsearch	" Highlight all search results
hi Search gui=NONE guifg=NONE guibg=NONE cterm=underline ctermfg=yellow ctermbg=NONE
set smartcase	" Enable smart-case search
set ignorecase	" Always case-insensitive
set incsearch	" Searches for strings incrementally
 
set autoindent	" Auto-indent new lines
set shiftwidth=4	" Number of auto-indent spaces
set smartindent	" Enable smart-indent
set smarttab	" Enable smart-tabs
set softtabstop=4	" Number of spaces per Tab
 
"" Advanced
set ruler	" Show row and column ruler information
 
set undolevels=1000	" Number of undo levels
set backspace=indent,eol,start	" Backspace behaviour
 
set noshowmode "Needs to be at the bottom to work for some reason"
