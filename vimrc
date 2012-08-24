set cindent
set ignorecase
set smartcase
set tabstop=4
set expandtab
set autoindent
set backspace=2
set wrapscan
set showmatch
set wildmenu
set formatoptions+=mM
set softtabstop=4
set shiftwidth=4
au FileType html set indentexpr&
au FileType xhtml set indentexpr&
set number
set ruler
set nolist
set nowrap
set laststatus=2
set cmdheight=2
set showcmd
set title
set nobackup
set noswapfile
set visualbell t_vb=

" コマンドモードの補完で大文字小文字を無視
set wildignorecase
set wildmode=list:full

" 修正差分をファイル保存
if has('persistent_undo')
  set undodir=~/.vimundo
  augroup vimrc-undofile
    autocmd!
    autocmd BufReadPre ~/* setlocal undofile
  augroup END
endif

let $WORKS = $HOME.'/works/'

" デフォルトでcdするディレクトリを指定
cd $WORKS

" auto cd
au BufEnter * execute ":lcd ".expand("%:p:h")

" 現在カーソルの位置を記憶
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" 改行時、自動コメントを解除
au BufEnter * set formatoptions-=ro

" 保存時行末の空白を除去
au BufWritePre * :%s/\s\+$//ge

" 保存時tabを4スペースに変換
au BufWritePre *.* :%s/\t/    /ge

" vimの多重起動禁止
runtime macros/editexisting.vim

" パスワードなどを読み込み
source ~/.vim/vimrc_secret.vim

augroup InsModeAu
    autocmd!
    autocmd InsertEnter,CmdwinEnter * set noimdisable
    autocmd InsertLeave,CmdwinLeave * set imdisable
augroup END

set nocompatible " be iMproved

filetype plugin indent off " required!

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
    call neobundle#rc(expand('~/.vim/bundle/'))
endif

let NeoBundle manage NeoBundle
" required!
NeoBundle 'Shougo/neobundle.vim'
" recommended to install
" NeoBundle 'Shougo/vimproc'
" after install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
" NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'

" My Create plugin
" NeoBundle 'AtsushiM/simple-todo'
NeoBundle 'AtsushiM/simple-memo'
" NeoBundle 'AtsushiM/simple-bookmark'
" NeoBundle 'AtsushiM/simple-download'
NeoBundle 'AtsushiM/css-skelton.vim'
NeoBundle 'AtsushiM/RetinaResize'
NeoBundle 'AtsushiM/html-minifier.vim'
NeoBundle 'AtsushiM/css-minifier.vim'
NeoBundle 'AtsushiM/auto-make.vim'
NeoBundle 'AtsushiM/sass-compile.vim'
NeoBundle 'AtsushiM/get-gitrepo.vim'
NeoBundle 'AtsushiM/findpath.vim'
NeoBundle 'AtsushiM/findpath-edit.vim'
NeoBundle 'AtsushiM/findpath-absolute.vim'
NeoBundle 'AtsushiM/Vake.vim'

NeoBundle 'AtsushiM/goodbye-jquery.vim'
NeoBundle 'AtsushiM/image2base64.vim'
" NeoBundle 'AtsushiM/haml-compiler.vim'
NeoBundle 'AtsushiM/jasmine-helper.vim'

" My Bundles here:
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neocomplcache-snippets-complete'
NeoBundle 'Shougo/vimfiler'
" NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'othree/html5.vim'
" NeoBundle 'hokaccha/vim-html5validator'
NeoBundle 'thinca/vim-qfreplace'
" NeoBundle 'thinca/vim-quickrun'
" NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-surround'
NeoBundle 'vim-scripts/tComment'
NeoBundle 'kana/vim-smartchr'
NeoBundle 'mattn/zencoding-vim'
" NeoBundle 'Lokaltog/vim-powerline'
" NeoBundle 'mattn/gist-vim'
" NeoBundle 'vim-scripts/YankRing.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'scrooloose/syntastic'
" NeoBundle 'banyan/Vimpusher'
NeoBundle 'tanabe/WriteJSDocComment.vim'
" NeoBundle 'gregsexton/VimCalc'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'tell-k/vim-browsereload-mac'
NeoBundle 'jsx/jsx.vim'
NeoBundle 'vim-scripts/zoom.vim'
NeoBundle 'godlygeek/tabular'

NeoBundle 'thinca/vim-showtime'

autocmd FileType jsx compiler jsx

" Alignta
" textmanip

filetype plugin indent on " required!

nnoremap <F3> :e /Applications/XAMPP/xamppfiles/etc/extra/httpd-vhosts.conf<CR>
nnoremap <F4> :e ~/.vim/vimrc<CR>
nnoremap <F5> :source %<CR>

" map setting
" nnoremap j gj
" nnoremap k gk
" nnoremap gj j
" nnoremap gk k
" nnoremap <tab> f=2l
" inoremap <tab> <Tab>
" nnoremap <s-tab> 2F=2l
" nnoremap <C-i> <ESC>
" inoremap <C-i> <ESC>
" vnoremap <C-i> <ESC>
" cnoremap <C-i> <ESC>
" onoremap <C-i> <ESC>
" inoremap <D-o> <C-o>

"jjでESC
inoremap <expr> j getline('.')[col('.')-2] ==# 'j' ? "\<BS>\<ESC>" : 'j'

" 自殺コマンド
" command! Suicide call system('kill -KILL '. getpid())

"newline
" nnoremap <CR> o<ESC>

":only
nnoremap <silent> ;o :<C-u>on<CR>

"tab close
" nnoremap <silent> ;tc :tabc<CR>

"paste
inoremap <silent> <C-p> <C-r>x

"move window
nnoremap <silent> ;h <C-w>h
nnoremap <silent> ;k <C-w>k
nnoremap <silent> ;l <C-w>l
nnoremap <silent> ;j <C-w>j

"expand window
nnoremap <silent> ;;;j <C-w>5+
nnoremap <silent> ;;k <C-w>5-
nnoremap <silent> ;;h <C-w>10<
nnoremap <silent> ;;l <C-w>10>

" separate window
nnoremap <silent> ;v :vs<CR>
nnoremap <silent> ;s :sp<CR>

"save page
nnoremap <silent> ;w :w<CR>

"quit window
nnoremap <silent> ;d :q<CR>

"line select
nnoremap vv ^v$h
vnoremap vv $h
"tag select
nnoremap <silent> vt <Esc>F<vl%f>

"closeword
inoremap "" ""<LEFT>
inoremap '' ''<LEFT>
inoremap <> <><LEFT>

"new tab
nnoremap <silent> \t :<C-u>tabnew<CR>
nnoremap <silent> <D-T> :<C-u>tabnew<CR>

"open to browser
nnoremap <silent> <leader>w :silent ! open %<CR>

"move tab
nnoremap gh gT
nnoremap gl gt

"Search
nnoremap n nzz
nnoremap N Nzz

"window move
nnoremap L Lzz
vnoremap L Lzz
nnoremap <C-L> L
vnoremap <C-L> L
nnoremap H Hzz
vnoremap H Hzz
nnoremap <C-H> H
vnoremap <C-H> H
nnoremap zk zb
nnoremap zj zt

"expand * command for visual mode.
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v,'\/'),"\n",'\\n','g')<CR><CR>

"expand mark
nnoremap <silent> ms ms%
nnoremap <silent> my my:'s,'yy<CR>
nnoremap <silent> md md:'s,'dd<CR>
nnoremap mr mr:'s,'rs///g<Left><Left><Left>

"grep
" nnoremap ;g :vimgrep<Space>//j<Space>**.*<Space>\|<Space>cw<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>
nnoremap ;gr :Ack<Space>

"replace
nnoremap ;re :%s///g<Left><Left><Left>

"smart br
inoremap <S-CR> <br<Space>/><CR>
nnoremap <S-CR> $a<br<Space>/><Esc><S-J>i<CR><ESC>$

" 検索語が画面中央になる
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz

" 1つ前のバッファとtoggle
nnoremap <BS> :b#<CR>

" ESC連打で検索ハイライト削除
nnoremap <Esc><Esc> :nohlsearch<CR>

" <,>による連続インデント
vnoremap < <gv
vnoremap > >gv

" simple-plugins
" ToDo機能を開く
" nnoremap ;ft :SToDo<CR>
" メモ機能を開く
nnoremap ;fm :SMemo<CR>
" ブックマークを開く
" nnoremap ;fb :SBookmark<CR>
" ダウンロード機能を開く
" nnoremap ;fd :SDownload<CR>

" findpath-absolute
nnoremap <silent> ;ap :FPPathAbs<CR>
nnoremap <silent> ;aa :0,FPPathAbs<CR>
nnoremap <silent> ma ma:'s,'aFPPathAbs<CR>

" sass-compile
let g:sass_compile_auto = 1
let g:sass_compile_beforecmd = "growlnotify -t 'sass-compile.vim' -m 'start sass compile.'"
let g:sass_compile_aftercmd = "growlnotify -t 'sass-compile.vim' -m ${sasscompileresult}"

" auto-make
let g:auto_make_file = ['js']

" RetinaResize
let g:RetinaResize_Comment = 0
nnoremap ;rr :RetinaResize<CR>

" css-skelton
let g:cssskelton_type = "sass"
let g:cssskelton_ignoretags = ['html', 'head', 'title', 'meta', 'link', 'style', 'script', 'noscript', 'object', 'br', 'hr', 'img', 'embed', 'area', 'base', 'col', 'keygen', 'param', 'source']
let g:cssskelton_autoyank = 1
nnoremap ;cs :CssSkelton<CR>
nnoremap ;cm :CssSkeltonMono<CR>
nnoremap ;cp :CssPaste<CR>

" neobundle
nnoremap ;nbi :NeoBundleInstall<CR>
nnoremap ;nbu :NeoBundleInstall!<CR>

" gundo
nnoremap <silent> ;gu :GundoToggle<CR>

" syntastic
command! STM SyntasticToggleMode
" let g:syntastic_enable_signs = 1
" let g:syntastic_auto_loc_list = 2
" let g:syntastic_javascript_jslint_conf = "--white --undef --nomen --regexp --plusplus --bitwise --newcap --sloppy --vars"
" let g:syntastic_javascript_gjslint_conf = "-nojsdoc --nosummary --unix_mode --nodebug_indentation --nobeep"

" coffee-script
au BufWritePost *.coffee CoffeeMake! -cb | cwindow | redraw!

" quickrun
" let g:quickrun_config = {}
" let g:quickrun_config['coffee'] = {'command' : 'coffee', 'exec' : ['%c -cbp %s']}

" YankRing
" nnoremap ;yc :YRClear<CR>
" nnoremap ;yy :YRShow<CR>
" nnoremap ;ys :YRSearch<Space>

" matchit.vim
runtime macros/matchit.vim

" calc
" nnoremap <silent> ;ca :Calc<CR>

" chrome check(chrome reload)
nnoremap <silent> ;cc :ChromeReload<CR>

" smartchr
" js map
function! s:javascript_filetype_settings()
  inoremap <buffer><expr> { smartchr#loop(' {',' { ','{')
  inoremap <buffer><expr> : smartchr#loop(': ',':')
  inoremap <buffer><expr> ! smartchr#loop('!',' !== ')
  inoremap <buffer><expr> = smartchr#loop(' = ',' === ','=')
  inoremap <buffer><expr> + smartchr#loop(' + ',' += ','++;','+')
  inoremap <buffer><expr> - smartchr#loop(' - ',' -= ','--;','-')
  inoremap <buffer><expr> ( smartchr#loop(' (','(')
  inoremap <buffer> {} {}<LEFT>
  inoremap <buffer> [] []<LEFT>
  inoremap <buffer> () ()<LEFT>
endfunction
au BufRead *.js call s:javascript_filetype_settings()

" css map
function! s:css_filetype_settings()
  inoremap <buffer><expr> { smartchr#loop(' {',' { ','{')
  inoremap <buffer><expr> : smartchr#loop(': ',':')
  inoremap <buffer> {} {}<LEFT>
  inoremap <buffer> [] []<LEFT>
  inoremap <buffer> () ()<LEFT>
endfunction
au BufRead *.css call s:css_filetype_settings()
au BufRead *.scss call s:css_filetype_settings()

" haml map
" function! s:haml_filetype_settings()
"     setlocal softtabstop=2
"     setlocal shiftwidth=2
" endfunction
" au BufRead *.haml call s:haml_filetype_settings()

" html5validator
" nnoremap <silent> ;hv :HTML5Validate<CR>

" zencoding
" let g:use_zen_complete_tag = 1
let g:user_zen_expandabbr_key = '<C-q>'

" vimfiler
let g:vimfiler_as_default_explorer=1
let g:vimfiler_safe_mode_by_default=0

nnoremap <silent> ;e :VimFiler<CR>

" neocomplcache
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 0
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 0
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 1
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions',
    \ 'scss' : $HOME.'/.vim/dict/css.dict'
    \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

let g:neocomplcache_snippets_dir = "~/.vim/snippets"
" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default'    : '',
    \ 'javascript' : $HOME . '/.vim/dict/javascript.dict'
    \ }

" Define Keybinds.
imap <expr><C-s> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : "\<C-n>"
smap <C-s> <Plug>(neocomplcache_snippets_expand)

" unite.vim
" 入力モードで開始する
let g:unite_enable_start_insert=1
" ファイル一覧
nnoremap <silent> ;uf :<C-u>UniteWithBufferDir -buffer-name=files file file/new<CR>
" 常用セット
nnoremap <silent> ;uu :<C-u>Unite buffer file_mru<CR>
" Worksフォルダ
exec 'nnoremap <silent> ;uw :<C-u>Unite -input='.$WORKS.' file file/new<CR>'
" 行検索
nnoremap <silent> ;ul :<C-u>Unite line<CR>

imap <C-u> <Plug>(neocomplcache_start_unite_complete)

" indent-guide
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1

"insert comment to end tag
function! Endtagcomment()
    let reg_save = @@

    try
        silent normal vaty
      catch
        execute "normal \<Esc>"
        echohl ErrorMsg
        echo 'no match html tags'
        echohl None
        return
    endtry

    let html = @@

    let start_tag = matchstr(html, '\v(\<.{-}\>)')
    let tag_name  = matchstr(start_tag, '\v([a-zA-Z]+)')

    let id = ''
    let id_match = matchlist(start_tag, '\vid\=["'']([^"'']+)["'']')
    if exists('id_match[1]')
        let id = '#' . id_match[1]
    endif

    let class = ''
    let class_match = matchlist(start_tag, '\vclass\=["'']([^"'']+)["'']')
    if exists('class_match[1]')
        let class = '.' . join(split(class_match[1], '\v\s+'), '.')
    endif

    execute "normal `]va<\<Esc>`<"

    let comment = g:endtagcommentFormat
    let comment = substitute(comment, '%id', id, 'g')
    let comment = substitute(comment, '%class', class, 'g')
    let @@ = comment

    normal ""P

    let @@ = reg_save
endfunction

let g:endtagcommentFormat = '<!-- /%id%class -->'
nnoremap ,t :<C-u>call Endtagcomment()<CR>

function! CSS3PropertyDuplicate()
  let reg_save = @@

  silent normal Y
  let css3 = @@
  let ind = matchlist(css3, '\v(\s*)(.*)')
  let webkit = ind[1] . "-webkit-" . ind[2]
  let moz    = ind[1] . "-moz-"    . ind[2]
  let ms     = ind[1] . "-ms-"     . ind[2]
  let o      = ind[1] . "-o-"      . ind[2]

  let @@ = webkit . moz . ms . o
  normal ""P

  let @@ = reg_save
endfunction
nnoremap ,3 :<C-u>call CSS3PropertyDuplicate()<CR>

function! WindowExpand()
  set fuoptions=maxvert,maxhorz
  set lines=90 columns=400
  set guioptions-=T
  "au GUIEnter * set fullscreen

  set showtabline=2
  set transparency=10
endfunction

call WindowExpand()
