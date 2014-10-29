" {{{ PATHOGEN
    " Load plugins and their documentation
    execute pathogen#infect()
    execute pathogen#helptags()
" }}}

" {{{ GENERAL
    set autoread                " Automatically reload files that have been changed externally
    filetype plugin indent on   " Change indentation based on filetype
    set nocompatible            " Eschew Vi backwards-compatibility
    set wildmenu                " Enhance command-line completion
    set wildmode=list:longest   " List wildmenu matches until the longest common string
    set shortmess+=Ic            " Don't display splash screen (+c, for YCM, requires patch 314)
    set hidden                  " Enable hidden buffers
    set esckeys                 " Allow navigation in insert mode via arrow keys
    set backspace=2             " Make backspace act like it would in any other program
    "set mouse=a                 " Enable the mouse -- warning, makes copying from terminal difficult
    "set clipboard=unnamed       " Use the OS clipboard
    set encoding=utf-8

    " Set more sensible undo, swap, and backup directories to as to keep the working directory clean
    set undodir=~/.vim/.undo//,/var/tmp//,/tmp//
    set directory=~/.vim/.swp//,/var/tmp//,/tmp//
    set backupdir=~/.vim/.backup//,/var/tmp//,/tmp//
" }}}

" {{{ COLORS AND FONT
    syntax enable               " Use syntax highlighting
    set t_Co=256                " Use 256 colors

    colorscheme solarized
    set background=light

    if has("gui_running")
        set guifont=DejaVu_Sans_Mono_for_Powerline:h12
        "set columns=100 lines=30 " One quadrant in 1440x900 with this font
        set columns=117 lines=35 " One quadrant in 1680x1050 with this font
        set guioptions-=r
    endif
" }}}

" {{{ DISPLAY
    set number              " Line numbers
    set ruler               " Show the cursor's position in the statusline
    set showcmd             " Show the command being typed
    set autoindent          " Autoindent spaces
    set cursorline          " Highlight the current line
    set nocursorcolumn      " Don't highlight the current column
    set wrap                " Wrap text to the next line rather than trailing off the screen
    set laststatus=2        " Always display statusline
    set linebreak           " Break lines by word rather than by character
    set scrolloff=3         " Keep 3 lines above/below the cursor while scrolling
    set ttyfast             " Improve rendering in the terminal
    set noerrorbells        " Disable beep on error
    set colorcolumn=81      " Highlight column 81 on each line
    set formatoptions+=qrn1 " Allow formatting of comments with 'gq', automatically insert comment leaders, wrap numbered lists, and break before one-letter words
    set nostartofline       " Don't return the cursor to the start of the line when moving it around
" }}}

" {{{ FORMATTING
    set expandtab           " Use spaces instead of tabs
    set ts=4 sts=4 sw=4     " Use 4-column-wide tab (tabstop, softtabstop, and shiftwidth)
    set tw=0 wm=0           " Don't insert line breaks automatically (textwidth and wrapmargin)
    "set list lcs=trail:·,tab:»·,eol:↵ " Show special characters
    "set foldmethod=syntax   " Fold on syntax
" }}}

" {{{ SEARCH / REGEX
    set ignorecase smartcase " Search case-insensitively unless searches contain capital letters
    set gdefault             " Default to global replace. (Append g for single-line behavior.)
    set incsearch            " Show matches as you type
    set hlsearch             " Highlight all matches
" }}}
"
" {{{ KEY MAPPINGS
    let mapleader = ","
    let maplocalleader = ","

    " Switch between light/dark background in Solarized
    call togglebg#map("<leader>bg")

    " General-purpose
    nnoremap <leader>ev :split $MYVIMRC<cr>
    nnoremap <leader>sv :source $MYVIMRC<cr>
    nnoremap <leader>/ :nohl<cr>
    noremap <Tab> :bn<CR>
    noremap <S-Tab> :bp<CR>
    map <esc><esc> :w<cr>
    inoremap jj <ESC>

    " Move to next column rather than next line when wrapped
    noremap j gj
    noremap k gk
    noremap <Down> gj
    noremap <Up> gk

    " Window navigation
    nnoremap <C-h> <C-w>h
    nnoremap <C-j> <C-w>j
    nnoremap <C-k> <C-w>k
    nnoremap <C-l> <C-w>l

    " Save a file as root, even if Vim wasn't started as root
    noremap <leader>w :w !sudo tee % > /dev/null<CR>

    " Strip trailing whitespace
    " From https://github.com/mathiasbynens/dotfiles/blob/master/.vimrc
    function! StripWhitespace()
        let save_cursor = getpos(".")
        let old_query = getreg('/')
        :%s/\s\+$//e
        call setpos('.', save_cursor)
        call setreg('/', old_query)
    endfunction
    noremap <leader>sw :call StripWhitespace()<CR>

    " Plugin-related
    nnoremap <leader>u :GundoToggle<cr>
    nnoremap <leader>f :NERDTreeToggle<cr>
    nnoremap <leader>t :TagbarToggle<cr>
    nnoremap <leader>h :A<cr>
    nnoremap <leader>p :CtrlP<cr>

    " TODO: Use YcmDiags when editing YCM-eligible files, else use Errors
    nnoremap <leader>e :YcmDiags<cr>
    "nnoremap <leader>e :Errors<cr>
" }}}

" {{{ AIRLINE
    let g:airline_powerline_fonts=1
    let g:airline_enable_syntastic=1
" }}}
"
" {{{ CLANG-FORMAT
    let g:clang_format#code_style = "llvm"
    let g:clang_format#style_options = {
                \ "AccessModifierOffset" : -4,
                \ "Standard" : "C++11",
                \ "PointerBindsToType" : "true",
                \ "BreakBeforeBraces" : "Stroustrup",
                \ "ColumnLimit" : 80 }
    autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
    autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>

    " Format C-like files automatically just before saving
    "autocmd FileType c,cpp,objc autocmd BufWritePre <buffer> :ClangFormat
" }}}

" {{{ VIM-LATEX (lervag's version)
    " Also use 'defaults write TeXShop BringPdfFrontOnAutomaticUpdate NO'
    let g:latex_viewer = "open -a /Applications/TeXShop.app"
    let g:latex_latexmk_continuous = 1
    "let g:latex_quickfix_ignore_all_warnings = 1
" }}}

" {{{ SYNTASTIC
    " These should be unnecessary since YCM handles C-like languages
    "let g:syntastic_cpp_compiler = 'clang++'
    "let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'

    " Make Syntastic's error markers blend in more nicely
    hi! link SyntasticErrorLine SignColumn
    hi! link SignColumn LineNr
    " Note: These colors are adjusted specifically to fit Solarized Light
    hi SyntasticErrorSign guifg=#dc322f guibg=#eee8d5

    " Python 3 syntax checking
    let g:syntastic_python_python_exec = 'python3'

    " Don't highlight warnings in the editor window
    let g:syntastic_quiet_messages = { "level": "warnings" }
" }}}

" {{{ TAGBAR
    let g:tagbar_width=30
" }}}

" {{{ YOUCOMPLETEME
    let g:ycm_global_ycm_extra_conf = "/Users/spencer/.ycm_extra_conf.py"
    let g:ycm_confirm_extra_conf = 0 " Use alternate confs without confirmation

    let g:ycm_autoclose_preview_window_after_completion = 1
    " Alternately, disable this completely
    "set completeopt-=preview
" }}}
