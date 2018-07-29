execute pathogen#infect()
syntax on
filetype plugin indent on

set number
set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab
set backspace=indent,eol,start
set showcmd
set showmatch

set colorcolumn=90
let &colorcolumn=join(range(91,999),",")
highlight ColorColumn ctermbg=235 guibg=#2c2d27
let &colorcolumn="90,".join(range(120,999),",")

set background=dark
colorscheme solarized
let g:solarized_termcolors=256
let g:airline_theme = 'solarized'
let g:airline_solarized_bg='dark'

"colorscheme codedark
"let g:airline_theme = 'codedark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

set encoding=utf-8
set fileencoding=utf-8

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:tex_flavor = "latex"

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/youcompleteme/third_party/ycmd/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 1

nmap <leader>tg :TagbarToggle<CR>
