local _w = display.contentWidth
local _h = display.contentHeight

local function View(viewGroup, controler, viewControler, model)
	-- define group for this view


	local bg = display.newRect( viewGroup, _w*.5, _h*.5, _w, _h )
	bg:setFillColor( 1 )

	local logo = display.newImageRect( viewGroup, "images/app_logo.png", ui.screen.toPx(100), ui.screen.toPx(22) )
	logo.x = _w*.5
	logo.y = _h*.5

	local version = display.newText( {parent = viewGroup, text = model.get("title"), x = _w*.5, y = _h - 20, fontSize = 10 } )
	version:setFillColor( .2, .2, .2 )

end

return View
