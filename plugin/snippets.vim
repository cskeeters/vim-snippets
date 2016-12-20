if exists("loaded_snippets")
  finish
endif
let loaded_snippets = 1

function! s:OpenSnips()
    let snippets_dir = substitute(globpath(&rtp, 'snippets/'), "\n", ',', 'g')
    execute ":e ".snippets_dir.&filetype.".snippets"
endfunction

noremap <unique> <script> <Plug>OpenSnips  <SID>OpenSnips
noremap <SID>OpenSnips :call <SID>OpenSnips()<CR>
noremenu <script> Plugin.OpenSnips <SID>OpenSnips

if !exists(":OpenSnips")
  command -nargs=0 OpenSnips :call s:OpenSnips()
endif
