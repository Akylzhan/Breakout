Bricks = Class{}

function Bricks:init(xP,yP)
	
	self.width = 64
	self.height = 10

	self.health = 4

	self.x = xP
	self.y = yP

	self.color = {
		{0.8, 0, 0},
		{0, 0.8, 1},
		{0, 0, 1},
		{0, 0.9, 0}
	}
end


function Bricks:update(dt)
end


function Bricks:render()
	love.graphics.setColor(self.color[self.health])
	love.graphics.rectangle('fill',self.x, self.y, self.width, self.height)
	love.graphics.setColor(1, 1, 1)
end