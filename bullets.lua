local Bullets = Object.extend(Object)

ListOfBullets = {}
Ammo = 100
AddAmmo = 6
SubtractAmmo = 1
Bulletdamage = 50
BulletSpeed = 2000


function Bullets:new(x,y,w,h,speed,angle,cos,sin,damage)
	self.x = player.x
	self.y = player.y
	self.w = 25
	self.h = 25

	self.angle = math.atan2(mouse.y - self.y, mouse.x - self.x)
	self.cos = math.cos(self.angle)
	self.sin = math.sin(self.angle)

end



function love.mousepressed(x,y,button,istouch)
	if button == 1 and Ammo > 0 then
		Ammo = Ammo - SubtractAmmo
		table.insert(ListOfBullets,Bullets())
	end
end





function Bullets:update(dt)
	for _,v in ipairs(ListOfBullets) do
		v.x = v.x + BulletSpeed * v.cos * dt
		v.y = v.y + BulletSpeed * v.sin * dt
	end
end


function Bullets:draw()
	for _,d in ipairs(ListOfBullets) do
		love.graphics.rectangle('line',d.x,d.y,d.w,d.h)
	end
	love.graphics.print(Ammo,150, 50)
	love.graphics.print('Bullet Speed : '.. BulletSpeed,150,900)
	love.graphics.print('Bullet Damage : '.. Bulletdamage,150,880)
end

return Bullets