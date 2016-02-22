" use visual bell instead of beeping
set vb

" Don't use a swap file
set uc=0

" set list
" set listchars=tab:\|¬∑

" syntax highlighting
set bg=light
syntax on

" autoindent
set autoindent|set smartindent

" make backspace work normal (indent, eol, start)
set backspace=2

" allow backspace and cursor keys to cross line boundaries
set whichwrap+=<,>,h,l

" 2 space tabs
set tabstop=2|set expandtab|set shiftwidth=2|set softtabstop=2

" show matching brackets
set showmatch

" show line numbers
set number

" check perl code with :make
autocmd FileType perl set makeprg=perl\ -c\ %\ $*
autocmd FileType perl set errorformat=%f:%l:%m
autocmd FileType perl set autowrite

" don't use Q for Ex mode
map Q :q

" Stop the moving of # to the first column!! We
" aren't using a preprocessor! Damn!!!
inoremap # X#

" paste mode - this will avoid unexpected effects when you
" cut or copy some text from one window and paste it in Vim.
set pastetoggle=<F11>

" my perl includes pod
let perl_include_pod = 1

" syntax color complex things like @{${"foo"}}
let perl_extended_vars = 1

" Enable plugins
" :filetype plugin on

