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
"		 Run ctags to create the index of tokens and definitions as a `tags`
"		 file, usually at the top level of your project.  Also be sure to add
"		 `tags` to the .gitignore
"
"		 Run :PluginInstall to install the plugins from within vim
"
set tabstop=4
set nu
set laststatus=2


set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" 	Plugin 'tpope/vim-fugitive'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" 	Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" 	Plugin 'rstacruz/sparkup', {'rtp': 'vim/'} Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" plugin nerdtree
Plugin 'scrooloose/nerdtree'

" plugin vim-scala 
Plugin 'derekwyatt/vim-scala'

" Code completion with deoplete
Plugin 'shougo/deoplete.nvim'
" Activate deoplete by default
let g:deoplete#enable_at_startup = 1

" Papercolor Scheme
Plugin 'NLKNguyen/papercolor-theme'
" let g:PaperColor_Light_Override = { 'background' : '#abcdef', 'cursorline' : '#dfdfff', 'matchparen' : '#d6d6d6' , 'comment' : '#8e908c' }

" Tabline Plugin
Plugin 'itchyny/lightline.vim'

" Snippet Code Completion
" Track the snippet engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" NOTE: If you are receiving python error, you probably need to 
" `pip install neovim`

" Fuzzy File Finder with CtrlP
Plugin 'ctrlpvim/ctrlp.vim'

" Git Gutter to display Git change tracking
Plugin 'airblade/vim-gitgutter'
" only track up to 'x' signs, in order to keep vim performant
let g:gitgutter_max_signs = 300

" Mark finder with "Peekaboo" finder
Plugin 'Yilin-Yang/vim-markbar'

" I also like showing my marks in the gutter...
Plugin 'kshenoy/vim-signature'

" Show tags in sidebar
Plugin 'majutsushi/tagbar'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line



" Set NERDTree mapping
nmap <F12> :NERDTreeToggle<CR>

" Set Tagbar mapping
nmap <F8> :TagbarToggle<CR>

" Set to open ctrlp with ctags
nnoremap <leader>. :CtrlPTag<cr>

" for scala
autocmd Filetype scala setlocal ts=2 sw=2 expandtab

" Papercolor Scheme
" background may be set to light or dark
set t_Co=256   " This is may or may not needed.

set background=light
colorscheme PaperColor

" Sets vim's updatetimer to 100ms, default is 4000 (4 seconds), so commands
" like gitgutter appear to not be updating
set updatetime=300
