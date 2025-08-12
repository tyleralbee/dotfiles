" Inspired by settings in: https://github.com/esm7/obsidian-vimrc-support

" Make <space> the leader key by mapping it to \ (default leader key)
unmap <Space>
map <Space> \

" Use system clipboard
set clipboard=unnamed

" Go back and forward with Ctrl+O and Ctrl+I
" (make sure to remove default Obsidian shortcuts for these to work)
exmap back obcommand app:go-back
nmap <C-o> :back<CR>
exmap forward obcommand app:go-forward
nmap <C-i> :forward<CR>

" Have j and k navigate visual lines rather than logical ones
nmap j gj
nmap k gk

" Enable :q to close
exmap q obcommand workspace:close
nmap ZZ :q<CR>

" jump to link
exmap jumpToLink obcommand mrj-jump-to-link:activate-jump-to-link
nmap \f :jumpToLink<CR>

" vim-surround mappings
exmap surround_wiki surround [[ ]]
exmap surround_quote surround " "
exmap surround_apostrophe surround ' '
exmap surround_grave surround ` `
exmap surround_parenthesis surround ( )
exmap surround_bracket surround [ ]
exmap surround_brace surround { }
exmap surround_chevron surround < >

" NOTE: must use 'map' and not 'nmap'
map [[ :surround_wiki<CR>
nunmap s
vunmap s
map s" :surround_quote<CR>
map s' :surround_apostrophe<CR>
map s` :surround_grave<CR>
map s( :surround_parenthesis<CR>
map s) :surround_parenthesis<CR>
map sb :surround_bracket<CR>
map s[ :surround_bracket<CR>
map s] :surround_bracket<CR>
map s{ :surround_brace<CR>
map s} :surround_brace<CR>
map s< :surround_chevron<CR>
map s> :surround_chevron<CR>

" select all occurrences of word under cursor
exmap selectAllOccurrences obcommand obsidian-editor-shortcuts:selectAllOccurrences
nmap ga :selectAllOccurrences<CR>
vmap ga :selectAllOccurrences<CR>

" select next occurrence of word under cursor -- DOESN'T WORK WITH :selectWordOrNextOccurrence -- NEED TO USE OBSIDIAN COMMAND PALETTE
" exmap selectWordOrNextOccurrence obcommand obsidian-editor-shortcuts:selectWordOrNextOccurrence
" nmap gl :selectWordOrNextOccurrence<CR>
" vmap gl :selectWordOrNextOccurrence<CR>

" follow link under cursor
exmap openLink obcommand editor:follow-link
nmap gf :openLink<CR>
