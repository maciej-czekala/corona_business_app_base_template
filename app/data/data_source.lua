local class = {}

local list = {
}	

function class:getRandomItem()
	return list[math.random(#list)]
end

return class