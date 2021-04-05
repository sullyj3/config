if has('unix')
	let VIMHOME='~/.config/nvim'
	let VIMPLUG='~/.local/share/nvim/site/autoload/plug.vim'
else
	let VIMHOME='~\AppData\Local\nvim'
	let VIMPLUG=VIMHOME . '\autoload\plug.vim'
endif

"let VIMPLUGEXISTS=!empty(glob(expand(VIMHOME . '/autoload/plug.vim')))
"let VIMPLUGEXISTS=!empty(glob(expand('~/.local/share/nvim/site/autoload/plug.vim')))

if executable('git')

	let VIMPLUGEXISTS=!empty(glob(expand(VIMPLUG)))
	if !VIMPLUGEXISTS
		execute '!curl -fLo ' . expand(VIMPLUG) .
			\ ' --create-dirs ' .
			\ 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	endif

	let PLUGINDIR=expand(VIMHOME . '/plugged')
	call plug#begin(PLUGINDIR)

	"Start Screen with MRU
	"Plug 'mhinz/vim-startify'

	Plug 'leafgarland/typescript-vim'

	"Colors
	Plug 'dracula/vim', {'as': 'dracula'}
  Plug 'drewtempelmeyer/palenight.vim'
	Plug 'rainglow/vim', {'as': 'rainglow'}
	Plug 'ntk148v/vim-horizon'

	Plug 'tpope/vim-fireplace'

	if executable('cargo')
		"Plug 'eraserhd/parinfer-rust', {'do': 'cargo build --release'}
	end


	"Editing
	Plug 'junegunn/vim-easy-align'
	"Text Object
	Plug 'vim-utils/vim-line'
	Plug 'tpope/vim-surround'

	" movement
	Plug 'justinmk/vim-sneak'
	Plug 'wellle/targets.vim'

	"Git
	Plug 'tpope/vim-fugitive'

	"Fuzzy finding
	Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
	Plug 'junegunn/goyo.vim'
	Plug 'junegunn/limelight.vim'

	"Search
	Plug 'dahu/SearchParty'
		
	"Plug 'neovim/nvim-lspconfig'
	" Plug 'autozimu/LanguageClient-neovim', {
	"     \ 'branch': 'next',
	"     \ 'do': 'bash install.sh',
	"     \ }
	Plug 'JuliaEditorSupport/julia-vim'
	Plug 'evanleck/vim-svelte'
	Plug 'edwinb/idris2-vim'

	Plug 'shougo/echodoc.vim'
	"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

	"Plug 'eagletmt/neco-ghc'

	Plug 'reedes/vim-pencil'
	Plug 'jiangmiao/auto-pairs'

	"Plug 'scrooloose/nerdcommenter'
	Plug 'tpope/vim-commentary'
  "Plug 'dense-analysis/ale'

	call plug#end()

	"lua require'nvim_lsp'.hls.setup{}


	let g:deoplete#enable_at_startup = 1

	"plugin settings and mappings
	let mapleader = " "
	let maplocalleader = " "
	"FZF
	nnoremap <leader>f :FZF<CR>
	nnoremap <leader>r :Rg<CR>
	nnoremap <leader>m :History<CR>

	"vim sneak
	map f <Plug>Sneak_f
	map F <Plug>Sneak_F
	map t <Plug>Sneak_t
	map T <Plug>Sneak_T

  nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
  nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
  nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
  "nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
  nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
  nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
  nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
  "nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
  "nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>

	if has('unix')
		colorscheme palenight
	else
		colorscheme rainbow-contrast
	endif

else
	"colorscheme desert
endif

if has('nvim')

	" show results of search and substitute in place
	set inccommand=nosplit

endif

if exists('&breakindent')

	" wrapped lines start at same indentation
	set breakindent

endif

" forward slashes in ctrl-x ctrl-f filename completion
set shellslash

" used by language-client
set hidden

set number
set hlsearch
set cursorline
set mouse=a

set ignorecase
set smartcase

set ts=2
set sw=2
set list

set noautochdir

" Color only current paragraph
"autocmd VimEnter * Limelight

autocmd FileType perl set filetype=prolog

let mapleader = " "

if has('win32')
  cd $USERPROFILE
endif

autocmd Filetype haskell setlocal omnifunc=v:lua.vim.lsp.omnifunc

" non plugin mappings:
" yank to end of line instead of whole line
map Y y$"

com! Write Pencil<Bar>Goyo<Bar>Limelight

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"set whichwrap = b,s,<,>
