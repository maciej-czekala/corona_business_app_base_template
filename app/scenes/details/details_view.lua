local _w = display.contentWidth
local _h = display.contentHeight

local function View(controler, model)
	-- define group for this view
	local sceneGroup = display.newGroup()

	local bg = display.newRect( sceneGroup, _w*.5, _h*.5, _w, _h )
	
	-- display object in our view
	local title = display.newText( { text = model.get("title"), width = 200} )
	title:setFillColor( 1,0,0 )
	title.x = _w*.5
	title.y = _h*.5
	sceneGroup:insert(title)

	-- touch listener
	title:addEventListener( "tap", 
		function()
			-- call controler to return functional logic to controler
			controler.backCallback()
		end )

	-- return shole group
	return sceneGroup
end

return View
