"Python specific vim options

"----------- Tabs -----------
set tabstop=4           " number of spaces that a <Tab> counts for
set shiftwidth=4        " number of spaces for each step of (auto)indent
set softtabstop=4       " number of spaces that a <Tab> counts for
set expandtab           " use spaces instead of tabs
set autoindent          " use the current line indentation for subsequent lines

"----------- File type mappings -----------
if has("gui_win32")
    nnoremap <buffer> <leader><Space> :w!<CR>:! C:\Python27\python.exe %<CR>
else
    nnoremap <buffer> <leader><Space> :w!<CR>:! python %<CR>
end
