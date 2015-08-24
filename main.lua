local state = require "lib.state"

local states = require "src.states"
local config = require "src.config"
local window = require "src.window"

function love.load()
  config.load()
  assert(window.from_config(config.data.graphics))

  state:inject()
  state:set(states.menu())
end
