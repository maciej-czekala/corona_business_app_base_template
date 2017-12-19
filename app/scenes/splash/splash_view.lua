local _w = display.contentWidth
local _h = display.contentHeight

local function View(controler, model)
	-- define group for this view
	local sceneGroup = display.newGroup()

	local bg = display.newRect( sceneGroup, _w*.5, _h*.5, _w, _h )
	
	local title = display.newText( {parent = sceneGroup, text = model:get("title"), x = bg.x, y = bg.y } )
	title:setFillColor( 0 )

	return sceneGroup
end

return View
