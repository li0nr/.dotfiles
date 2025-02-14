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
local doublePress = false
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

-- move application to next screen
function moveToNextScreen()
  local app = hs.window.focusedWindow()
  app:moveToScreen(app:screen():next())
  app:maximize()
end
hs.hotkey.bind({"ctrl", "alt"}, "n", moveToNextScreen)

