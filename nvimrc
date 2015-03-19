set nocompatible
set ttyfast    "Improves smoothness
set shell=bash "compatibility

"vim plug
"
"Automatic install if it's not already present:
if empty(glob('~/.nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

"call
call plug#begin('~/.nvim/plugged')

"""""""""""""""""""""""""""""""
""""""""""""PLUGINS""""""""""""
"""""""""""""""""""""""""""""""

Plug 'itchyny/lightline.vim'

Plug 'Shougo/unite.vim'
Plug 'Shougo/neomru.vim'

Plug 'tomasr/molokai'

"""""""""""""""""""""""""""""""
""""""""""END PLUGINS""""""""""
"""""""""""""""""""""""""""""""

call plug#end()

colorscheme molokai
set mouse=a
set wildignorecase
set wildmenu

syntax enable
"hi CursorLine term=bold ctermbg=Grey
set colorcolumn=81
set cursorline

set nu

" Unite.vim
" Most recently used search
nnoremap <leader>m :<C-u>Unite -buffer-name=mru     -start-insert file_mru<cr>
nnoremap <leader>d :<C-u>Unite -buffer-name=dir_mru -start-insert directory_mru<cr>

nnoremap <leader>p :Unite -start-insert -auto-resize file file_rec/async file_mru<cr>

" Function that only triggers when unite opens
function! s:unite_settings()

  " exit with esc
  nmap <buffer> <ESC> <Plug>(unite_exit)
  imap <buffer> <ESC> <Plug>(unite_exit)

  " Ctrl jk mappings
  imap <buffer> <c-j> <Plug>(unite_insert_leave)
  imap <buffer> <c-k> <Plug>(unite_insert_leave)
  nmap <buffer> <c-j> <Plug>(unite_loop_cursor_down)
  nmap <buffer> <c-k> <Plug>(unite_loop_cursor_up)

  " cding
  inoremap <silent><buffer><expr> <c-a> unite#do_action('cd')

endfunction
autocmd FileType unite call s:unite_settings()
