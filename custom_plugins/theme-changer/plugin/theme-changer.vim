" Prevents the plugin from being loaded multiple times. If the loaded
" variable exists, do nothing more. Otherwise, assign the loaded
" variable and continue running this instance of the plugin.
if exists("g:loaded_theme_changer")
    finish
endif
let g:loaded_theme_changer = 1


" Exposes the plugin's functions for use as commands in Neovim.
command! -nargs=0 ChangeTheme lua require("theme-changer").change_theme()
command! -nargs=0 CurrentTheme lua require("theme-changer").current_theme()
