if &compatible
  set nocompatible
endif

runtime! options.vim
runtime! keymap.vim

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
let g:python_host_prog='/Users/ren.goto/.asdf/shims/python'
let g:python3_host_prog='/Users/ren.goto/.asdf/shims/python3'
let g:lsp_settings_servers_dir=$HOME.'/.local/share/vim-lsp-settings/servers'

" dein
let g:dein#auto_recache=1

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

let s:watch_files = ['~/.config/nvim/init.vim', '~/.config/nvim/dein.toml', '~/.config/nvim/dein_lazy.toml']

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein', s:watch_files)

  call dein#load_toml('~/.config/nvim/dein.toml', {'lazy': 0})
  call dein#load_toml('~/.config/nvim/dein_lazy.toml', {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

syntax enable
