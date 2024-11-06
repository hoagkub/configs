" To install vim-plug: curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


call plug#begin('~/.vim/plugged')

" File Explorer
Plug 'preservim/nerdtree'

" Fuzzy Finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Autocompletion
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

" Snippets Support
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

" Syntax Highlighting
Plug 'sheerun/vim-polyglot'

" Git Integration
Plug 'tpope/vim-fugitive'

" Commenting
Plug 'tpope/vim-commentary'

" Theme onedark
" Plug 'joshdick/onedark.vim'
Plug 'wojciechkepka/vim-github-dark'

call plug#end()

autocmd User lsp_setup call lsp#register_server({
    \ 'name': 'pylsp',
    \ 'cmd': {server_info -> ['pylsp']},
    \ 'allowlist': ['python'],
    \ })


" Enable theme onedark
syntax enable
" colorscheme onedark
colorscheme ghdark

" NERDTree settings
nnoremap <C-n> :NERDTreeToggle<CR>

" Coc.nvim settings for autocompletion
" let g:coc_global_extensions = ['coc-json', 'coc-tsserver', 'coc-eslint']

" FZF settings
nnoremap <C-p> :Files<CR>

