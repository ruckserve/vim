"Ruby specific vim options

"----------- Tabs -----------
set tabstop=2           " number of spaces that a <Tab> counts for
set shiftwidth=2        " number of spaces for each step of (auto)indent
set softtabstop=2       " number of spaces that a <Tab> counts for
set expandtab           " use spaces instead of tabs
set autoindent          " use the current line indentation for subsequent lines

"----------- File type mappings -----------
nnoremap <buffer> <leader><Space> :w!<cr>:! ruby %<cr>
autocmd BufNewFile,BufRead *_spec.rb nnoremap <buffer> <leader><Space> :w!<cr>:! bundle exec rspec %<cr>
