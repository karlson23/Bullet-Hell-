 dt = love.timer.getDelta( )

Object = require 'Libs/classes'
local push = require 'Libs/push'

camera = require 'Libs/camera'
cam = camera()

local gameWidth, gameHeight = 320, 180
local windowWidth, windowHeight = love.window.getDesktopDimensions()
-- for windowed --> windowWidth, windowHeight = windowWidth*.7, windowHeight*.7 --make the window a bit smaller than the screen itself

push:setupScreen(gameWidth, gameHeight, windowWidth, windowHeight, {fullscreen = true})



Player = require('player')
player = Player()

require('GamePoints')


Enemies = require('enemies')
local enemies = Enemies()

Mouse = require('Mouse')
mouse = Mouse()

Bullets = require('bullets')
local bullets = Bullets()


local Upgrades = require('upgrades')
local upgrades = Upgrades()


require('Collision')


function camUpdate(dt)
	cam:lookAt(player.x + 400,player.y + 240)
end


function love.load()
	points()
end


function love.update(dt)
	camUpdate(dt)

	upgrades:update()


	bullets:update(dt)

	player:update(dt)

	pointsUpdate(dt)

	enemies:update(dt)

	mouse:update(dt)

	BulletHitEnemy(dt)

	EnemyHitPlayer(dt)

end


function love.draw(dt)
	upgrades:draw()

	enemies:draw()

	mouse:draw()

	player:draw()

	pointsDraw()

	player:drawHealth()

	bullets:draw()

end