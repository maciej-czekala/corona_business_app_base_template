local _w = display.contentWidth
local _h = display.contentHeight

local function View(controler, model)
	-- define group for this view
	local sceneGroup = ui.newStackPanel()--display.newGroup()
	sceneGroup.x = _w*.5
	
	local title = display.newText({text = "skyjoy software"} )
	title.dock = {left = true}
	title.padding = {left = 8, top = 8}
    title:setFillColor( 0 )
    sceneGroup:insert(title)



	return sceneGroup
end

return View
