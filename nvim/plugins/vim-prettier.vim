let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.json,*.tsx PrettierAsync
