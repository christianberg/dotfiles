local hotkey = require "mjolnir.hotkey"
local alert = require "mjolnir.alert"
local grid = require "mjolnir.sd.grid"
local mash = {"cmd", "alt", "ctrl"}

grid.MARGINX = 0
grid.MARGINY = 0
grid.GRIDWIDTH = 4

hotkey.bind(mash, 'M', grid.maximize_window)

hotkey.bind(mash, 'N', grid.pushwindow_nextscreen)
hotkey.bind(mash, 'P', grid.pushwindow_prevscreen)

hotkey.bind(mash, 'J', grid.pushwindow_down)
hotkey.bind(mash, 'K', grid.pushwindow_up)
hotkey.bind(mash, 'H', grid.pushwindow_left)
hotkey.bind(mash, 'L', grid.pushwindow_right)

hotkey.bind(mash, 'U', grid.resizewindow_taller)
hotkey.bind(mash, 'O', grid.resizewindow_wider)
hotkey.bind(mash, 'I', grid.resizewindow_thinner)


function mpc_toggle()
  os.execute('/usr/local/bin/mpc toggle')
end

function mpc_get_current()
  local pipe = io.popen('/usr/local/bin/mpc current')
  local result = pipe:read("*a")
  pipe:close()
  return result
end

function mpc_show_current()
  local current = mpc_get_current()
  alert.show(current, 3)
end

hotkey.bind(mash, ';', mpc_toggle)
hotkey.bind(mash, "'", mpc_show_current)
