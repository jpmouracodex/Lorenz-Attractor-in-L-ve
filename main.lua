Point = require("point")
camera = require("camera")

function love.load()

	local scale = 0.7
	camera.scaleX = scale
	camera.scaleY = scale

	dt = 0.01

	a = 10
	b = 28
	c = 8/3

	x = 0.01
	y = 0.1
	z = 0.001

	points = {}

end

function love.update()
	updateControls()
	local dx = (a * (y - x)) * dt
	local dy = (x * (b - z) - y) * dt
	local dz = (x * y - c * z) * dt

	x = x + dx
	y = y + dy
	z = z + dz


	local point = Point:new(x, y, z)
	table.insert(points, point)

end

function love.draw()
	camera:set()

	for i, p in pairs(points) do
		love.graphics.setColor(p.z, p.z, p.z)
		love.graphics.points(p.x, p.y)
	end
	camera:unset()
end

function love.wheelmoved(x, y)
    if y > 0 then
        camera.scaleX = camera.scaleX - 0.1
        camera.scaleY = camera.scaleY - 0.1
    elseif y < 0 then
        camera.scaleX = camera.scaleX + 0.1
        camera.scaleY = camera.scaleY + 0.1
    end
end

function updateControls()
	if love.keyboard.isDown("up") then camera.y = camera.y - 2 end
	if love.keyboard.isDown("down") then camera.y = camera.y + 2 end
	if love.keyboard.isDown("left") then camera.x = camera.x - 2 end
	if love.keyboard.isDown("right") then camera.x = camera.x + 2 end

	if love.keyboard.isDown("z") then
		camera.scaleX = camera.scaleX - 0.005
        camera.scaleY = camera.scaleY - 0.005
	elseif love.keyboard.isDown("x") then
		camera.scaleX = camera.scaleX + 0.005
        camera.scaleY = camera.scaleY + 0.005
	end
end
