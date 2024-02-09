local Enemies = Object.extend(Object)

ListofEnemies = {}



function Enemies:new(x,y,w,h,speed,health,angle,cos,sin)
	self.x = love.math.random(0,2000) 
	self.y = love.math.random(0,2000) 
	self.w = 50
	self.h = 50
	self.speed = 100
	self.health = 300
	self.angle = math.atan2(player.y - self.y, player.x - self.x)
	self.cos = math.cos(self.angle)
	self.sin = math.sin(self.angle)
	self.damage = 40
	self.experience = 10

	self.canMove = true

	self.timer = 0
	self.add = 1
	if self.x > player.x then
		self.x = 2000
	else self.x = 0 - 100
	end
end


function Enemies:update(dt)
	self.timer = self.timer + self.add * dt / 2

	if self.timer > 8 then
		Enemies:Insert()

		self.timer = 0
	end

	for _,d in ipairs(ListofEnemies) do
		d.angle = math.atan2(player.y - d.y, player.x - d.x)
		d.cos = math.cos(d.angle)
		d.sin = math.sin(d.angle)
		d.x = d.x + d.speed * d.cos * dt
		d.y = d.y + d.speed * d.sin * dt
	end
end


function Enemies:Insert()
	table.insert(ListofEnemies,Enemies())
	table.insert(ListofEnemies,Enemies())
	table.insert(ListofEnemies,Enemies())
	table.insert(ListofEnemies,Enemies())
	table.insert(ListofEnemies,Enemies())
	table.insert(ListofEnemies,Enemies())
	table.insert(ListofEnemies,Enemies())
	table.insert(ListofEnemies,Enemies())
	table.insert(ListofEnemies,Enemies())

end


function Enemies:draw()
	for _,obj in ipairs(ListofEnemies) do
			love.graphics.rectangle('line',obj.x,obj.y,obj.w,obj.h)
	end
end

return Enemies