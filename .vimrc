" Off VI compatible mode
set nocompatible
" Show line number
set nonumber
" Show cursor position all time
set ruler
" Show command
set showcmd
" Set indent folding method
set foldmethod=indent
set foldlevelstart=20
" set foldcolumn=1
" 
set incsearch
" 
set termencoding=utf-8
"
set hidden
" Auntoindent
set autoindent
" allow to use backspace instead of "x"
set backspace=indent,eol,start whichwrap+=<,>,[,]
" Tab to space
set expandtab
" Tab option
set shiftwidth=4
set softtabstop=4
set tabstop=4
" Statusbar
set statusline=%f%m%r%h%w\ %y\ enc:%{&enc}\ ff:%{&ff}\ fenc:%{&fenc}%=(ch:%3b\ hex:%2B)\ col:%2c\ line:%2l/%L\ [%2p%%] 
set laststatus=2
" Smartident on
set smartindent
"
set modeline
"
set backupdir=~/.vim/backup/
" Pathogen load
filetype off
call pathogen#infect()
call pathogen#helptags()
" Syntax highlight
syntax on
filetype on
filetype plugin on
filetype plugin indent on
" Disable mouse.
set mouse=
" Restore structure after past text
inoremap <silent> <C-u> <ESC>u:set paste<CR>.:set nopaste<CR>gi
" Not working
au FileType crontab,fstab,make set noet ts=8 sw=8 

" TODO: need refactoring -- move to separate file
if expand('%:p:h') == '/usr/local/etc/apache22/Includes' 
    autocmd BufNewFile *.conf 0r ~/.vim/skel/conf/vhost_apache.conf 
    autocmd BufNewFile *.conf call s:format_vhost() 
en

if expand('%:p:h') == '/usr/local/etc/nginx/include' 
    autocmd BufNewFile *.conf 0r ~/.vim/skel/conf/vhost_nginx.conf 
    autocmd BufNewFile *.conf call s:format_vhost()     
en

if expand('%:p:h') == '/usr/local/etc/nginx/Includes' 
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

""" Python
let python_highlight_all = 1
autocmd FileType python normal m`:%s/\s\+$//e ``
autocmd FileType python set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
"" omni enable
autocmd FileType python set omnifunc=pythoncomplete#Complete
"" omni on ctrlspace
" inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
"             \ "\<lt>C-n>" :
"             \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
"             \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
"             \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
" imap <C-@> <C-Space>
