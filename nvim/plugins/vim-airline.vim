" aleを表示する
let g:airline#extensions#ale_enabled = 0

" tab機能 有効/無効
let g:airline#extensions#tabline#enabled = 1
" tabに番号を振る
let g:airline#extensions#tabline#buffer_idx_mode = 0

let g:airline#extensions#default#layout = [
            \ ['a', 'b', 'c', 'error', 'warming'],
            \ ['x', 'y','z']
            \ ]

let g:airline_powerline_fonts = 1

nnoremap  <TAB> :bn<CR>
nnoremap  <S-TAB> :bp<CR>
nnoremap <silent> <Leader>x :bd<CR>
