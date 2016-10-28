"PHP specific vim options

"---------- PHP.vim ---------

hi! def link phpDocTags  phpDefine
hi! def link phpDocParam phpType

"----------- Tabs -----------
set tabstop=4           " number of spaces that a <Tab> counts for
set shiftwidth=4        " number of spaces for each step of (auto)indent
set softtabstop=4       " number of spaces that a <Tab> counts for
set expandtab           " use spaces instead of tabs
set autoindent          " use the current line indentation for subsequent lines

"----------- File type mappings -----------
if has("gui_win32")
    "nnoremap <buffer> <leader><Space> :w!<CR>:! C:\php.exe??? %<CR>
else
    if @% =~# 'Test\.php'
        nnoremap <buffer> <leader><Space> :w!<cr>:! vendor/bin/phpunit %<cr>
    else
        nnoremap <buffer> <leader><Space> :w!<CR>:! php %<CR>
    endif
endif

nnoremap ; A;<Esc>

"---------- phpqa.vim ------------
" Set the messdetector rulesets
let g:phpqa_messdetector_ruleset="unusedcode,design,cleancode,controversial"

" Set the codesniffer args
let g:phpqa_codesniffer_args = "--standard=PSR2"

" Don't run messdetector on save (default = 1)
" let g:phpqa_messdetector_autorun = 0

" Don't run codesniffer on save (default = 1)
" let g:phpqa_codesniffer_autorun = 0

" Show code coverage on load (default = 0)
" let g:phpqa_codecoverage_autorun = 1

" Stop the location list opening automatically
" let g:phpqa_open_loc = 0

" if (in nas2)
if expand('%:p') =~# '\/code\/nas2\/'
    call Phpqa#QAToolsToggle()
endif
