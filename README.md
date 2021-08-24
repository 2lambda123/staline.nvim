# staline.nvim
TLDR;<br/> staline(**sta**tus**line**): A simple statusline for neovim written in lua.<br/>
stabline(s-**tabline**): A simple bufferline for neovim written in lua. (sry didnt get a better name.)

### Requirements
* Requires neovim version 0.5.0+
* `vim.opt.laststatus=2` in your init.lua for statusline.
* `vim.opt.showtabline=2` in your init.lua for bufferline.

### Installation
* Vim-plug:
    ```vim
    Plug 'tamton-aquib/staline.nvim'
    ```
* Packer
    ```lua
    use 'tamton-aquib/staline.nvim'
    ```
**NOTE:** Doing this will install both staline and stabline. <br />
But separate setup() is required for each to load up.

# Statusline

#### Screenshots
![normal](https://i.imgur.com/LFmEROF.png)
![insert](https://i.imgur.com/rzqMwXU.png)
![command](https://i.imgur.com/jDuOdpK.png)
![visual](https://i.imgur.com/dO1pKaj.png)
<!-- ![normal](https://i.imgur.com/ZBwqI5I.png) -->
<!-- ![insert](https://i.imgur.com/9ADMkb7.png) -->
<!-- ![visual](https://i.imgur.com/q85p45c.png) -->
<!-- ![command](https://i.imgur.com/F9cPtMx.png) -->


#### Configuration
```lua
require('staline').setup{}
```
<details>
<summary> Click to see default configuration </summary>

```lua
require('staline').setup {
	defaults = {
		left_separator  = "",
		right_separator = "",
		line_column     = "[%l/%L] :%c 並%p%% ", -- `:h stl` to see all flags.
		fg              = "#000000",  -- Foreground text color.
		bg              = "none",     -- Default background is transparent.
		cool_symbol     = " ",       -- Change this to override defult OS icon.
		full_path       = false
		font_active     = "none",     -- "bold", "italic", "bold,italic", etc
		true_colors     = false       -- true lsp colors.
	},
	mode_colors = {
		n = "#2bbb4f",
		i = "#986fec",
		c = "#e27d60",
		v = "#4799eb",   -- etc..
	},
	mode_icons = {
		n = " ",
		i = " ",
		c = " ",
		v = " ",   -- etc..
	},
	sections = {
		left = { '- ', '-mode', 'left_sep_double', ' ', 'branch' },
		mid  = { 'file_name' },
		right = { 'cool_symbol','right_sep_double', '-line_column' }
	}
}
```
</details>

#### Sections:

| section | use |
|---------|-----|
| mode         | shows the mode       |
| branch       | shows git branch |
| file_name     | shows filename |
| file_size     | shows file size |
| cool_symbol  | an icon according to the OS type (cutomizable) |
| lsp          | lsp diagnostics (number of errors, warnings, etc) |
| lsp_name     | lsp client name |
| line_column  | shows line, column, percentage, etc |
| left_sep     | single left separator |
| right_sep    | single right separator |
| left_sep_double     | Double left separator with a shade of gray |
| right_sep_double    | Double right separator with a shade of gray |

> `lsp`, `lsp_name`, `file_size` are not included in the default settings.

Check out [wiki](https://github.com/tamton-aquib/staline.nvim/wiki) to see some premade configs and tips.

# Bufferline

### Screenshots
![bar mode](https://i.imgur.com/stkcUAu.png)
![slant mode](https://i.imgur.com/UVS9ii5.png)
![arrow mode](https://i.imgur.com/ERDzicw.png)
![bubble mode](https://i.imgur.com/UjbeyjR.png)


* Configuration
	```lua
	require('stabline').setup{}
	```
* The Default configuration looks something like:
    ```lua
    require('stabline').setup {
	    defaults = {
	        style       = "bar", -- others: arrow, slant, bubble
	        stab_left   = "┃",   -- 😬
	        stab_right  = " ",
	        fg          = Default is fg of "Normal".
	        bg          = Default is bg of "Normal".
	        inactive_bg = "#1e2127",
	        inactive_fg = "#aaaaaa",
	        stab_bg     = Default is darker version of bg.,
            font_active = "bold",
			exclude_fts = {'NvimTree', 'dashboard', 'lir'}
	    },
    }
    ```
<details>

<summary>My personal config as of editing this file:</summary>

![my stabline config](https://i.imgur.com/cmBdfzx.png)

```lua
require'stabline'.setup {
	style = "slant",
	bg = "#986fec",
	fg = "black",
	stab_right = ""
}
```

</details>

### Features
* Lightweight ( below **150 LOC** each)
* Fast. staline+stabline took **< 1ms**. (packers profiling)
* Unicode current mode info. Needs a Nerd Font to be installed.
* Shows current git branch if [plenary](https://github.com/nvim-lua/plenary.nvim) is installed.
* Uses [nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons) if installed, else uses a default table.

#### Cons
* No mouse functions for stabline.
* No ordering or sorting functions for stabline.
* No lsp info in stabline.
* No git related info on staline except branch name.

---

#### Inspirations:
* [This](https://www.reddit.com/r/vim/comments/ld8h2j/i_made_a_status_line_from_scratch_no_plugins_used/) reddit post for staline.
* [akinsho/nvim-bufferline](https://github.com/akinsho/nvim-bufferline.lua) for stabline.

### TODO

- [x] ~Include more filetype support.~
- [x] ~User configuration options. Needs more work.~
- [x] ~Git info. Only branch info for now, *(or ever)*~
- [x] ~Adding "opt-in" bufferline function.~
- [x] ~Add config options for bufferline.~
- [ ] lsp client name in staline.
- [ ] buf numbers in stabline.
