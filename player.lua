local Player = Object.extend(Object)

function Player:new(x,y,w,h,speed,timer,bullets)
	self.x = 0
	self.y = 0 
	self.w = 50
	self.h = 50

	self.healthBarImage = love.graphics.newImage('Assets/healthbar/healthBar.png')	
	self.xHealth = self.x 
	self.yHealth = self.y
	self.WidthHealth = self.health
	self.HeightHealth = 10

	self.canMove = true
	
	self.mainImage = love.graphics.newImage('Assets/MainCharacter.png')
	self.speed = 30
	self.timer = 0
	self.health = 150
end

function Player:update(dt)
	self.xHealth = self.x + 11
	self.yHealth = self.y - 15
	if love.keyboard.isDown('d') and self.canMove then
		self.x = self.x + self.speed * dt
	end
	if love.keyboard.isDown('a') and self.canMove then
		self.x = self.x - self.speed * dt
	end
	if love.keyboard.isDown('w') and self.canMove then
		self.y = self.y - self.speed * dt
	end
	if love.keyboard.isDown('s') and self.canMove then
		self.y = self.y + self.speed * dt
	end
end





function Player:draw()
	love.graphics.rectangle('line', self.x,self.y,self.w,self.h)
	love.graphics.print(self.x)
	love.graphics.print(self.y, 500)

	--draw speed
	love.graphics.print('Player Speed : '.. self.speed, 150,860)
end

function Player:drawHealth()
	love.graphics.print(math.floor(self.health), self.xHealth,self.yHealth)
end

return Player