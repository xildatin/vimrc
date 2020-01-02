" USAGE: make sure you have neovim installed
"
"        make sure you have the neovim python plugin installed via `pip
"        install neovim`
"
"		 make sure to have universal ctags installed
"		 	OSX: brew install --HEAD universal-ctags/universal-ctags/universal-ctags
"
"		 Universal tags will conflict with previously installed versions of
"		 ctags.  As a result, you may wish to add a CTAGS_HOME environment
"		 variable and then add the bin/ directory to universal tags	to your PATH
"
"		 Universal ctags does not read from the ~/.ctags file, instead it will
"		 read from ~/.ctags.d/<lang>.ctags files.  For example, scala is not
"		 a supported language, therefore a language definitioon file must exist
"		 as ~/.ctags.d/scala.ctags, where the language definition exists.
"
"		 Run ctags to create the index of tokens and definitions as a `tags`
"		 file, usually at the top level of your project.  Also be sure to add
"		 `tags` to the .gitignore
"
"		 Run :PlugInstall to install the plugins from within vim
"
set tabstop=4
set nu
set laststatus=2


set nocompatible              " be iMproved, required
filetype off                  " required

" start Plug plugins
call plug#begin('~/.vim/plugged')

" Language Server
Plug 'derekwyatt/vim-scala'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ckipp01/coc-metals', {'do': 'yarn install --frozen-lockfile'}

" plugin nerdtree
Plug 'scrooloose/nerdtree'

" plugin vim-scala 
Plug 'derekwyatt/vim-scala'

" Code completion with deoplete
Plug 'shougo/deoplete.nvim'
" Activate deoplete by default
let g:deoplete#enable_at_startup = 1

"""  Color Schemes
" Papercolor Scheme
Plug 'NLKNguyen/papercolor-theme'
" let g:PaperColor_Light_Override = { 'background' : '#abcdef', 'cursorline' : '#dfdfff', 'matchparen' : '#d6d6d6' , 'comment' : '#8e908c' }

" Challenger Deep Scheme
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }

" Jellybeans
Plug 'nanotech/jellybeans.vim'

" Mirodark
Plug 'djjcast/mirodark'

""" End Color Schemes

" Tabline Plug
Plug 'itchyny/lightline.vim'

" Snippet Code Completion
" Track the snippet engine.
Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" NOTE: If you are receiving python error, you probably need to 
" `pip install neovim`

" Fuzzy File Finder with CtrlP
Plug 'ctrlpvim/ctrlp.vim'

" Git Gutter to display Git change tracking
Plug 'airblade/vim-gitgutter'
" only track up to 'x' signs, in order to keep vim performant
let g:gitgutter_max_signs = 300

" Mark finder with "Peekaboo" finder
Plug 'Yilin-Yang/vim-markbar'

" I also like showing my marks in the gutter...
Plug 'kshenoy/vim-signature'

" Show tags in sidebar
Plug 'majutsushi/tagbar'

" Make parenthesis colorful
Plug 'luochen1990/rainbow'
let g:rainbow_active = 0 "set to 0 if you want to enable it later via  :RanbowToggle

" All of your Plugs must be added before the following line
call plug#end()            	 " required

" To ignore plugin indent changes, instead use:
"filetype plugin on
filetype plugin indent on    " required

""""
" Put your non-Plug stuff after this line
""""

" Set NERDTree mapping
nmap <F12> :NERDTreeToggle<CR>

" Set Tagbar mapping
nmap <F8> :TagbarToggle<CR>

" Set to open ctrlp with ctags
nnoremap <leader>. :CtrlPTag<cr>

" for scala
autocmd Filetype scala setlocal ts=2 sw=2 expandtab
" Configuration for vim-scala
au BufRead,BufNewFile *.sbt set filetype=scala

" Papercolor Scheme
" background may be set to light or dark
set t_Co=256   " This is may or may not needed.

set background=dark
colorscheme jellybeans

" Sets vim's updatetimer to 100ms, default is 4000 (4 seconds), so commands
" like gitgutter appear to not be updating
set updatetime=100

" Sets up defaults for tags/ctags
set tags=tags;/  

" Sets closing brace and parenthesis when an opening equivalent is used
" And <CR> is tyhped immediately afterwards
inoremap {<CR> {<CR>}<Esc>ko<tab>
inoremap (<CR> (<CR>)<Esc>ko<tab>
inoremap [<CR> [<CR>]<Esc>ko<tab>
