local Scene = {}

function Scene:load()
  self.current = "assets/maps/cultist-ending-main.lua"
  gameMap = sti(self.current)
  world = wf.newWorld(0, 0)
end

function Scene:update(dt)
  gameMap = sti(self.current)
end

function Scene:draw()
  gameMap:drawLayer(gameMap.layers["Floor"])
  gameMap:drawLayer(gameMap.layers["Bricks"])
  gameMap:drawLayer(gameMap.layers["Lockers"])
end

return Scene
