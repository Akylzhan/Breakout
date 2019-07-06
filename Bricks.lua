Bricks = Class{}

function Bricks:init(xP,yP)
	
	self.width = 64
	self.height = 10

	self.x = xP
	self.y = yP
end


function Bricks:update(dt)
end


function Bricks:render()
	love.graphics.setColor(255/255, 80/255, 80/255)
	love.graphics.rectangle('fill',self.x, self.y, self.width, self.height)
	love.graphics.setColor(1, 1, 1)
end