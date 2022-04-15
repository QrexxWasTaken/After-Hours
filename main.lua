-- Imports
require("player")
anim8 = require("libraries/anim8")
sti = require("libraries/sti")
camera = require("libraries/camera")
wf = require("libraries/windfield")
vector = require("libraries/vector")
require("hud")
bigJim = require("characters/bigJim")
scene = require("libraries/SceneManager")

love.graphics.setDefaultFilter("nearest", "nearest")
cam = camera(player.x, player.y, 2, nil)

function love.load()
  scene:load()
  world:addCollisionClass("player")
  player:load()
  hud:load()
  walls = {}
  doors = {}
  arches = {}
  if gameMap.layers["Walls"] then
    for i, obj in pairs(gameMap.layers["Walls"].objects) do
      local wall = world:newRectangleCollider(obj.x,obj.y,obj.width,obj.height)
      wall:setType('static')
      table.insert(walls,wall)
    end
  end

  if gameMap.layers["Doors"] then
    for i, obj in pairs(gameMap.layers["Doors"].objects) do
      local door = world:newRectangleCollider(obj.x,obj.y,obj.width,obj.height)
      door:setType('static')
      table.insert(doors, door)
    end
  end

  if gameMap.layers["Arches"] then
    for i, obj in pairs(gameMap.layers["Arches"].objects) do
      local arch = world:newRectangleCollider(obj.x,obj.y,obj.width,obj.height)
      arch:setType('static')
      table.insert(arches, arch)
    end
  end

end

function love.update(dt)
  player:update(dt)
  world:update(dt)
  hud:update(dt)
  player.x = player.collider:getX()
  player.y = player.collider:getY()
end

function love.draw()
  cam:attach()
    scene:draw()
    player:draw()
  cam:detach()
  hud:draw()
end

function love.keypressed(key, scancode, isrepeat)
  if key == "f11" then
    fullscreen = not fullscreen
    love.window.setFullscreen(fullscreen)
  elseif key == "f8" then
    scene.current = "../assets/maps/cultist-ending-main.lua"
    print(scene.curent)
  end
end
