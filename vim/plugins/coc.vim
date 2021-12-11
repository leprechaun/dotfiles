Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf'

let g:coc_global_extensions = [
    \ 'coc-tsserver',
    \ 'coc-rust-analyzer',
    \ 'coc-python',
    \ 'coc-metals',
    \ 'coc-json',
    \ 'coc-yaml',
    \ 'coc-go',
    \ 'coc-diagnostic',
    \ 'coc-sh',
\ ]

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

nmap <leader>l :CocFzfList<cr>
"nmap <leader>r <Plug>(coc-references)
"nmap <silent> gd <Plug>(coc-definition)

nnoremap <silent> K :call <SID>show_documentation()<CR>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


