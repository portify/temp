local ser = require "ser"
local config = {}

function config.load()
  config.data = loadstring(love.filesystem.read("config.lua"))()
end

function config.save()
  love.filesystem.write("config.lua", ser(config.data))
end

return config
