" Off VI compatible mode
set nocompatible
" Show line number
set number
" Show cursor position all time
set ruler
" Show command
set showcmd
" Set indent folding method
" set foldmethod=indent
" 
set incsearch
" 
set termencoding=utf-8
"
set hidden
" Auntoindent
set autoindent
" Syntax highylight
syntax on
" allow to use backspace instead of "x"
" set backspace=indent,eol,start whichwrap+=<,>,[,]
" Tab to space
set expandtab
" Tab option
set shiftwidth=4
set softtabstop=4
set tabstop=4
" Statusbar
set statusline=%<%f%h%m%r\ %b\ %{&encoding}\ 0x\ \ %l,%c%V\ %P 
set laststatus=2
" Smartident on
set smartindent

filetype on
filetype plugin on

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
   set mouse=i
endif

if expand('%:p:h') == '/usr/local/etc/apache22/Includes' 
    autocmd BufNewFile *.conf 0r .vim/skel/conf/apache_vhost.conf | 20 
    autocmd BufNewFile *.conf call s:format_apache_vhost() 
        
    function! s:format_apache_vhost() 
        set report=999 
        let vhostname = expand('%:t:r') 
        execute '%s/%vim%vhostname%/' . vhostname . '/geI' 
        execute 'w' 
        set report=2 
    endfunction 
en
