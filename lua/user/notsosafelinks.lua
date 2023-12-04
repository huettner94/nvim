vim.cmd([[
func O365fix()
   '<,'>sub/https:\/\/eur03.safelinks.protection.outlook.com\/?url=//
   '<,'>sub/&.*//
   '<,'>sub/%2C/,/ge
   '<,'>sub/%3A/:/ge
   '<,'>sub/%5B/[/ge
   '<,'>sub/%5D/]/ge
   '<,'>sub/%2F/\//ge
   '<,'>sub/%23/#/ge
endfunc

:nnoremap <F10> v:<C-U>call O365fix()<CR>
]])
