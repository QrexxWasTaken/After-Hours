
player = {}

function player:load()
  self.x = love.graphics.getWidth() / 2
  self.y = love.graphics.getHeight() / 2
  self.radius = 100
  self.speed = 120
  self.spriteSheet = love.graphics.newImage("assets/sprites/player-spritesheet.png")
  self.grid = anim8.newGrid(16, 16, self.spriteSheet:getWidth(), self.spriteSheet:getHeight())
  self.collider = world:newBSGRectangleCollider(self.x, self.y, 35, 60, 10)
  self.collider:setFixedRotation(true)
  self.collider:setCollisionClass("player")
  -- Walking Animations
  self.animations = {}
  self.animations.down = anim8.newAnimation(self.grid('1-4', 1), 0.2)
  self.animations.left = anim8.newAnimation(self.grid('1-4', 2), 0.2)
  self.animations.right = anim8.newAnimation(self.grid('1-4', 3), 0.2)
  self.animations.up = anim8.newAnimation(self.grid('1-4', 4), 0.2)

  self.anim = player.animations.left
end

function player:update(dt)
  local isMoving = false

  local vx = 0
  local vy = 0
  local dirX = 0
  local dirY = 0
  if love.keyboard.isDown("right") or love.keyboard.isDown("d") then
    dirX = 1
    vx = self.speed
    self.anim = self.animations.right
    isMoving = true
  end
  if love.keyboard.isDown("left") or love.keyboard.isDown("a") then
    dirX = -1
    vx = - self.speed
    self.anim = self.animations.left
    isMoving = true
  end
  if love.keyboard.isDown("up") or love.keyboard.isDown("w") then
    dirY = -1
    vy = - self.speed
    self.anim = self.animations.up
    isMoving = true
  end
  if love.keyboard.isDown("down") or love.keyboard.isDown("s") then
    dirY = 1
    vy = self.speed
    self.anim = self.animations.down
    isMoving = true
  end

  local vec = vector(dirX, dirY):normalized() * self.speed

  self.collider:setLinearVelocity(vec.x, vec.y)

  if not isMoving then
    self.anim:gotoFrame(2)
  end

  self.anim:update(dt)

  cam:lookAt(self.x, self.y)
end

function player:draw()
  self.anim:draw(player.spriteSheet, player.x, player.y, nil, 3.5, nil, 8, 8)
end
