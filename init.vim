set runtimepath^=/etc/vim/vimrc runtimepath+=/etc/vim/after
let &packpath=&runtimepath
source /etc/vim/vimrc

" Directorio de plugins
call plug#begin('~/.local/share/nvim/plugged')

"Explorer
  "Explorador de Archivos
   Plug 'https://github.com/scrooloose/nerdtree'
   Plug 'Xuyuanp/nerdtree-git-plugin' 
  "Barra de Estado
   Plug 'vim-airline/vim-airline'
   Plug 'vim-airline/vim-airline-themes' 

"Code Edit
  "Guia de Identacion
   Plug 'Yggdroot/indentLine'
  "Define tab space
   Plug 'ervandew/supertab'
  "Display function signature from completions
   Plug 'Shougo/echodoc.vim'
  "Visual Navigation Bar
   Plug 'christoomey/vim-tmux-navigator'

  "Autocompletado
    "Neco Autocompletado
     Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } 
     Plug 'Shougo/neco-syntax' "Fuente gral del autocomplete
    "Sirver Autocompletado
     Plug 'sirver/ultisnips' "Provee codigo reutilizable
     Plug 'honza/vim-snippets'
    "Polygont Autocompletado
     Plug 'sheerun/vim-polyglot' "better
    "Flow Autocomplete
     Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
     Plug 'wokalski/autocomplete-flow'
     Plug 'Shougo/neosnippet'
     Plug 'Shougo/neosnippet-snippets'
    "AutoPairs
     Plug 'jiangmiao/auto-pairs'
    "CloseTag
     Plug 'alvan/vim-closetag'
   
  "Syntax Helpers
    "Emmet
     Plug 'mattn/emmet-vim'
    "Eslint Rules
     Plug 'dense-analysis/ale'
    "View color in css
     Plug 'ap/vim-css-color'
    "HTML
     Plug 'othree/html5.vim', { 'for': 'html' }
    "CSS
     Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
    "JS
     Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
     Plug 'ternjs/tern_for_vim', { 'do': 'npm install && npm install -g tern'} 

  "Finders 
    "Files and Words in the path 
     Plug 'junegunn/fzf.vim'
     Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    "Find only words in the file
     Plug 'easymotion/vim-easymotion'

"Visual Themes
  "Icons
   Plug 'ryanoasis/vim-devicons'
  
  "Themes
    "Iceberg
     Plug 'cocopon/iceberg.vim'
    "Gruvbox
     "Plug 'morhetz/gruvbox'
    "OneDark
     "Plug 'joshdick/onedark.vim' "Tema OneDark
    "TokyoNight
     "Plug 'ghifarit53/tokyonight-vim'
  
  "View git modificated
   Plug 'https://github.com/airblade/vim-gitgutter.git'

"?????
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'

call plug#end()

"Settings
  "Autocomplete
    "Flow
     let g:deoplete#enable_at_startup = 1
     let g:neosnippet#enable_completed_snippet = 1
     let g:NERDTreeGitStatusShowIgnored = 1 " a heavy feature may cost much more time. default: 0

    "Silver
     let g:UltiSnipsExpandTrigger = '<c-j>' "Expandir snippet con Ctrl + j 
     let g:UltiSnipsJumpForwardTrigger = '<c-j>' "Ir a siguiente ubicacion con Ctrl + j
     let g:UltiSnipsJumpBackwardTrigger = '<c-k>' "Ir a anterior ubicacion con Ctrl + k

  "SuperTab
   let g:SuperTabDefaultCompletionType = '<c-n>' "Invertir direccion de navegacion (de arriba a abajo)

  "Airline
   let g:airline#extensions#tabline#enabled = 1  " Mostrar buffers abiertos (como pestañas)
   let g:airline#extensions#tabline#fnamemod = ':t'  " Mostrar sólo el nombre del archivo
   let g:airline_powerline_fonts = 1 "Cargar fuente Powerline y símbolos (ver nota)

  "Themes
    "Iceberg
     syntax on
     colorscheme iceberg
    "Gruvbox
     "colorscheme gruvbox
     "let g:gruvbox_contrast_dark = "hard"
    "OneDark
     "set termguicolors
     "syntax on
     "colorscheme onedark
     "let g:onedark_hide_endofbuffer=1
    "TokyoNight
     "set termguicolors
     "let g:tokyonight_style = 'night' " available: night, storm
     "colorscheme tokyonight
     "let g:lightline = {'colorscheme' : 'tokyonight'}
     "let g:airline_theme = "tokyonight"

  "EasyMotion
   let mapleader=" "
   nmap <Leader>s <Plug>(easymotion-s2)

  "NerdTree
   nmap <Leader>nt :NERDTreeFind<CR>
   let NERDTreeQuitOnOpen=1

  "Deoplete
   let g:deoplete#enable_at_startup = 1
   "Cerrar automaticamente la ventana de vista previa (donde se muestra documentación, si existe)
   augroup deopleteCompleteDoneAu
     autocmd!
     autocmd CompleteDone * silent! pclose!
   augroup END

  "Personalization
   let g:echodoc_enable_at_startup = 1 "Activar echodoc al iniciar Neovim
  "Write
   nmap <Leader>w :w<CR>
  "Quit
   nmap <Leader>q :q<CR>
  "Identacion
   let g:indentLine_fileTypeExclude = ['text', 'sh', 'help', 'terminal']
   let g:indentLine_bufNameExclude = ['NERD_tree.*', 'term:.*']
   "Transparencia
  highlight Normal ctermbg=none guibg=none
  highlight NonText ctermbg=none guibg=none
