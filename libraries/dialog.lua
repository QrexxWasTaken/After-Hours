
dialog = {}

function dialog:load()
  self.mode = "fill"
  self.x = love.window.getWidth()*2 - love.window.getWidth()
end

function dialog:update(dt)

end

function dialog:draw()
  love.graphics.setColor(1, 1, 1, 1.0)
  love.graphics.rectangle(self.mode, self.x, love.window.getHeight()*2 - love.window.getWHeight(), love.window.getWidth()/4, love.window.getHeight()/4)
end
