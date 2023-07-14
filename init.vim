call plug#begin('~/.vim/plugged')

Plug 'tonyc/vim-vividchalk'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-syntastic/syntastic'

Plug 'junegunn/fzf' , { 'do': {  -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'posva/vim-vue'

" airline stuff
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'airblade/vim-gitgutter'

set updatetime=250

"Plug 'dense-analysis/ale'
Plug 'elixir-editors/vim-elixir'
Plug 'andyl/vim-textobj-elixir'
Plug 'mhinz/vim-mix-format'

Plug 'bronson/vim-ruby-block-conv'
Plug 'Raimondi/delimitMate'
Plug 'kana/vim-smartinput'
Plug 'kana/vim-textobj-user'
" vim-align maps <leader>rwp, which I don't like.
"Plug 'pix/vim-align'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-rails'
Plug 'vim-scripts/JavaScript-syntax'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/matchit.zip'
Plug 'vim-scripts/textobj-rubyblock'
Plug 'plasticboy/vim-markdown'
Plug 'kana/vim-textobj-function'
" required by snipmate
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'

" requires the two above here
Plug 'garbas/vim-snipmate'


" coc/ruby
let g:coc_global_extensions = []
"let g:coc_global_extensions = ['coc-solargraph']

"inoremap <silent><expr> <TAB>
"      \ pumvisible() ? "\<C-n>" :
"      \ <SID>check_back_space() ? "\<TAB>" :
"      \ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


"syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" javascript stuff
"Plug 'digitaltoad/vim-jade'
"Plug 'vim-scripts/node'
"Plug 'thinca/vim-textobj-function-javascript'


" JSON syntax
Plug 'elzr/vim-json'

" CSV syntax
Plug 'mechatroner/rainbow_csv'

call plug#end()
" end plug setup

let g:snipMate = { 'snippet_version' : 1 }


syntax enable

colorscheme vividchalk

set autoread
set background=dark

" tabs & spaces
set autoindent      " when indenting, copy indentation from previous line
set copyindent      " Copy the structure of the existing lines indent when autoindenting a new line
set preserveindent  " When changing the indent of the current line, preserve as much of the indent structure as possible
set smartindent
set tags=tags;/     " Look for tags in current directory, otherwise recurse upwards looking for a tags file
set expandtab       "spaces instead of tabs for better cross-editor compatibility

set backspace=indent,eol,start " allow backspacing over everything

set t_Co=256
set ttyfast

" indenting
set softtabstop=2
set shiftwidth=2
set tabstop=2

" don't search all files on the path
set complete-=i

set cursorline
"set cursorcolumn=80,120

set foldmethod=syntax
set norelativenumber
set nofoldenable
set foldnestmax=10
set foldlevel=0

set hidden
set hlsearch
set ignorecase
set incsearch

" allow question marks to be part of a keyword (e.g. "present?")
set iskeyword+=?
" set iskeyword+=:

set laststatus=2
set list!
set listchars=tab:▸▸,trail:◂
"set mouse=a
set nobackup
set noswapfile
set nowrap
set nowritebackup
set number
"set scroll=2
set scrolloff=3
set shortmess=atI
set showmatch
set smartcase
"set splitbelow
set splitright
set title
set visualbell
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*.so
set wildmenu
set wildmode=list:longest
"set winwidth=84
" We have to have a winheight bigger than we want to set winminheight. But if
" we set winheight to be huge before winminheight, the winminheight set will
" fail.
"set winheight=10
"set winminheight=10
"set winheight=999

" terminal color customizations
highlight LineNr ctermbg=DarkBlue
highlight Search ctermbg=4 ctermfg=White

" sign column highlight
highlight GitGutterAdd ctermfg=darkgreen term=bold
highlight GitGutterDelete ctermfg=darkred term=bold
highlight GitGutterChange ctermfg=165 term=bold
highlight GitGutterChangeInvisible ctermfg=yellow term=bold

autocmd BufReadPost * highlight SignColumn ctermbg=black

"autocmd BufReadPost *.html.heex set ft=html
au BufRead,BufNewFile *.ex,*.exs set filetype=elixir
au BufRead,BufNewFile *.eex,*.heex,*.leex,*.sface,*.lexs set filetype=eelixir
au BufRead,BufNewFile mix.lock set filetype=elixir

" airline
"autocmd BufReadPost * AirlineTheme light

" fix to check file modification time when mix formats the file underneath
set autoread
autocmd CursorHold *.ex,*.exs? checktime
autocmd CursorMoved *.ex,*.exs? checktime
"autocmd CursorMovedI *.ex,*.exs? checktime

" turn off the underline for cursorline in terminal
hi CursorLine cterm=NONE

hi StatusLine term=bold cterm=NONE ctermfg=white ctermbg=darkblue "#aabbee

" gitgutter customizations

" set search background to a usable color
hi Search ctermfg=Black ctermbg=Yellow
hi Cursor ctermfg=Black ctermbg=Green

hi clear IncSearch
hi IncSearch cterm=reverse

" change cursor shape for iterm
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

let mapleader = ','

let delimitMate_expand_space = 1

" :h <subject> to open help in new tab
cabbrev h tab h

" Elixir stuff
let g:mix_format_on_save = 1

" elixirLS

augroup elixir
  autocmd FileType elixir nnoremap <c-]> :ALEGoToDefinition<cr>
augroup END

"let g:ale_linters.elixir = ['elixir-ls']
let g:ale_linters = { 'elixir': ['credo', 'elixir-ls'], 'ruby': [] }
let g:ale_fixers = { '*': [], 'elixir': '', }
"let g:ale_fixers = { '*': ['remove_trailing_lines', 'trim_whitespace'], 'elixir': 'mix_format', }

let g:ale_elixir_elixir_ls_release = $HOME . '/dev/elixir-ls/rel'
let g:ale_elixir_elixir_ls_config = {'elixirLS': {'dialyzerEnabled': v:false}}

set completeopt=menu,menuone,preview,noselect,noinsert
let g:ale_completion_enabled = 1

let g:ale_completion_enabled = 1
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
let g:ale_linters_explicit = 1
let g:ale_lint_on_save = 1

nnoremap ]r :ALENextWrap<CR>
nnoremap [r :ALEPreviousWrap<CR>

nnoremap <leader>r :Buffers<CR>
nnoremap <leader>q :bdel!<CR>

"copy/paste
nnoremap <leader>Y "+yy
nnoremap <leader>y "+y

" airline/powerline

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_powerline_fonts = 1
let g:airline_symbols.dirty = '*'


map <D-'> :Align=><CR>

if has("gui")
  set guifont=Inconsolata:h16
  set guioptions-=T
  set guioptions-=L

  " always show the tab bar
  set showtabline=1
  
  " switch to tabs with cmd-1, cmd-2 etc
  map <D-1> :tabn 1<CR>
  map <D-2> :tabn 2<CR>
  map <D-3> :tabn 3<CR>
  map <D-4> :tabn 4<CR>
  map <D-5> :tabn 5<CR>
  map <D-6> :tabn 6<CR>
  map <D-7> :tabn 7<CR>
  map <D-8> :tabn 8<CR>
  map <D-9> :tabn 9<CR>
  map! <D-1> <C-O>:tabn 1<CR>
  map! <D-2> <C-O>:tabn 2<CR>
  map! <D-3> <C-O>:tabn 3<CR>
  map! <D-4> <C-O>:tabn 4<CR>
  map! <D-5> <C-O>:tabn 5<CR>
  map! <D-6> <C-O>:tabn 6<CR>
  map! <D-7> <C-O>:tabn 7<CR>
  map! <D-8> <C-O>:tabn 8<CR>
  map! <D-9> <C-O>:tabn 9<CR>
endif

" hoist lines up or down with alt-j/alt-k
" http://vim.wikia.com/wiki/Moving_lines_up_or_down

nnoremap ]a :ALENextWrap<cr>zz
nnoremap [a :ALEPreviousWrap<cr>zz

nnoremap <C-J> :m+<CR>==
nnoremap <C-K> :m-2<CR>==
inoremap <D-j> <Esc>:m+<CR>==gi
inoremap <D-k> <Esc>:m-2<CR>==gi
vnoremap <D-j> :m'>+<CR>gv=gv
vnoremap <D-k> :m-2<CR>gv=gv

" highlight the current word, but return to it
nnoremap * *#

" reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" easy split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <leader>x :spl<cr>
nnoremap <leader>v :vspl<cr>


" quick fix navigation
nnoremap <silent> <leader>] :cnext<CR>
nnoremap <silent> <leader>] :cprevious<CR>

" trim all trailing whitespace
"nnoremap <leader>s mz:%s/\s\+$//e<CR>:nohlsearch<CR>`z:echo "Trailing whitespace removed"<CR>

"map <leader>gv :CtrlP app/views<cr>
"map <leader>gc :CtrlP app/controllers<cr>
"map <leader>gm :CtrlP app/models<cr>
"map <leader>gh :CtrlP app/helpers<cr>
"map <leader>gl :CtrlP lib<cr>
"map <leader>gls :CtrlP lib/simple/schema<cr>
"map <leader>gp :CtrlP public<cr>
"map <leader>gv :CtrlP app/views<cr>
"map <leader>gc :CtrlP app/controllers<cr>
"map <leader>gm :CtrlP app/models<cr>
"map <leader>gh :CtrlP app/helpers<cr>
"map <leader>gl :CtrlP lib<cr>
"map <leader>gp :CtrlP public<cr>
"map <leader>ga :CtrlP app/assets<cr>
"map <leader>gs :CtrlP app/assets/stylesheets<cr>
"map <leader>gj :CtrlP app/assets/javascripts<cr>
"map <leader>gf :CtrlP spec/factories<cr>

let g:ctrlp_use_caching = 0
let g:ctrlp_match_window_reversed = 1
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_jump_to_buffer = 2
let g:ctrlp_open_multi = '1h'

let g:ctrlp_custom_ignore = { 'dir' : '\public/uploads\|node_modules\|deps\|_build\|\app/assets/images\|vendor/assets/images\|tmp\|bin|\.git|\.bundle|coverage|log' }

let g:ctrlp_highlight_match = [1, 'Search']
let g:ctrlp_max_height = 10

" Edit or view files in same directory as current file
cnoremap %% <C-R>=expand('%:h').'/'<cr>

map <leader>e :edit %%
map <leader>v :view %%


" RainbowCSV bindings
"nnoremap <leader>ra :RainbowAlign<CR>
"nnoremap <leader>rs :RainbowShrink<CR>

" Surround binds
"map <leader>s( ysiW)
"map <leader>s[ ysiW]

" Set the netrw listing style to tree
let g:netrw_liststyle = 3

" open file in previous buffer
let g:netrw_browse_split = 2

" preview window shown in a vertical split
let g:netrw_preview = 1

" opening a file in a vertical split using 'v' should open to the right
let g:netrw_altv = 1

" netrw window takes up 20%
let g:netrw_winsize = '20'

" highlight json as javascript in markdown code sections
let g:vim_markdown_fenced_languages = ['json=json']

" turn off quote concealing for json
let g:vim_json_syntax_conceal = 0

noremap n nzz
noremap N Nzz

" opening a file in a vertical split using 'v' should open to the right
let g:netrw_altv = 1

" force the new window to split 50/50
let g:netrw_winsize = ''

nnoremap ; :set invhlsearch<CR>

if !exists("autocommandsLoaded")
  let autocommandsLoaded = 1
  " Gemfile is ruby syntax
  autocmd BufNewFile,BufRead Gemfile,Guardfile setlocal filetype=ruby
  autocmd BufEnter * exe "normal zR"
endif

runtime macros/matchit.vim

nnoremap <CR> :nohlsearch<cr>
" switch to the last used file with ,,
nmap <leader><leader> <C-^>

nnoremap <Home> ^
nnoremap \ %

" ctrl-l does a hashrocket in insert mode!
imap <C-l> <space>=><space>

" Other rails-specific stuff
map <leader>gr f(gf
"map <leader>gr :topleft :split config/routes.rb<cr>
"map <leader>gg :topleft :split Gemfile<cr>

"map <leader>rc :topleft :split $MYVIMRC<cr>

" W isn't bound to anything
command! W :w

command! -nargs=* T split | terminal <args>

" fzf/ripgrep config
"map <D-t> :GFiles<cr>
map <leader>f :Files<cr>
map <leader>F :Rg<cr>
map \ :Rg<cr>
map <leader>c :Tags<cr>
map <leader>gm :Files app/models<cr>
map <leader>gc :Files app/controllers<cr>
map <leader>gs :Files app/services<cr>

let g:fzf_preview_window = []
"let g:fzf_layout = { 'down': '12' }
"let g:fzf_layout = { 'window': { 'width': 0.25, 'height': 0.2 } }
"let g:fzf_layout = { 'window': { 'width': 120, 'height': 14, 'yoffset': 0, 'border': 'rounded' } }
let g:fzf_layout = { 'window': { 'width': 120, 'height': 0.5, 'yoffset': 0, 'border': 'rounded' } }

let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'

command! -bang -nargs=* RgTony call fzf#vim#grep("rg --line-number --no-heading --color=always --smart-case -- ".shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0)
"command! -bang -nargs=* RgTony call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case -- ".shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0)

"" custom ripgrep command
"command! -bang -nargs=* RgTony
"  \ call fzf#vim#grep(
"  \   'rg --column --line-number -w --hidden --ignore-case --no-heading --color=always -- '.shellescape(<q-args>), 1,
"  \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
"  \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%', '?'),
"  \   <bang>0)

"command! -bang LibFiles call fzf#vim#files('lib/simple', <bang>0)
"nnoremap <leader>l :LibFiles<cr>

"command! -bang SchemaFiles call fzf#vim#files('lib/simple/schema', <bang>0)
"nnoremap <leader>s :SchemaFiles<cr>

"command! -bang WebFiles call fzf#vim#files('web', <bang>0)
"nnoremap <leader>w :WebFiles<cr>

"command! -bang TestFiles call fzf#vim#files('web', <bang>0)
"nnoremap <leader>gt :TestFiles<cr>

"command! -bang DirFiles call fzf#vim#files(expand('%:p:h'), <bang>0)
"nnoremap <leader>d :DirFiles<cr>


function! RunAllTests()
  :w
  :exec ":T echo \"Running all tests\"; mix test"
endfunction

" Rails/rspec test runners
function! RunTests(filename)
    " Write the file and run tests for the given filename
    :w
    :exec ":T echo \"Running " . a:filename . "\"; mix test " . a:filename
endfunction

function! SetTestFile()
    " Set the spec file that tests will be run for.
    let t:grb_test_file=@%
endfunction

function! RunTestFile(...)
    if a:0
        let command_suffix = a:1
    else
        let command_suffix = ""
    endif

    " Run the tests for the previously-marked file.
    let in_spec_file = match(expand("%"), '_test.exs$') != -1
    if in_spec_file
        call SetTestFile()
    elseif !exists("t:grb_test_file")
        return
    end
    call RunTests(t:grb_test_file . command_suffix)
endfunction

function! RunNearestTest()
    let spec_line_number = line('.')
    call RunTestFile(":" . spec_line_number)
endfunction

" Run this file
map <leader>T :call RunTestFile()<cr>
" Run only the example under the cursor
map <leader>t :call RunNearestTest()<cr>
" Run all test files
map <leader>a :call RunAllTests()<cr>

"map <leader>a :A<cr>
map <leader>av :AV<CR>
map <leader>as :AS<CR>

map <Left> <nop>
map <Right> <nop>
map <Up> <nop>
map <Down> <nop>

highlight SignColumn ctermbg=black

set ignorecase
