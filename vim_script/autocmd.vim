" Open help automatically on the right of sceeen
augroup vimrc_help
    autocmd!
    autocmd BufEnter *.txt if &buftype == 'help' | wincmd L | endif
augroup END

" Ynaked from https://github.com/jdhao/nvim-config/blob/master/viml_conf/autocommands.vim

augroup term_settings
    autocmd!
    " Do not use number and relative number for terminal inside nvim
    autocmd TermOpen * setlocal nonumber
    " Go to insert mode by default to start typing command
    autocmd TermOpen * startinsert
augroup END

" More accurate syntax highlighting? (see `:h syn-sync`)
augroup accurate_syn_highlight
    autocmd!
    autocmd BufEnter * :syntax sync fromstart
augroup END

" Return to last cursor position when opening a file
augroup resume_cursor_position
    autocmd!
    autocmd BufReadPost * call s:resume_cursor_position()
augroup END

" Only resume last cursor position when there is no go-to-line command (something like '+23').
function s:resume_cursor_position() abort
  if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
    let l:args = v:argv  " command line arguments
    for l:cur_arg in l:args
      " Check if a go-to-line command is given.
      let idx = match(l:cur_arg, '\v^\+(\d){1,}$')
      if idx != -1
        return
      endif
    endfor

    execute "normal! g`\"zvzz"
  endif
endfunction

augroup auto_close_win
  autocmd!
  autocmd BufEnter * call s:quit_current_win()
augroup END

" Quit Nvim if we have only one window, and its filetype match our pattern.
function! s:quit_current_win() abort
  let l:quit_filetypes = ['NvimTree']

  let l:should_quit = v:true

  let l:tabwins = nvim_tabpage_list_wins(0)
  for w in l:tabwins
    let l:buf = nvim_win_get_buf(w)
    let l:bf = getbufvar(l:buf, '&filetype')

    if index(l:quit_filetypes, l:bf) == -1
      let l:should_quit = v:false
    endif
  endfor

  if l:should_quit
    qall
  endif
endfunction

augroup return_cursor_to_beam
    autocmd!
    autocmd VimLeave * set guicursor=a:ver2-blinkon0
augroup END
