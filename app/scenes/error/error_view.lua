local _w = display.contentWidth
local _h = display.contentHeight

local function View(controler, model)
	-- define group for this view
	local sceneGroup = display.newGroup()

	local bg = display.newImageRect(sceneGroup, "custom/images/bg.jpg", _w, _h )
	bg.x = _w*.5
	bg.y = _h*.5
	

	local no_data = ui.newNoData({
			parent = sceneGroup,
			tag = "error",
			image = {
				isActive = false
			},
			title = {
				text = app.strings.getKey("screen_error_title")
			},
			description = {
				text = app.strings.getKey("screen_error_description")
			},
			button = {
				config = {
					style = "flat",
					touchCallback = controler.goBack
				},
				label = {
					text = app.strings.getKey("screen_error_button")
				},
				isActive = true
			}
		})
	    no_data.x = display.contentWidth*.5
	    no_data.y = display.contentHeight*.5

	return sceneGroup
end

return View
