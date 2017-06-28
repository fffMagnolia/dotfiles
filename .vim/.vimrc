"" ================ General Config ====================
set number						" Show line numbers.
set ruler 						" Show the line and colomn number of the cursor position,
								" separated by a comma.
set backspace=indent,eol,start  " Allow backspace in insert mode.
set showmode					" Show current mode down the bottom.
set cursorline					" Show cursorline.
set title						" Config window title.
set expandtab					" Change tab to space.
set autoread                    " Auto Reload
set noerrorbells                " Silent error beep bell
"" ================ Indentation ====================
set autoindent
set shiftwidth=4                " Auto indent space
set tabstop=4                   " Indent space
"" ================ Ignore Files====================
set nobackup                    " No make ~file
set noundofile                  " No make .un file
set noswapfile                  " No make .swp file
"" ================ Search ====================
set hlsearch
set smartcase
set nohlsearch                  " higlight off
"" ================ Look and Feel ====================
set list						" Show <Tab>,<EOF>
set listchars=tab:>-,eol:<,trail:^
"" ================ Key Map ====================
nnoremap ; :
nnoremap sd <C-d>
nnoremap su <C-u>

"turn on syntax hilighting
syntax enable

"" ================ For Java Config ====================
"" Auto compile and execute command
autocmd FileType java :command! Exe call s:Javac()
function! s:Javac()
    :w
    let path = expand("%")
    let syn = "javac ".path
    let dpath = split(path,".java$")
    let ret = system(syn)
    if ret == ""
        :echo "======\r\nCompile Success!"
        let syn = "java ".dpath[0]
        let ret = system(syn)
        :echo "======\r\nResult:\r\n".ret
    else
        :echo "======\r\Compile Failure\r\n".ret
    endif
endfunction
" NOTE:http://lisia.hatenadiary.jp/entry/2014/01/25/000301

"" ================ Auto Comment Off====================
augroup auto_comment_off
    autocmd!
    autocmd BufEnter * setlocal formatoptions-=r
    autocmd BufEnter * setlocal formatoptions-=o
augroup END
" NOTE:http://d.hatena.ne.jp/hyuki/20140122/vim 
" NOTE:http://vim-jp.org/vimdoc-ja/autocmd.html

"" ================ dein.vim ====================
" dein.vim directory
set runtimepath+=~/dotfiles/.vim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/dotfiles/.vim/dein/repos/')
    call dein#begin('~/dotfiles/.vim/dein/repos/')

    call dein#add('Shougo/dein.vim')
    call dein#add('vim-endwise/plugin')


    call dein#end()
    call dein#save_state()
endif

filetype plugin indent on

" auto install
if dein#check_install()
    call dein#install()
endif

