local Point = {}
	
	function Point:new(x, y, z)
		local point = {}
		point.x = x
		point.y = y
		point.z = z
		return point
	end


return Point