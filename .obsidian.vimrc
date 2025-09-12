" This vimrc intends to emulate my IDE's Vim motions in Obsidian.
" Currently: https://github.com/tyleralbee/dotfiles/blob/main/.config/zed/keymap.json

" Make <space> the leader key by mapping it to \ (default leader key)
" Usage of `\` throughout this file indicates to press <Space> (and not `\`).
unmap <Space>
map <Space> \

" Use system clipboard
set clipboard=unnamed

" Navigate visual lines rather than logical ones
" Differs when lines wrap, and when used with an operator, because they're not linewise.
nnoremap j gj
nnoremap k gk

" Don't pollute the register (HACK since we can't map to `"_x` or `"_C`)
nnoremap C "_c$
nnoremap x "_dl

" Browser Vim motions (Tridactyl, Vimium, etc.)
" =============================================

" <space>-f for link selection
exmap jumpToLink obcommand mrj-jump-to-link:activate-jump-to-link
nmap \f :jumpToLink<CR>

" gt/gT for next/previous tab
exmap tabnext obcommand workspace:next-tab
nmap gt :tabnext<CR>
exmap tabprev obcommand workspace:previous-tab
nmap gT :tabprev<CR>

" IDE Vim motions (Neovim plugins, Zed custom Vim motions, etc.)
" ==============================================================

" Y to yank to end of line
nnoremap Y y$

" ctrl-o and ctrl-i for back/forward navigation
exmap back obcommand app:go-back
nmap <C-o> :back<CR>
exmap forward obcommand app:go-forward
nmap <C-i> :forward<CR>

" gf to open link under cursor
exmap openLink obcommand editor:follow-link
nmap gf :openLink<CR>

" ZZ to close the current file
exmap q obcommand workspace:close
nmap ZZ :q<CR>

" <space>-s for vim-surround
exmap surround_wiki surround [[ ]]
exmap surround_quote surround " "
exmap surround_apostrophe surround ' '
exmap surround_grave surround ` `
exmap surround_parenthesis surround ( )
exmap surround_bracket surround [ ]
exmap surround_brace surround { }
exmap surround_chevron surround < >
vmap [[ :surround_wiki<CR>
vmap \s" :surround_quote<CR>
vmap \s' :surround_apostrophe<CR>
vmap \s` :surround_grave<CR>
vmap \s( :surround_parenthesis<CR>
vmap \s) :surround_parenthesis<CR>
vmap \sb :surround_bracket<CR>
vmap \s[ :surround_bracket<CR>
vmap \s] :surround_bracket<CR>
vmap \s{ :surround_brace<CR>
vmap \s} :surround_brace<CR>
vmap \s< :surround_chevron<CR>
vmap \s> :surround_chevron<CR>

" s for lightspeed.nvim (via Lightspeed from obsidian-jump-to-link)
" Note: ideally this would function like Zed's implementation of vim-sneak; may replace someday
unmap s
exmap lightspeedJump obcommand mrj-jump-to-link:activate-lightspeed-jump
nmap s :lightspeedJump<CR>

" S for duplicate lightspeed.nvim to keep muscle memory of S when jumping backwards in other editors
unmap S
exmap lightspeedJump obcommand mrj-jump-to-link:activate-lightspeed-jump
nmap S :lightspeedJump<CR>

" Broken commands that I'd like to fix some day
" =============================================

" BUG: obsidian-editor-shortcuts:selectAllOccurrences places a cursor at the start of the document
" exmap selectall obcommand obsidian-editor-shortcuts:selectAllOccurrences
" nmap ga :selectall<CR>
" vmap ga :selectall<CR>

" BUG: obsidian-editor-shortcuts:selectWordOrNextOccurrence doesn't work outside of the command palette
" exmap selectnext obcommand obsidian-editor-shortcuts:selectWordOrNextOccurrence
" nmap gl :selectnext<CR>
" vmap gl :selectnext<CR>