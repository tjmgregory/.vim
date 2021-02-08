function! CopyGitLink(...) range
    redir @+
    silent echo gitlink#GitLink(get(a:, 1, 0))
    redir END
endfunction
nmap <leader>gl :call CopyGitLink()<CR>
vmap <leader>gl :call CopyGitLink(1)<CR>
