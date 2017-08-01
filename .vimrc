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
set nocursorline
color desert

set shell=zsh\ --login

map <F2> :NERDTreeToggle<CR>
map <F3> <plug>NERDCommenterToggle<CR>
map <F5> :!ctags --fields=+l --extra=+f --exclude=.git --exclude=public --exclude=*.js --exclude=log -R * `rvm gemdir`/gems/*<CR><CR>
map <F6> :!ripper-tags --exclude=.git --exclude=public --exclude=log -R<CR><CR>
map <F7> :!ctags -R --c++ -kinds=+p --fields=+iaS --extra=+q --exclude="*.js" <CR><CR>
map <F9> :YcmCompleter FixIt<CR> :ccl<CR>
noremap <leader>jd :YcmCompleter GoTo<CR>

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

"ruby
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 0
autocmd FileType ruby,eruby let g:rubycomplete_rails = 0
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 0

let g:ycm_filetype_specific_completion_to_disable = {'ruby': 1}
let g:ycm_rust_src_path = substitute(system('rustc --print sysroot'), '\n\+$', '', '') . '/lib/rustlib/src/rust/src'

" SAY NO TO TRAILING WHITESPACE!
function! WhiteSpace()
  execute "%s/\\s\\+$//"
endfunction

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
    let curNum = winnr()
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

au! BufNewFile,BufRead Gemfile,Guardfile set filetype=ruby
au BufNewFile,BufRead *.go set filetype=go
autocmd BufWritePre * :%s/\s\+$//e
let ruby_fold = 1

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
  let g:syntastic_enable_signs=1
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*

  "" Finish the statusline
  set statusline+=Line:%l/%L[%p%%]
  set statusline+=Col:%v
  set statusline+=Buf:#%n
  set statusline+=[%b][0x%B]
endif

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

map <Leader><Delete> :call WhiteSpace()<CR>
map <Leader>; :call RunTest("")<CR>
map <Leader>' :call RunTestFile("")<CR>
set list listchars=tab:\ \ ,trail:·

" YCM Config
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
" don't prompt to load
let g:ycm_confirm_extra_conf = 0
" global fallback when it can't find project specific ycm conf
let g:ycm_global_ycm_extra_conf = '~./ycm_extra_conf.py'

"map <leader>t :CtrlP<CR>
"let g:ctrlp_cmd = 'CtrlP'
"let g:ctrlp_working_path_mode = ''

map <leader>t :Files<CR>
" matcher better fuzzy-find
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

if executable('matcher')
    let g:ctrlp_match_func = { 'match': 'GoodMatch' }

    function! GoodMatch(items, str, limit, mmode, ispath, crfile, regex)

      " Create a cache file if not yet exists
      let cachefile = ctrlp#utils#cachedir().'/matcher.cache'
      if !( filereadable(cachefile) && a:items == readfile(cachefile) )
        call writefile(a:items, cachefile)
      endif
      if !filereadable(cachefile)
        return []
      endif

      " a:mmode is currently ignored. In the future, we should probably do
      " something about that. the matcher behaves like "full-line".
      let cmd = 'matcher --limit '.a:limit.' --manifest '.cachefile.' '
      if !( exists('g:ctrlp_dotfiles') && g:ctrlp_dotfiles )
        let cmd = cmd.'--no-dotfiles '
      endif
      let cmd = cmd.a:str

      return split(system(cmd), "\n")

    endfunction
end

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
nnoremap <leader>f :call SelectaCommand("find * -type f", "", ":e")<cr>

function! SelectaIdentifier()
  " Yank the word under the cursor into the z register
  normal "zyiw
  " Fuzzy match files in the current directory, starting with the word under
  " the cursor
  call SelectaCommand("find * -type f", "-s " . @z, ":e")
endfunction
nnoremap <c-g> :call SelectaIdentifier()<cr>

" Deep git blame
" git blame with the following flags -w -M -CCC
command Dblame Gblame -w -M -CCC

highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red

" vim-xcode
let g:xcode_runner_command = 'VtrSendCommandToRunner! {cmd}'

" vundle
filetype off
"set rtp+=~/.vim/bundle/Vundle.vim
call plug#begin()
"Plugin 'gmarik/Vundle.vim'

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
"Plug 'tpope/vim-rails.git'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-endwise'
Plug 'godlygeek/tabular'
Plug 'tmhedberg/matchit'
Plug 'rking/ag.vim'
"Plug 'kien/ctrlp.vim.git'
"Plug 'kchmck/vim-coffee-script.git'
"Plug 'vesan/scss-syntax.vim.git'
"Plugin 'python.vim'
Plug 'scrooloose/nerdcommenter'
"Plug 'vim-scripts/FuzzyFinder'
Plug 'tpope/vim-markdown', { 'for': 'markdown' }
Plug 'timcharper/textile.vim'
Plug 'nelstrom/vim-markdown-preview', { 'for': 'markdown' }
Plug 'dkprice/vim-easygrep'
Plug 'scrooloose/syntastic'
"Plug 'Lokaltog/vim-powerline.git'
Plug 'tpope/vim-surround'
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'nono/vim-handlebars'
Plug 'skalnik/vim-vroom'
"Plugin 'tpope/vim-Pluginr'
Plug 'elixir-lang/vim-elixir'
Plug 'kelan/gyp.vim'
Plug 'derekwyatt/vim-fswitch'
"Plug 'file:///Users/weehuy/.vim/bundle/elm.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'rdnetto/YCM-Generator'
Plug 'majutsushi/tagbar'
"Plug 'git@github.com:gfontenot/vim-xcode.git'
"Plug 'git@github.com:christoomey/vim-tmux-runner.git'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'rust-lang/rust.vim', {'for': 'rust'}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
call plug#end()

filetype plugin indent on
hi CursorLine   cterm=NONE ctermbg=235 guibg=darkred
au BufRead,BufNewFile *.rs set filetype=rust
