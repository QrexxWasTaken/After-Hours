

hud = {}

local font_fps = love.graphics.newFont("assets/fonts/font_fps.ttf", 18)

function hud:load()
  self.fps = 0
end

function hud:update(dt)
  self.fps = love.timer.getFPS()
end

function hud:draw()
  love.graphics.print(self.fps.."  Fps", font_fps, 10, 10)
end
