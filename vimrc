" Maintainer:	Vincent Zhao
" Last change:	5/29/2018

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
if has('syntax') && has('eval')
  packadd matchit
endif

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" Powerline setup
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
set laststatus=2
set noshowmode
set t_Co=256

" Enable Pathogen
execute pathogen#infect()

" Set Ctrl-N to toggle NERD Tree
map <C-n> :NERDTreeToggle<CR>

" Enable filetype plugins
filetype plugin indent on

" Move backup, undo, and swap files
set undodir=~/.vim/.undo//
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//

" Personal settings
set number
set ic
set smartcase
highlight LineNr ctermfg=lightblue ctermbg=black " Sets line number styling
set tabstop=4 shiftwidth=4 backspace=2 " Adjusts tab size and backspace behavior
set background=dark " Changes text color to stand out against dark backgrounds
syntax on
