local _w = display.contentWidth
local _h = display.contentHeight

local function View(controler, model)
	-- define group for this view
	local sceneGroup = display.newGroup()

	local bg = display.newRect( sceneGroup, _w*.5, _h*.5, _w, _h )

	local title = display.newText( {parent = sceneGroup, text = model:get("title"), x = bg.x, y = 100} )
	title:setFillColor( 0 )

	local count = display.newText( {parent = sceneGroup, text = model:get("count"), x = bg.x, y = 150} )
	count:setFillColor( 0 )

	local is_active = display.newText( {parent = sceneGroup, text = tostring(model:get("is_active")), x = bg.x, y = 200} )
	is_active:setFillColor( 0 )


	-- set binding to model item to recieve callback if model item is updated
	model:setBinding("count",
		function(value)
			count.text = value
		end)

	model:setBinding("is_active",
		function(value)
			is_active.text = tostring(value)
		end)

	title:addEventListener( "tap", controler.titleTextTapped )

	count:addEventListener( "tap", controler.countTextTapped )

	is_active:addEventListener( "tap", controler.isActiveTextTapped )


	return sceneGroup
end

return View
