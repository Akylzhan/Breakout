Ball = Class{}

function Ball:init()
	
	self.width = 6
	self.height = 6

	self.x = VIRTUAL_WIDTH / 2 - self.width / 2
	self.y = VIRTUAL_HEIGHT / 2 + self.height * 3

	self.dx = love.math.random(2) == 1 and 80 or -80
	self.dy = 40
end


function Ball:update(dt)
	self.x = self.x + self.dx * dt

	self.y = self.y + self.dy * dt

	if self.y <= 0 then
		gSounds['touch']:play()
		self.dy = -self.dy
		self.y = self.y + 1
		if self.dx < 0 then
			self.dx = -math.random(100, 120)
        else
            self.dx = math.random(100, 120)
        end
	end

	if self.x >= VIRTUAL_WIDTH - self.width or self.x <= 0 then
		gSounds['touch']:play()
		self.dx = -self.dx
		self.x = self.x + (VIRTUAL_WIDTH - self.width - self.x < self.x and -1 or 1)
		if self.dy < 0 then
			self.dy = -math.random(100, 120)
        else
            self.dy = math.random(100, 120)
        end
	end

end

function Ball:Collision(player)
	if player.x > self.x + self.width or player.x + player.width < self.x then
		return false
	end

	if player.y > self.y + self.height or player.y + player.height < self.y then
		return false
	end
	
	gSounds['touch']:play()

	return true
end

function Ball:render()
	love.graphics.rectangle('fill',self.x, self.y, self.width, self.height)
	love.graphics.setColor(1, 1, 1)
end