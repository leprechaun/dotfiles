Plug 'vimwiki/vimwiki'
"Plug 'tools-life/taskwiki'

let g:vimwiki_list = [{'path': '~/.config/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

command! Diary VimwikiDiaryIndex
augroup vimwikigroup
    autocmd!
    " automatically update links on read diary
    autocmd BufRead,BufNewFile diary.md VimwikiDiaryGenerateLinks
augroup end


"nmap <leader>w<leader>d :Diary<cr>
