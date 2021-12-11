Plug 'vim-test/vim-test'

function! ExecuteInTmuxWindow(cmd)
    "silent execute '!tmux new-window "' . a:cmd . '; read"'
    "execute '!' . a:cmd
    silent execute '!tmux popup -h90\% -w90\% "' . a:cmd . '"'
endfunction


let g:test#custom_strategies = {'tmux': function('ExecuteInTmuxWindow')}
let g:test#strategy = 'tmux'

nmap <leader>tn :TestNearest<CR>
nmap <leader>tf :TestFile<CR>
nmap <leader>tl :TestLast<CR>
