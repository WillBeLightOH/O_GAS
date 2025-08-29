cat .vimrc.vimrc
"skim's custom .vimrc
"Run vim with alias v="vim -u pathTo/.vimrc

"call plug#begin('~/.vim/plugged')
"Plug 'tpope/vim-sensible' "universal set of defaults
"Plug 'tpope/vim-unimpaired' " 20 mappings and mnemonics
"call plug#end()
" Toggle Syntax
function ToggleSyntax()
  if exists("g:syntax_on")
    syntax off
  else
    syntax enable
  endif
endfunction
set nocompatible
syntax enable
set ruler
set incsearch
set hlsearch
"set cursorline
"set cursorcolumn
set number
set relativenumber
"set mouse=n
set t_Co=256
"set listchars=tab:>-,space:-
set ts=2 sw=2 sts=2 et
"set splitright
"set encoding=euc-jp
"set fileencoding=euc-jp
"let g:netrw_browse_split=4  " Open files in a new tab by default
"let g:netrw_altv = 1        " Open vertical splits to the right
let g:netrw_liststyle=3     " Tree-style file listing
let g:netrw_banner=0
let g:netrw_winsize=25
let mapleader="\<space>"
nnoremap <leader>n :set number!<CR>
nno <leader>rn :set relativenumber!<CR>
nno <leader>/ :call ToggleSyntax()<CR>
nno <leader>e :Lexplore<CR>
nno <leader>0 :browse oldfiles<CR>
nno <C-n> :Lexplore<CR>
nno <leader>t :vert term<CR>
nno <leader>h :bot term<CR>
nno <tab> :tabn<CR>
nno <S-Tab> :tabp<CR>
nno <leader>b :ls<CR>
nno <C-[> :bp<CR>
nno <C-]> :bn<CR>
nno <ESC><ESC> :nohlsearch<Cr>
nno <C-h> <C-W>h
nno <C-j> <C-W>j
nno <C-k> <C-W>k
nno <C-l> <C-W>l
nno <leader>gdb :set filetype=gdb<CR>
nno <leader>c   :set filetype=c<CR>
nno <leader>md  :set filetype=markdown<CR>
nno <leader>fn :echo expand("%:p")<CR>
nno <leader>2 :set ts=2 sw=2 sts=2 et<CR>
nno <leader>4 :set ts=4 sw=4 sts=4 et<CR>
inoremap " ""<LEFT>
ino ' ''<LEFT>
ino ` ``<LEFT>
ino { {}<LEFT>
ino [ []<LEFT>
ino ( ()<LEFT>
ino < <><LEFT>
ino /* /*  */<LEFT><LEFT><LEFT>
"macros
let @v='I//v'
function! SetTabWidth(n)
  if a:n > 0
    let &tabstop = a:n
    let &shiftwidth = a:n
    let &softtabstop = a:n
  else
    echoerr "Invalid tab width. Please provide a positive number."
  endif
endfunction
"sessions
let s:session_path = expand('~/work/skim')
" save session
command! -nargs=1 SaveSession call s:saveSession(<f-args>)
function! s:saveSession(file)
  execute 'silent mksession!' s:session_path . '/' . a:file
endfunction
" load session
command! -nargs=1 LoadSession call s:loadSession(<f-args>)
function! s:loadSession(file)
  execute 'silent source' a:file
endfunction
" delete session
command! -nargs=1 DeleteSession call s:deleteSession(<f-args>)
function! s:deleteSession(file)
  call delete(expand(a:file))
endfunction
nno <Leader>ss :SaveSession session.vim<CR>
nno <Leader>sl :LoadSession session.vim<CR>
nno <Leader>sd :DeleteSession 
"Termdebug
"packadd termdebug
let g:termdebug_wide=1 "vertical split
autocmd BufRead,BufNewFile *.c.* set filetype=c
autocmd FileType c,cpp,python setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
if &diff
  set relativenumber!
  set mouse=a   
endif
[25-08-29 17:37:42] gas@hsscoa[(TDSL) RHEL9.4 ][57899] ~/work/skim/
$ 
