local window = {}

function window:from_config(t)
  return love.window.setMode(t.width, t.height, {
    fullscreen = t.fullscreen,
    vsync = t.vsync,
    msaa = t.msaa,
    highdpi = true
  })
end

return window
