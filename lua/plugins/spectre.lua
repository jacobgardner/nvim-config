local spectre = require("spectre")

spectre.setup({
  -- vertical = take full height
  -- top left = make sure we're on the far left of the screen
  -- vnew = vertical split
  -- +set ... change the background color to be distict from normal window
  open_cmd = "vertical topleft vnew +set\\ winhighlight=Normal:Pmenu",
  color_devicons = true,
  live_update = true,
  -- Avoids breaking spectre UI when using delete/backspace
  is_block_ui_break = true,
})
