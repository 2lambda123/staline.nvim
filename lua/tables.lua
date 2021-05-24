local Tables = {}

function system_icon()
	if vim.fn.has("win32") == 1 then return "者"
	elseif vim.fn.has("unix") == 1 then return " "
	elseif vim.fn.has("mac") == 1 then return " "
	end
end

Tables.defaults = {
	leftSeparator = "",
	rightSeparator = "",
	line_column = "[%l/%L] :%c 並%p%% ",
	cool_symbol = system_icon(),
	fg = "#000000",
	bg = "none",
	full_path = false,
	filename_section = "center",
}

Tables.mode_colors = {
     ['n']    =  "#2bbb4f", --> "#6ed57e"
     ['v']    =  "#4799eb",
     ['V']    =  "#4799eb",
     ['i']    =  "#986fec",
     ['ic']   =  "#986fec",
     ['c']    =  "#e27d60",
     ['t']    =  "#ffd55b", --> "#" fff94c
     ['r']    =  "#fff94c",
     ['R']    =  "#fff94c"
}

Tables.mode_icons = {
     ['n']   = ' ',
     ['v']   = ' ',
     ['V']   = ' ',
     ['i']   = ' ',
     ['ic']  = ' ',
     ['c']   = ' ',
     ['r']   = 'Prompt',
     ['t']   = 'T',
     ['R']   = ' ',
     ['^V']  = ' '
}

Tables.file_icons = {
     typescript         = ' ' ,
     python             = ' ' ,
     html               = ' ' ,
     css                = ' ' ,
     scss               = ' ' ,
     javascript         = ' ' ,
     javascriptreact    = ' ' ,
     markdown           = ' ' ,
     sh                 = ' ',
     zsh                = ' ',
     vim                = ' ',
     rust               = ' ',
     cpp                = ' ',
     c                  = ' ',
     go                 = ' ',
     lua                = ' ',
     conf               = ' ',
     haskel             = ' ',
     ruby               = ' ',
     txt	            = ' '
}

return Tables
