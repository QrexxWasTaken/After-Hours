
bigJim = {}

function bigJim:load()
  self.health = 10
  self.dialog = {
    init = {
      text = "This is a test, hi!",
      title = "Big Jim",
      image = love.graphics.newImage("assets/sprites/big-jim.png"),
      options = {
        one = "Cool!",
        two = "Awesome"
      }
    }
  }
end
