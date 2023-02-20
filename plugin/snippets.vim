if exists("loaded_snippets")
  finish
endif
let loaded_snippets = 1

function! s:OpenSnips()
    let snippets_dir = substitute(globpath(&rtp, 'snippets/'), "\n", ',', 'g')
    let snippets_dirs = split(snippets_dir, ",")
    for dir in snippets_dirs
        if 0 != stridx(dir, "vim-snippets")
            execute ":e ".snippets_dir.&filetype.".snippets"
        endif
    endfor
endfunction

function! s:OpenUltiSnips()
    let snippets_dir = substitute(globpath(&rtp, 'UltiSnips/'), "\n", ',', 'g')
    let snippets_dirs = split(snippets_dir, ",")
    for dir in snippets_dirs
        if 0 != stridx(dir, "vim-snippets")
            execute ":e ".dir.&filetype.".snippets"
        endif
    endfor
endfunction

noremap <unique> <script> <Plug>OpenSnips  <SID>OpenSnips
noremap <SID>OpenSnips :call <SID>OpenSnips()<CR>
noremenu <script> Plugin.OpenSnips <SID>OpenSnips

if !exists(":OpenSnips")
  command -nargs=0 OpenSnips :call s:OpenSnips()
endif

noremap <unique> <script> <Plug>OpenUltiSnips  <SID>OpenUltiSnips
noremap <SID>OpenUltiSnips :call <SID>OpenUltiSnips()<CR>
noremenu <script> Plugin.OpenUltiSnips <SID>OpenUltiSnips

if !exists(":OpenUltiSnips")
  command -nargs=0 OpenUltiSnips :call s:OpenUltiSnips()
endif
