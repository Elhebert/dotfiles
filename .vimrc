set encoding=utf-8

set number
set showcmd
set wildmenu
set showmatch
set listchars=tab:\|\ 
set list

set incsearch
set hlsearch

set foldenable
set foldlevelstart=99
set foldnestmax=10
set foldmethod=indent

augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd BufWritePre *.php
               \:call <SID>StripTrailingWhitespaces()
    autocmd FileType php setlocal tabstop=2
    autocmd FileType php setlocal shiftwidth=2
    autocmd FileType php setlocal softtabstop=2
    autocmd FileType php setlocal expandtab
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
augroup END
