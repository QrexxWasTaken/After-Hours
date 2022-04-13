

hud = {}

function hud:load()
  self.fps = 0
end

function hud:update(dt)
  self.fps = dt
end

function hud:draw()
  print("fps:" , self.fps)
end
