function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
call plug#begin('~/.vim/plugged')
Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
Plug 'kien/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neomake/neomake'
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'dkprice/vim-easygrep'
Plug 'mhartington/deoplete-typescript'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Shougo/unite.vim'
Plug 'm2mdas/phpcomplete-extended'
Plug 'NLKNguyen/papercolor-theme'
call plug#end()

set t_Co=256   " This is may or may not needed.
au ColorScheme * hi Normal ctermbg=none guibg=none
au ColorScheme myspecialcolors hi Normal ctermbg=red guibg=red
let g:deoplete#ignore_sources = get(g:, 'deoplete#ignore_sources', {})
let g:deoplete#ignore_sources.php = ['omni']
let g:phpcomplete_index_composer_command = 'composer'
let g:phpcd_autoload_path = 'vendor/autoload.php'

set background=dark
colorscheme PaperColor
let g:netrw_chgwin=2
let g:netrw_winsize=20
let g:netrw_usetab=1
let g:netrw_preview=1

autocmd! BufWritePost,BufEnter * Neomake
" deoplete config
let g:deoplete#enable_at_startup = 1
let g:neomake_python_enabled_makers = ['flake8']
let g:neomake_jsx_enabled_makers = ['eslint']
let g:jsx_ext_required = 0
nmap <Leader><Space>o :lopen<CR>      " open location window
nmap <Leader><Space>c :lclose<CR>     " close location window
nmap <Leader><Space>, :ll<CR>         " go to current error/warning
nmap <Leader><Space>n :lnext<CR>      " next error/warning
nmap <Leader><Space>p :lprev<CR>      " previous error/warning
let g:neomake_javascript_jscs_maker = {
      \ 'exe': 'eslit',
      \ 'args': ['-c', '--fix'],
      \ 'errorformat': '%f: line %l\, col %c\, %m',
      \ }

let g:neomake_warning_sign = {
      \ 'text': 'W',
      \ 'texthl': 'WarningMsg',
      \ }
let g:neomake_error_sign = {
      \ 'text': 'E',
      \ 'texthl': 'ErrorMsg',
      \ }


set clipboard+=unnamedplus

let g:netrw_liststyle=3

set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set showmode            " Show current mode.
set ruler               " Show the line and column numbers of the cursor.
set number              " Show the line numbers on the left side.
set formatoptions+=o    " Continue comment marker in new lines.
set textwidth=0         " Hard-wrap long lines as you type them.
set expandtab           " Insert spaces when TAB is pressed.
set tabstop=2           " Render TABs using this many spaces.
set shiftwidth=2        " Indentation amount for < and > commands.

set noerrorbells        " No beeps.
set modeline            " Enable modeline.
set linespace=0         " Set line-spacing to minimum.
set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)

" More natural splits
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.

if !&scrolloff
  set scrolloff=3       " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
  set sidescrolloff=5   " Show next 5 columns while side-scrolling.
endif
set display+=lastline
set nostartofline       " Do not jump to first character with page commands.

" Tell Vim which characters to show for expanded TABs,
" trailing whitespace, and end-of-lines. VERY useful!
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif
set list                " Show problematic characters.

" Also highlight all tabs and trailing whitespace characters.
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$\|\t/

set hlsearch            " Highlight search results.
set ignorecase          " Make searching case insensitive
set smartcase           " ... unless the query has capital letters.
set incsearch           " Incremental search.
set gdefault            " Use 'g' flag by default with :s/foo/bar/.
set magic               " Use 'magic' patterns (extended regular expressions).

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" Relative numbering
function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
    set number
  else
    set rnu
  endif
endfunc

" Toggle between normal and relative numbering.
nnoremap <leader>r :call NumberToggle()<cr>
map <leader>d :Lexplore<cr>
nnoremap <leader>. :bn<cr>
nnoremap <leader>, :bp<cr>

" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" Open buffer menu
nnoremap <Leader>b :CtrlPBuffer<CR>

let g:netrw_list_hide= '*__pycache__$'
