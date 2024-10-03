local log = hs.logger.new('init.lua', 'debug')

-- Use Control+` to reload Hammerspoon config
-- hs.hotkey.bind({'ctrl'}, '`', nil, function()
--   hs.reload()
-- end)
hs.hotkey.bind({ "cmd", "ctrl" }, "H", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

hs.hotkey.bind({ "cmd", "ctrl" }, "L", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2)
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "ctrl"}, "K", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.y = max.y  -- Position the window at the top of the screen
  f.h = max.h / 2  -- Half the height of the screen (upper half)
  win:setFrame(f)
end)

hs.hotkey.bind({ "cmd", "ctrl" }, "J", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  -- Keep the current x position and width
  f.y = max.y + (max.h / 2)  -- Move to the bottom half
  f.h = max.h / 2  -- Set height to half (lower half)

  win:setFrame(f)
end)

-- hs.hotkey.bind({"cmd", "ctrl"}, "return", function()
--   local win = hs.window.focusedWindow()
--   local screen = win:screen()
--   local max = screen:frame()
--
--   win:setFrame(max)
-- end)
--
local doublePress = false

-- Function to center window and make it 1/4 of the screen size
local function centerQuarterScreen()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  -- Set the window to 1/4 of the screen and center it
  f.w = max.w / 2
  f.h = max.h / 2
  f.x = max.x + (max.w - f.w) / 2
  f.y = max.y + (max.h - f.h) / 2

  win:setFrame(f)
end

-- Hotkey for cmd + alt + return (enter)
hs.hotkey.bind({"cmd", "ctrl"}, "return", function()
  if doublePress then
    centerQuarterScreen()  -- Perform the action on second press
    doublePress = false  -- Reset the press tracker
  else
    doublePress = true
    local win = hs.window.focusedWindow()
    local screen = win:screen()
    local max = screen:frame()
    win:setFrame(max)

    hs.timer.doAfter(0.3, function()  -- Set a timeout for the second press
      doublePress = false
    end)
  end
end)

keyUpDown = function(modifiers, key)
  -- Un-comment & reload config to log each keystroke that we're triggering
  -- log.d('Sending keystroke:', hs.inspect(modifiers), key)

  hs.eventtap.keyStroke(modifiers, key, 0)
end

-- Subscribe to the necessary events on the given window filter such that the
-- given hotkey is enabled for windows that match the window filter and disabled
-- for windows that don't match the window filter.
--
-- windowFilter - An hs.window.filter object describing the windows for which
--                the hotkey should be enabled.
-- hotkey       - The hs.hotkey object to enable/disable.
--
-- Returns nothing.
enableHotkeyForWindowsMatchingFilter = function(windowFilter, hotkey)
  windowFilter:subscribe(hs.window.filter.windowFocused, function()
    hotkey:enable()
  end)

  windowFilter:subscribe(hs.window.filter.windowUnfocused, function()
    hotkey:disable()
  end)
end

-- require('keyboard.control-escape')
-- require('keyboard.delete-words')
-- require('keyboard.hyper')
-- require('keyboard.markdown')
-- require('keyboard.panes')
require('windows')

hs.notify.new({title='Hammerspoon', informativeText='Ready to rock 🤘'}):send()

-- move application to next screen
function moveToNextScreen()
  local app = hs.window.focusedWindow()
  app:moveToScreen(app:screen():next())
  app:maximize()
end
hs.hotkey.bind({"ctrl", "alt"}, "n", moveToNextScreen)

