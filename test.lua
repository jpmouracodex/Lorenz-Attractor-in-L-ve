

function load()


	dt = 0.0001

	a = 10.0
	b = 28.0
	c = 8.0/3.0

	x = 0.01
	y = 0
	z = 0

	points = {}

end

function update()

	local dx = (a * (y - x)) * dt
	local dy = (x * (b - z) - y) * dt
	local dz = (x * y - c * z) * dt

	x = x + dx
	y = y + dy
	z = z + dz

	print(x, y, z)



end


load()

while true do
	update()
end
