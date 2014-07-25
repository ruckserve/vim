"HTML specific vim options

"----------- Tabs -----------
set tabstop=2           " number of spaces that a <Tab> counts for
set shiftwidth=2        " number of spaces for each step of (auto)indent
set softtabstop=2       " number of spaces that a <Tab> counts for
set expandtab           " use spaces instead of tabs
set autoindent          " use the current line indentation for subsequent lines

"----------- File type mappings -----------
autocmd BufNewFile 0r ~/.vim/templates/skeleton.html
autocmd BufNewFile *-spec.html 0r ~/.vim/templates/skeleton-spec.html
autocmd BufNewFile SpecRunner.html r ~/.vim/templates/skeleton-SpecRunner.html
