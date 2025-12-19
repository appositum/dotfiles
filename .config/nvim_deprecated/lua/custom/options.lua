vim.opt.encoding = 'utf8'
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.hlsearch = true
vim.opt.relativenumber = true
vim.opt.fillchars = {
  vert = "┃",
  horiz = "─",
  eob = " ",
  vertright = "╟",
  vertleft = "╢",
  verthoriz = "╂",
  horizdown = "┰",
  horizup = "╀",
}
-- 	  stl		' '		statusline of the current window
-- 	  stlnc		' '		statusline of the non-current windows
-- 	  wbr		' '		window bar
-- 	  horiz		'─' or '-'	horizontal separators :split
-- 	  horizup	'┴' or '-'	upwards facing horizontal separator
-- 	  horizdown	'┬' or '-'	downwards facing horizontal separator
-- 	  vert		'│' or '|'	vertical separators :vsplit
-- 	  vertleft	'┤' or '|'	left facing vertical separator
-- 	  vertright	'├' or '|'	right facing vertical separator
-- 	  verthoriz	'┼' or '+'	overlapping vertical and horizontal
-- 	  fold		'·' or '-'	filling 'foldtext'
-- 	  foldopen	'-'		mark the beginning of a fold
-- 	  foldclose	'+'		show a closed fold
-- 	  foldsep	'│' or '|'      open fold middle marker
-- 	  diff		'-'		deleted lines of the 'diff' option
-- 	  msgsep	' '		message separator 'display'
-- 	  eob		'~'		empty lines at the end of a buffer
-- 	  lastline	'@'		'display' contains lastline/truncate
--
-- U+250x	─	━	│	┃	┄	┅	┆	┇	┈	┉	┊	┋	┌	┍	┎	┏
--
-- U+251x	┐	┑	┒	┓	└	┕	┖	┗	┘	┙	┚	┛	├	┝	┞	┟
--
-- U+252x	┠	┡	┢	┣	┤	┥	┦	┧	┨	┩	┪	┫	┬	┭	┮	┯
--
-- U+253x	┰	┱	┲	┳	┴	┵	┶	┷	┸	┹	┺	┻	┼	┽	┾	┿
--
-- U+254x	╀	╁	╂	╃	╄	╅	╆	╇	╈	╉	╊	╋	╌	╍	╎	╏
--
-- U+255x	═	║	╒	╓	╔	╕	╖	╗	╘	╙	╚	╛	╜	╝	╞	╟
--
-- U+256x	╠	╡	╢	╣	╤	╥	╦	╧	╨	╩	╪	╫	╬	╭	╮	╯
--
-- U+257x	╰	╱	╲	╳	╴	╵	╶	╷	╸	╹	╺	╻	╼	╽	╾	╿
