local args = require "lib.args"

local index = {}

function index:enter(_, stack)
  self.stack = stack

  if args.flag "nosplash" then
    self:finish()
  end

  self.time = 0
  self.step_i = 0

  self:next()
end

function index:finish()
  self.stack:set_top(self.next_state)
end

function index:next()
  if self.step then
    self.time = self.time - (self.step.time or 2)
  end

  self.step = nil
  self.step_i = self.step_i + 1

  if self.step_i > #self.steps then
    self:finish()
  end

  self.step = self.steps[self.step_i]
end

function index:update(dt)
  self.time = self.time + dt

  if self.time >= self.step.time or 2 then
    self:next()
  end
end

return function(steps, next_state)
  setmetatable({steps = steps, next_state = next_state}, index)
end
