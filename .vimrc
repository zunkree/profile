" Off VI compatible mode
set nocompatible
" Show line number
set nonumber
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

set modeline

set backupdir=~/.vim/backup/

" Syntax highlight
syntax on
filetype on
filetype plugin on

" In many terminal emulators the mouse works just fine, thus enable it.
set mouse=

inoremap <silent> <C-u> <ESC>u:set paste<CR>.:set nopaste<CR>gi

au FileType crontab,fstab,make set noet ts=8 sw=8 

if expand('%:p:h') == '/usr/local/etc/apache22/Includes' 
    autocmd BufNewFile *.conf 0r ~/.vim/skel/conf/vhost_apache.conf 
    autocmd BufNewFile *.conf call s:format_vhost() 
en

if expand('%:p:h') == '/usr/local/etc/nginx/include' 
    autocmd BufNewFile *.conf 0r ~/.vim/skel/conf/vhost_nginx.conf 
    autocmd BufNewFile *.conf call s:format_vhost()     
en

if expand('%:p:h') == '/usr/local/etc/nginx/Include' 
    autocmd BufNewFile *.conf 0r ~/.vim/skel/conf/vhost_nginx.conf 
    autocmd BufNewFile *.conf call s:format_vhost()     
en

function! s:format_vhost() 
    set report=999 
    let vhostname = expand('%:t:r') 
    execute '%s/%vim%vhostname%/' . vhostname . '/geI' 
    execute 'w' 
    set report=2 
endfunction
