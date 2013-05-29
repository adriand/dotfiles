require("awful")
require("awful.autofocus")
require("awful.rules")
require("beautiful")
require("naughty")
require("vicious")

-- Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
  naughty.notify({
    preset = naughty.config.presets.critical,
    title = "Oops, there were errors during startup!",
    text = awesome.startup_errors,
  })
end

-- Handle runtime errors after startup
do
  local in_error = false
  awesome.add_signal("debug::error", function(err)
    -- Make sure we don't go into an endless error loop
    if in_error then return end
    in_error = true

    naughty.notify({
      preset = naughty.config.presets.critical,
      title = "Oops, an error happened!",
      text = err,
    })

    in_error = false
  end)
end

-- Variable definitions
-- Themes define colours, icons, and wallpapers
beautiful.init(awful.util.getdir('config') .. "/theme.lua")

-- This is used later as the default terminal and editor to run.
terminal = "xterm -fa 'DejaVu Sans Mono' -fs 9"

editor = os.getenv("EDITOR") or "editor"
editor_cmd = terminal .. " -e " .. editor

browser = "firefox-trunk"

file_manager = "pcmanfm"

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
layouts = {
  awful.layout.suit.floating,
  awful.layout.suit.tile,
  awful.layout.suit.tile.left,
  awful.layout.suit.tile.bottom,
  awful.layout.suit.tile.top,
  awful.layout.suit.fair,
  awful.layout.suit.fair.horizontal,
  -- awful.layout.suit.spiral,
  -- awful.layout.suit.spiral.dwindle,
  -- awful.layout.suit.max,
  -- awful.layout.suit.max.fullscreen,
  -- awful.layout.suit.magnifier,
}

-- Tags
-- Define a tag table which hold all screen tags.
tags = {}
for s = 1, screen.count() do
  tags[s] = awful.tag({ 1, 2, 3, 4 }, s, layouts[2])
end

-- Create a textclock widget
mytextclock = widget({ type = "textbox" })
vicious.register(mytextclock, vicious.widgets.date, "%A, %B %d, %Y at %I:%M:%S %p  ", 1)

-- Create a systray
mysystray = widget({ type = "systray" })

-- Create a wibox for each screen and add it
mytopwibox = {}
mybottomwibox = {}
mypromptbox = {}
mylayoutbox = {}
mylayoutbox = {}

mytaglist = {}
mytaglist.buttons = awful.util.table.join(
  awful.button({ }, 1, awful.tag.viewonly),
  awful.button({ modkey }, 1, awful.client.movetotag),
  awful.button({ }, 3, awful.tag.viewtoggle),
  awful.button({ modkey }, 3, awful.client.toggletag),
  awful.button({ }, 4, awful.tag.viewnext),
  awful.button({ }, 5, awful.tag.viewprev)
)

mytasklist = {}
mytasklist.buttons = awful.util.table.join(
  awful.button({ }, 1, function (c)
    if c == client.focus then
      c.minimized = true
    else
      if not c:isvisible() then
        awful.tag.viewonly(c:tags()[1])
      end
      -- This will also un-minimize
      -- the client, if needed
      client.focus = c
      c:raise()
    end
  end),

  awful.button({ }, 3, function ()
    if instance then
      instance:hide()
      instance = nil
    else
      instance = awful.menu.clients({ width=250 })
    end
  end),

  awful.button({ }, 4, function ()
    awful.client.focus.byidx(1)
    if client.focus then client.focus:raise() end
  end),

  awful.button({ }, 5, function ()
    awful.client.focus.byidx(-1)
    if client.focus then client.focus:raise() end
  end)
)

for s = 1, screen.count() do
  -- Create a promptbox for each screen
  mypromptbox[s] = awful.widget.prompt({ layout = awful.widget.layout.horizontal.leftright })

  -- Create an imagebox widget which will contains an icon indicating which layout we're using.
  -- We need one layoutbox per screen.
  mylayoutbox[s] = awful.widget.layoutbox(s)
  mylayoutbox[s]:buttons(awful.util.table.join(
    awful.button({ }, 1, function() awful.layout.inc(layouts, 1) end),
    awful.button({ }, 3, function() awful.layout.inc(layouts, -1) end),
    awful.button({ }, 4, function() awful.layout.inc(layouts, 1) end),
    awful.button({ }, 5, function() awful.layout.inc(layouts, -1) end)
  ))

  -- Create a taglist widget
  mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.label.all, mytaglist.buttons)

  -- Create a tasklist widget
   mytasklist[s] = awful.widget.tasklist(function(c)
     return awful.widget.tasklist.label.currenttags(c, s)
   end, mytasklist.buttons)

  -- Create the top wibox
  mytopwibox[s] = awful.wibox({ position = "top", screen = s, height = "20" })

  -- Add widgets to the wibox - order matters
  mytopwibox[s].widgets = {
    {
      mylayoutbox[s],
      mytaglist[s],
      mypromptbox[s],
      layout = awful.widget.layout.horizontal.leftright
    },
    mysystray,
    mytextclock,
    layout = awful.widget.layout.horizontal.rightleft
  }

  -- Create the bottom wibox
  mybottomwibox[s] = awful.wibox({ position = "bottom", screen = s, height = "20" })

  mybottomwibox[s].widgets = {
    mytasklist[s],
    layout = awful.widget.layout.horizontal.leftright
  }
end

-- Mouse bindings
root.buttons(awful.util.table.join(
  awful.button({ }, 3, function() mymainmenu:toggle() end),
  awful.button({ }, 4, awful.tag.viewnext),
  awful.button({ }, 5, awful.tag.viewprev)
))

-- Key bindings
globalkeys = awful.util.table.join(
  awful.key({ }, "XF86AudioRaiseVolume", function() awful.util.spawn("amixer set Master 9%+", false)
  end),

  awful.key({ }, "XF86AudioLowerVolume", function() awful.util.spawn("amixer set Master 9%-", false) end),

  awful.key({ }, "XF86AudioMute", function() awful.util.spawn("amixer sset Master toggle", false) end),

  awful.key({ }, "XF86AudioPlay", function() awful.util.spawn("ncmpcpp toggle", false) end),

  awful.key({ }, "XF86AudioNext", function() awful.util.spawn("ncmpcpp next", false) end),

  awful.key({ }, "XF86AudioStop", function() awful.util.spawn("ncmpcpp stop", false) end),

  awful.key({ modkey }, "Left",   awful.tag.viewprev),

  awful.key({ modkey }, "Right",  awful.tag.viewnext),

  awful.key({ modkey }, "Escape", function()
    awful.util.spawn(terminal .. " -e htop")
  end),

  awful.key({ modkey }, "s", function()
    awful.util.spawn("reticeo")
  end),

  awful.key({ modkey }, "j", function()
    awful.client.focus.byidx( 1)
    if client.focus then
      client.focus:raise()
    end
  end),

  awful.key({ modkey }, "k", function()
    awful.client.focus.byidx(-1)
    if client.focus then
      client.focus:raise()
    end
  end),

  awful.key({ modkey, "Shift" }, "j", function() awful.client.swap.byidx(  1) end),

  awful.key({ modkey, "Shift" }, "k", function() awful.client.swap.byidx( -1) end),

  awful.key({ modkey, "Control" }, "j", function() awful.screen.focus_relative( 1) end),

  awful.key({ modkey, "Control" }, "k", function() awful.screen.focus_relative(-1) end),

  awful.key({ modkey }, "u", awful.client.urgent.jumpto),

  awful.key({ modkey }, "Tab", function()
    awful.client.focus.history.previous()

    if client.focus then
      client.focus:raise()
    end
  end),

  awful.key({ modkey }, "w", function() awful.util.spawn(browser) end),

  awful.key({ modkey }, "a", function() awful.util.spawn('pass-autotype') end),

  awful.key({ modkey }, "f", function() awful.util.spawn(file_manager) end),

  awful.key({ modkey }, "Return", function() awful.util.spawn(terminal) end),

  awful.key({ modkey, "Control" }, "r", awesome.restart),

  awful.key({ modkey, "Shift" }, "q", awesome.quit),

  awful.key({ modkey }, "l", function() awful.tag.incmwfact( 0.05)    end),

  awful.key({ modkey }, "h", function() awful.tag.incmwfact(-0.05)    end),

  awful.key({ modkey, "Shift" }, "h", function() awful.tag.incnmaster( 1)      end),

  awful.key({ modkey, "Shift" }, "l", function() awful.tag.incnmaster(-1)      end),

  awful.key({ modkey, "Control" }, "h", function() awful.tag.incncol( 1)         end),

  awful.key({ modkey, "Control" }, "l", function() awful.tag.incncol(-1)         end),

  awful.key({ modkey }, "space", function() awful.layout.inc(layouts,  1) end),

  awful.key({ modkey, "Shift" }, "space", function() awful.layout.inc(layouts, -1) end),

  awful.key({ modkey, "Control" }, "n", awful.client.restore),

  awful.key({ modkey }, "r", function() mypromptbox[mouse.screen]:run() end),

  awful.key({ modkey }, "x", function()
    awful.prompt.run({
      prompt = "Run Lua code: " },
      mypromptbox[mouse.screen].widget,
      awful.util.eval,
      nil,
      awful.util.getdir("cache") .. "/history_eval"
    )
  end)
)

clientkeys = awful.util.table.join(
  awful.key({ modkey, "Shift" }, "f", function(c)
    c.fullscreen = not c.fullscreen
  end),

  awful.key({ modkey }, "q", function(c)
    c:kill()
  end),

  awful.key({ modkey, "Control" }, "space", awful.client.floating.toggle),

  awful.key({ modkey, "Control" }, "Return", function(c)
    c:swap(awful.client.getmaster())
  end),

  awful.key({ modkey, "Shift" }, "r", function(c)
    c:redraw()
  end),

  awful.key({ modkey }, "t", function(c)
    c.ontop = not c.ontop
  end),

  awful.key({ modkey }, "n", function(c)
    c.minimized = true
  end),

  awful.key({ modkey }, "m", function(c)
    c.maximized_horizontal = not c.maximized_horizontal
    c.maximized_vertical   = not c.maximized_vertical
  end)
)

-- Compute the maximum number of digit we need, limited to 9
keynumber = 0
for s = 1, screen.count() do
  keynumber = math.min(9, math.max(#tags[s], keynumber));
end

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, keynumber do
  globalkeys = awful.util.table.join(
    globalkeys,

    awful.key({ modkey }, "#" .. i + 9, function()
      local screen = mouse.screen
      if tags[screen][i] then
        awful.tag.viewonly(tags[screen][i])
      end
    end),

    awful.key({ modkey, "Control" }, "#" .. i + 9, function()
      local screen = mouse.screen
      if tags[screen][i] then
        awful.tag.viewtoggle(tags[screen][i])
      end
    end),

    awful.key({ modkey, "Shift" }, "#" .. i + 9, function()
      if client.focus and tags[client.focus.screen][i] then
        awful.client.movetotag(tags[client.focus.screen][i])
      end
    end),

    awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9, function()
      if client.focus and tags[client.focus.screen][i] then
        awful.client.toggletag(tags[client.focus.screen][i])
      end
    end)
  )
end

clientbuttons = awful.util.table.join(
  awful.button({ }, 1, function(c) client.focus = c; c:raise() end),
  awful.button({ modkey }, 1, awful.mouse.client.move),
  awful.button({ modkey }, 3, awful.mouse.client.resize)
)

-- Set keys
root.keys(globalkeys)

-- Rules
awful.rules.rules = {
  -- All clients will match this rule.
  {
    rule = { },
    properties = {
      border_color = beautiful.border_normal,
      border_width = beautiful.border_width,
      buttons = clientbuttons,
      focus = true,
      keys = clientkeys,
      size_hints_honor = false,
    },
  },
  {
    rule = { instance = "plugin-container" },
    properties = {
      floating = true,
    }
  }
}

-- Signals
-- Signal function to execute when a new client appears.
client.add_signal("manage", function(c, startup)
  if not startup then
    if not c.size_hints.user_position and not c.size_hints.program_position then
      awful.placement.no_overlap(c)
      awful.placement.no_offscreen(c)
    end
  end
end)

client.add_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.add_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
