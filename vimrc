set nocompatible
filetype plugin indent on
syntax on

call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'lervag/vimtex'
    let g:vimtex_view_method = 'zathura'
    let g:vimtex_view_general_viewer = 'okular'
    let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
    let g:vimtex_compiler_latexmk = {
        \ 'build_dir' : '',
        \ 'callback' : 1,
        \ 'continuous' : 1,
        \ 'executable' : 'latexmk',
        \ 'hooks' : [],
        \ 'options' : [
        \   '-shell-escape',
        \   '-verbose',
        \   '-file-line-error',
        \   '-synctex=1',
        \   '-interaction=nonstopmode',
        \ ],
        \}
    let g:vimtex_compiler_method = 'latexmk'
    let maplocalleader = ","
    let g:tex_conceal = ''

Plug 'ycm-core/YouCompleteMe'
    let g:ycm_key_list_select_completion = ['<c-j>']
    let g:ycm_key_list_previous_completion = ['<c-k>']

Plug 'sirver/ultisnips'
    let g:UltiSnipsExpandTrigger = '<tab>'
    let g:UltiSnipsJumpForwardTrigger = '<tab>'
    let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
call plug#end()

let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+,\(^\|\s\s\)ntuser\.\S\+'

set background=dark

set ignorecase
set number
set hlsearch
set incsearch
set scrolloff=5

" set list
" set listchars=space:·
" set listchars+=tab:\·\·,nbsp:·

set noexpandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab

set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

set wildmenu
set wildmode=longest:full,full
set wildoptions=pum
set wcm=<Tab>
set wildignorecase

noremap <F9> <ESC> :w <CR> :!g++ -fsanitize=address -std=c++17 -Wall -Wextra -Wshadow -DONPC -O3 -o %< % && ./%< <CR>
map <silent> <C-h> :call WinMove('h')<CR>
map <silent> <C-j> :call WinMove('j')<CR>
map <silent> <C-k> :call WinMove('k')<CR>
map <silent> <C-l> :call WinMove('l')<CR>

nmap <leader>dd <plug>(YCMHover)

function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
        if (t:curwin == winnr())
            if(match(a:key,'[jk]'))
                wincmd v
            else
                wincmd s
            endif
            exec "wincmd ".a:key
        endif
endfunction

function! CreateFileWithCommand()
    let filename = system('/bin/ls /home/timur/06notes | sort -n | tail -1 | sed -e "s/\.txt$//"')
    let filename = substitute(filename, '\n', '', '')
	let new_filename = str2nr(filename) + 1
    execute 'edit ' . new_filename . '.txt'
endfunction

nnoremap <leader>w :call CreateFileWithCommand()<CR>
