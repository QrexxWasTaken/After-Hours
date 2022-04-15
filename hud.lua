

hud = {}

local fps_font = love.graphics.newFont("/assets/fonts/fps_font.TTF", 18)

function hud:load()
  self.fps = 0
end

function hud:update(dt)
  self.fps = love.timer.getFPS()
end

function hud:draw()
  love.graphics.setColor(0, 0.75, 0, 1.0)
  love.graphics.print(self.fps.." FPS", fps_font, 10, 10)
  love.graphics.setColor(255, 255, 255, 1.0)
end
