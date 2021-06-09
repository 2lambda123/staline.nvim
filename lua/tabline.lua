Tabline = {}

function Tabline.get_tabline()
	local tabline = ""
	local normal_bg = vim.api.nvim_get_hl_by_name("Normal", {})['background'] or 255
	local normal_fg = vim.api.nvim_get_hl_by_name("Normal", {})['foreground'] or 0
	local normal_bg_hex = string.format("%x", normal_bg)
	local normal_fg_hex = string.format("%x", normal_fg)

	vim.cmd('hi Bruh guifg='..normal_fg_hex..' guibg='..normal_bg_hex..' gui=bold')
	vim.cmd('hi TablineSel guifg=white guibg='..normal_bg_hex..' gui=bold')

	local buffers = vim.api.nvim_list_bufs()

	for k,i in pairs(buffers) do
		if vim.api.nvim_buf_is_valid(i) then
			local edited = vim.bo.modified and "  " or ""
			local f_name = vim.api.nvim_buf_get_name(i):match(".*%/(.+)")
			if f_name ~= nil then f_name = "  "..f_name.."  " else f_name = "" end

			if f_name:match("Vim.Buffer") then f_name = "" end

			if vim.api.nvim_get_current_buf() == i then
				f_name = f_name..edited
				tabline = tabline.."%#Bruh#".."%#TablineSel#"..f_name
			else
				tabline = tabline.."%#TablineFill#"..f_name.. "%#TablineFill#"
			end
		end
	end

	return tabline.."%#TablineFill#"
end

return Tabline

