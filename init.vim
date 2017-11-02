
" package manager dein Scripts----------------------------- {{{
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/chengyu/.config/nvim/dein//repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/chengyu/.config/nvim/dein/')
    call dein#begin('/home/chengyu/.config/nvim/dein/')

    " Let dein manage dein
    " Required:
    call dein#add('/home/chengyu/.config/nvim/dein//repos/github.com/Shougo/dein.vim')

    " Add or remove your plugins here:
    call dein#add('Shougo/neosnippet.vim')
    call dein#add('Shougo/neosnippet-snippets')
    " install nerd-tree
    call dein#add('scrooloose/nerdtree')
    " install ctrlp
    call dein#add('kien/ctrlp.vim')
    " install surround
    call dein#add('tpope/vim-surround')
    " install ag grepper
    call dein#add('rking/ag.vim')
    " install grep replacer
    call dein#add('skwp/greplace.vim')
    " install nerd commenter
    call dein#add('scrooloose/nerdcommenter')
    " install nerd solarized colors
    call dein#add('altercation/vim-colors-solarized')
    " install deoplete.nvim
    call dein#add('Shougo/deoplete.nvim')
    " install deoplete
    call dein#add('zchee/deoplete-jedi')
    " install ternjs
    call dein#add('carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' })
    " install trailing white space fix
    call dein#add('bronson/vim-trailing-whitespace')
    " install js beautifier
    call dein#add('maksimr/vim-jsbeautify')
    " install fugitive for easy git operation
    call dein#add('tpope/vim-fugitive')
    " install emmet for easy html generation
    call dein#add('mattn/emmet-vim')


    " You can specify revision/branch/tag.
    " call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

    " Required:
    call dein#end()
    call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts----------------------
" }}}


" Vimscript file settings ---------------------- {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" leader is
let mapleader = ";"

let g:enable_jump_normal = 1

let g:disable_arrow_keys = 1

" pr means print
iabbrev pr print()

" edit mod remaps of Cheng s3341458 ---------------------- {{{
" obvious cursor movement will cause vim enter command mod
function! TurnOnJumpNormalShortcuts()
    inoremap jk <esc>
    inoremap jj <esc>
    inoremap hh <esc>
    inoremap lll <esc>
    inoremap kk <esc>
    inoremap kj <esc>
endfunction

function! TurnOffJumpNormalShortcuts()
    inoremap jk jk
    inoremap jj jj
    inoremap hh hh
    inoremap lll lll
    inoremap kk kk
    inoremap kj kj
endfunction


" can delete entire line on edit
inoremap <c-d> <esc>ddi

" can delete previous word on edit
inoremap <c-e> <esc>eldbi

" can delete next word on edit
inoremap <c-b> <esc>bhdei

" }}}

" normal mod remaps of Cheng s3341458 ---------------------- {{{
nnoremap <F2> :call ToggleModeJump()<cr>
nnoremap <F3> :call LineNumberToggle()<cr>
" toggle highlight search
nnoremap <F4> :call HighlightSearchToggle()<cr>
nnoremap <F5> :call ArrowDisableToggle()<cr>


" function for toggle customized motion shortcuts
function! ToggleModeJump()
    if g:enable_jump_normal
        call TurnOffJumpNormalShortcuts()
        echo "disable mormal jump"
        let g:enable_jump_normal = 0
    else
        call TurnOnJumpNormalShortcuts()
        echo "enable mormal jump"
        let g:enable_jump_normal = 1
    endif
endfunction

" function for toggle line number showing style(relative or aboslute)
function! LineNumberToggle()
  if &relativenumber == 1
    set norelativenumber
    echo "using absolute line number"
  else
    set relativenumber
    echo "using relative line number"
  endif
endfunc

" function for toggle whether highlight should be shown
function! HighlightSearchToggle()
  if &hlsearch == 1
    set nohlsearch
    echo "not highlighting search"
  else
    set hlsearch
    echo "highlighting search"
  endif
endfunc


" function for toggle disable or enable arrow keys
function! ArrowDisableToggle()
    if g:disable_arrow_keys
        noremap <Up> <Nop>
        noremap <Down> <Nop>
        noremap <Left> <Nop>
        noremap <Right> <Nop>
        echo "disable arrow keys"
        let g:disable_arrow_keys = 0
    else
        noremap <Up> <Up>
        noremap <Down> <Down>
        noremap <Left> <Left>
        noremap <Right> <Right>
        echo "enable arrow keys"
        let g:disable_arrow_keys = 1
    endif
endfunc

call ArrowDisableToggle()
call TurnOnJumpNormalShortcuts()

" navigate to different window
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" H move the first of the line, L move to the last of the line
nnoremap H ^
nnoremap L $

" space to select the cursor in word
noremap <space> viw

" can wrap word with "
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel

" short cut for edit vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" active vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

" - will move line to line blow
nnoremap - ddp

" = will move line to line up
nnoremap = ddkP

" grep shortcuts
" nnoremap <leader>g :silent execute "grep! -R " . shellescape(expand("<cword>")) . " ."<cr>:copen<cr>
nnoremap <leader>g :execute "grep! -R " . shellescape(expand("<cword>")) . " ."<cr>:copen<cr>
nnoremap <leader>G :execute "grep! -R " . shellescape(expand("<cWORD>")) . " ."<cr>:copen<cr>

" tab swtich shortcuts
nnoremap <A-1> 1gt
nnoremap <A-2> 2gt
nnoremap <A-3> 3gt
nnoremap <A-4> 4gt
nnoremap <A-5> 5gt
nnoremap <A-6> 6gt
nnoremap <A-7> 7gt
nnoremap <A-8> 8gt
nnoremap <A-9> 9gt
nnoremap <A-0> 10gt

" shortcut for close tab
nnoremap <A-Q> :tabclose<cr>


" my operator from learn vimscript the hard way
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>


" }}}

" terminal mod remaps of Cheng s3341458 ---------------------- {{{
"
" navigate to different window
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l

" shortcut for terminal emulator true normal mode
tnoremap <A-n> <C-\><C-n>

" }}}

" visual mod remaps of Cheng s3341458 ---------------------- {{{
" wrap select text wih " or '
vnoremap <leader>" c""<esc>bp
vnoremap <leader>' c''<esc>bp

" H move the first of the line, L move to the last of the line
vnoremap H ^
vnoremap L $

" type // to search selected text of current file
vnoremap // y/<C-R>"<CR>

" able to copy things and paste things outside vim"
vnoremap <C-c> "+y

" file substitue replace command shortcut
vnoremap r y:%s/<C-r>"/<C-r>"/g<C-b>
vnoremap R y:%s/<C-r>"//g<C-b>
" }}}

" command mode remaps of Cheng s3341459 ---------------------- {{{
" split a teminal for operating


" }}}

" auto comment out the javascript and python
augroup lang_short_cuts
    autocmd!
    autocmd FileType javascript nnoremap <buffer> <c-c> I//<esc>
    autocmd FileType javascript :iabbrev <buffer> iff if ()<left>
    autocmd FileType python nnoremap <buffer> <c-c> I#<esc>
    autocmd FileType python     :iabbrev <buffer> iff if:<left>
augroup END

" highlight white space of trailing space
augroup highlight_trailing_space
    autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
    autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
    autocmd InsertLeave * match ExtraWhitespace /\s\+$/
    autocmd BufWinLeave * call clearmatches()
augroup END

" ensure absolute line number when lose focus or into insert mode
augroup line_number_abosolute
    autocmd FocusLost * :set norelativenumber
    autocmd FocusGained * :set relativenumber
    autocmd InsertEnter * :set norelativenumber
    autocmd InsertLeave * :set relativenumber
augroup END

" status indicator
set statusline=%f         " Path to the file
set statusline+=%=        " Switch to the right side
set statusline+=%l        " Current line
set statusline+=/         " Separator
set statusline+=%L        " Total lines
set statusline=%t       "tail of the filename
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "fisetype
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file


" settings of Cheng s3341458 ---------------------- {{{
" enable syntax highlighting
syntax enable

" show line numbers
set number
set relativenumber

" set tabs to have 4 spaces
let &ts=4

" indent when moving to the next line while writing code
set autoindent

" expand tabs into spaces
set expandtab

" when using the >> or << commands, shift lines by 4 spaces
let &shiftwidth=4

" show a visual line under the cursor's current line
set cursorline

" show the matching part of the pair for [] {} and ()
set showmatch

" have a length indication column at col 80
set colorcolumn=80

" hightlight matched pattern of search last typed
set hlsearch

" hightlight matched pattern of search when typing
set incsearch

" enable all Python syntax highlighting features
let python_highlight_all = 1

set autowriteall

" always split on right
set splitright

" be case sensitive
set noignorecase

" open quick fix window in a new tab
  set switchbuf+=newtab

filetype off
filetype plugin indent on

" }}}

" set my email address
iabbrev @@ chengyu0316@gmail.com

" Vimscript file settings ---------------------- {{{
 augroup filetype_vim
     autocmd!
     autocmd FileType vim setlocal foldmethod=marker
 augroup END
     " }}}

" welcome words of Cheng s3341458 ---------------------- {{{
echo "o(^3^)o"
if "foo" == "FOO"
    echo "this vim is case insensitive"
elseif "foo" == "foo"
    echo "this vim is case sensitive"
endif
" }}}

" pymode plugin customization ---------------------- {{{
    " I always using python 3 so pymode checker should using python 3
    "let g:pymode_python = 'python3'
    " do not like too serious syntax checker
    "let g:pymode_lint_checkers = ['']
    "set runtimepath-=~/.vim/bundle/python-mode
" }}}

" nerd tree plugin customization ---------------------- {{{
    " Ctrl + n toggle nerdTree
    map <C-n> :NERDTreeToggle<CR>
" }}}

" ctrlp plugin customization ---------------------- {{{
    " almost ulimited search depth 40
    let g:ctrlp_max_depth=40
    " ulimited search files limit
    let g:ctrlp_max_files=0
" }}}

" emmet plugin customizations ---------------------- {{{
    let g:user_emmet_mode='a'    "enable all function in all mode.

    " only when it is in html or css files
    let g:user_emmet_install_global = 0
    augroup emmet_only_on_html_css
        autocmd!
        autocmd FileType html,css EmmetInstall
    augroup END
    " remap the shortcut key rm
    "let g:user_emmet_leader_key='<C-Y>'

" }}}

" solarized plugin customization ---------------------- {{{
    " terminal colors support 256
    let g:solarized_termcolors=256
    " using the dark theme to protect eyes
    set background=dark
    " termial transparent since I have already adjust my terminal
    " to my most eye comfortable color
    let g:solarized_termtrans=1
    colorscheme solarized
" }}}

" ag plugin customization ---------------------- {{{

nnoremap <leader>a :set operatorfunc=<SID>AgOperator<cr>g@
vnoremap <leader>a :<c-u>call <SID>AgOperator(visualmode())<cr>

function! s:AgOperator(type)
    let saved_unnamed_register = @@

    if a:type ==# 'v'
            normal! `<v`>y
    elseif a:type ==# 'char'
            normal! `[v`]y
    else
            return
    endif

    execute "Ag -Q " . shellescape(@@) . " "
    copen

    let @@ = saved_unnamed_register
endfunction

" }}}

" neocomplete plugin customization ---------------------- {{{
    " refer to https://www.gregjs.com/vim/2016/configuring-the-deoplete-asynchronous-keyword-completion-plugin-with-tern-for-vim/
    " Disable AutoComplPop.
    let g:acp_enableAtStartup = 0
    " Use deoplete on start
    let g:deoplete#enable_at_startup = 1
    " Use smartcase.
    let g:deoplete#enable_smart_case = 1
    " Set minimum syntax keyword length.
    let g:deoplete#sources#syntax#min_keyword_length = 2
    " AutoComplPop like behavior.
    let g:neocomplete#enable_auto_select = 0

    if !exists('g:deoplete#omni#input_patterns')
      let g:deoplete#omni#input_patterns = {}
    endif
    " let g:deoplete#disable_auto_complete = 1
    "autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

    " omnifuncs
    augroup omnifuncs
      autocmd!
      autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
      autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
      autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
      autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
      autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    augroup end
    " tern
    if exists('g:plugs["tern_for_vim"]')
      let g:tern_show_argument_hints = 'on_hold'
      let g:tern_show_signature_in_pum = 1
      autocmd FileType javascript setlocal omnifunc=tern#Complete
    endif
    " deoplete tab-complete
    inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
    " tern
    autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>
" }}}

" Greplace plugin customization ---------------------- {{{
    nnoremap <leader>g :set operatorfunc=<SID>GsearchOperator<cr>g@
    vnoremap <leader>g :<c-u>call <SID>GsearchOperator(visualmode())<cr>
    nnoremap <leader>r :<c-u>call <SID>GreplaceOperator()<cr>

    function! s:GsearchOperator(type)
        let saved_unnamed_register = @@

        if a:type ==# 'v'
                normal! `<v`>y
        elseif a:type ==# 'char'
                normal! `[v`]y
        else
                return
        endif

        execute "Gsearch -F " . shellescape(@@) . " ."

        let @@ = saved_unnamed_register
    endfunction

    function! s:GreplaceOperator()
        execute "Greplace"
    endfunction
" }}}
