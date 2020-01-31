set et
set ts=2
set sw=2
set ai
set ci
set si
set ml
set nu
set ic
set is
set fdm=marker
set hlsearch
set nofoldenable
set mouse=a
set hidden
set wildmenu
set nomodeline
set autoindent
set nostartofline
set confirm
set visualbell
set t_vb=
set notimeout ttimeout ttimeoutlen=200
set textwidth=72
set cul
set t_Co=256
set dir=~/tmp,/var/tmp,/tmp
set encoding=utf-8
set nocompatible
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.scssc,*.sassc
set fillchars+=vert:\
set cursorline
color desert
set shell=zsh\ --login
set list listchars=tab:\ \ ,trail:·

" Enable 24-bit color on terminal vim.
if (has("termguicolors"))
  set termguicolors
endif

map <F2> :NERDTreeToggle<CR>
map <F3> <plug>NERDCommenterToggle<CR>

" Hard mode, stop using arrow keys damn it!
"noremap <Up> <NOP>
"noremap <Down> <NOP>
"noremap <Left> <NOP>
"noremap <Right> <NOP>

" Use CMD+Arrow to move around splits
nmap <silent> <Up> :wincmd k<CR>
nmap <silent> <Down> :wincmd j<CR>
nmap <silent> <Left> :wincmd h<CR>
nmap <silent> <Right> :wincmd l<CR>

" SAY NO TO TRAILING WHITESPACE!
function! WhiteSpace()
  execute "%s/\\s\\+$//"
endfunction
map <Leader><Delete> :call WhiteSpace()<CR>

" Remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" quick edit vimrc
function! EditVimConfig()
  vsplit $HOME/.vimrc
endfunction
nnoremap <leader>ec :call EditVimConfig()<CR>

" fzf
nmap <leader>t :Files<CR>
"" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
" You can set up fzf window using a Vim command (Neovim or latest Vim 8 required)
let g:fzf_layout = { 'window': 'enew' }

" Escape special characters in a string for exact matching.
" This is useful to copying strings from the file to the search tool
" Based on this - http://peterodding.com/code/vim/profile/autoload/xolox/escape.vim
function! EscapeString (string)
  let string=a:string
  " Escape regex characters
  let string = escape(string, '^$.*\/~[]')
  " Escape the line endings
  let string = substitute(string, '\n', '\\n', 'g')
  return string
endfunction

" Get the current visual block for search and replaces
" This function passed the visual block through a string escape function
" Based on this - http://stackoverflow.com/questions/676600/vim-replace-selected-text/677918#677918
function! GetVisual() range
  " Save the current register and clipboard
  let reg_save = getreg('"')
  let regtype_save = getregtype('"')
  let cb_save = &clipboard
  set clipboard&

  " Put the current visual selection in the " register
  normal! ""gvy
  let selection = getreg('"')

  " Put the saved registers and clipboards back
  call setreg('"', reg_save, regtype_save)
  let &clipboard = cb_save

  "Escape any special characters in the selection
  let escaped_selection = EscapeString(selection)

  return escaped_selection
endfunction

" Start the find and replace command across the entire file
vmap <leader>r <Esc>:%s/<c-r>=GetVisual()<cr>/

" Window Swapping
function! MarkWindowSwap()
   let g:markedWinNum = winnr()
endfunction

function! DoWindowSwap()
    "Mark destination
    let cukNum = winnr()
    let curBuf = bufnr( "%" )
    exe g:markedWinNum . "wincmd w"
    "Switch to source and shuffle dest->source
    let markedBuf = bufnr( "%" )
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' curBuf
    "Switch to dest and shuffle source->dest
    exe curNum . "wincmd w"
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' markedBuf
endfunction

nmap <silent> <leader>mw :call MarkWindowSwap()<CR>
nmap <silent> <leader>pw :call DoWindowSwap()<CR>

nmap ; :

map <Leader>. :tabnext<CR>
map <Leader>, :tabprevious<CR>

syntax on
" Don't screw up folds when inserting text that might affect them, until
" leaving insert mode. Foldmethod is local to the window. Protect against
" screwing up folding when switching between windows.
autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

"highlight text that is @ >79 chars
match ErrorMsg '\%>80v.\+'
let w:m2=matchadd('ErrorMsg', '\%>79v.\+', -1)
au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>79v.\+', -1)

if has("statusline") && !&cp
  set laststatus=2  " always show the status bar

  "" Without setting this, ZoomWin restores windows in a way that causes
  "" equalalways behavior to be triggered the next time CommandT is used.
  "" This is likely a bludgeon to solve some other issue, but it works
  "set noequalalways

  "" Start the status line
  set statusline=%f\ %m\ %r

  "" Add fugitive if enabled
  set statusline+=%{fugitive#statusline()}

  "" Add syntastic if enabled
  "" let g:syntastic_enable_signs=1
  "" set statusline+=%#warningmsg#
  "" set statusline+=%{SyntasticStatuslineFlag()}
  "" set statusline+=%*

  "" Finish the statusline
  set statusline+=Line:%l/%L[%p%%]
  set statusline+=Col:%v
  set statusline+=Buf:#%n
  set statusline+=[%b][0x%B]
endif

" language stuff
au BufRead,BufNewFile *.rs set filetype=rust
au BufNewFile,BufRead *.go set filetype=go
au! BufNewFile,BufRead Gemfile,Guardfile set filetype=ruby

" back when I did cpp...
map <F7> :!ctags -R --c++ -kinds=+p --fields=+iaS --extra=+q --exclude="*.js" <CR><CR>

" back when I did ruby...
map <F5> :!ctags --fields=+l --extra=+f --exclude=.git --exclude=public --exclude=*.js --exclude=log -R * `rvm gemdir`/gems/*<CR><CR>
map <F6> :!ripper-tags --exclude=.git --exclude=public --exclude=log -R<CR><CR>

" Vim functions to run RSpec and Cucumber on the current file and optionally on
" the spec/scenario under the cursor.
function! RailsScriptIfExists(name)
  " Bundle exec
  if isdirectory(".bundle") || (exists("b:rails_root") && isdirectory(b:rails_root . "/.bundle"))
    return "bundle exec " . a:name
  " System Binary
  else
    return a:name
  end
endfunction

function! RunSpec(args)
  let spec = RailsScriptIfExists("rspec --drb")
  let cmd = spec . " " . a:args . " -fn -c " . @%
  execute ":! echo " . cmd . " && " . cmd
endfunction

function! RunTestFile(args)
  call RunSpec("" . a:args)
endfunction

function! RunTest(args)
  call RunSpec("-l " . line('.') . a:args)
endfunction
"map <Leader>; :call RunTest("")<CR>
"map <Leader>' :call RunTestFile("")<CR>

" selecta
" Run a given vim command on the results of fuzzy selecting from a given shell
" command. See usage below.
function! SelectaCommand(choice_command, selecta_args, vim_command)
  try
    silent let selection = system(a:choice_command . " | selecta " . a:selecta_args)
  catch /Vim:Interrupt/
    " Swallow the ^C so that the redraw below happens; otherwise there will be
    " leftovers from selecta on the screen
    redraw!
    return
  endtry
  redraw!
  exec a:vim_command . " " . selection
endfunction

" Find all files in all non-dot directories starting in the working directory.
" Fuzzy select one of those. Open the selected file with :e.
"nnoremap <leader>f :call SelectaCommand("find * -type f", "", ":e")<cr>

function! SelectaIdentifier()
  " Yank the word under the cursor into the z register
  normal "zyiw
  " Fuzzy match files in the current directory, starting with the word under
  " the cursor
  call SelectaCommand("find * -type f", "-s " . @z, ":e")
endfunction
" nnoremap <c-g> :call SelectaIdentifier()<cr>

" Deep git blame
" git blame with the following flags -w -M -CCC
"command Dblame Gblame -w -M -CCC

" Colors for vimdiff
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red

" vim-xcode
let g:xcode_runner_command = 'VtrSendCommandToRunner! {cmd}'

" NerdCommenter
nmap <C-_> <plug>NERDCommenterToggle

" coc
hi CocWarningSign ctermfg=0 guifg=#ff922b

" Plug
filetype off
call plug#begin()

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdcommenter'
"Plug 'scrooloose/syntastic'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'andys8/vim-elm-syntax'
call plug#end()
filetype plugin indent on
