local _w = display.contentWidth
local _h = display.contentHeight
local toPx = ui.screen.toPx


local function View(controler, model)
	-- define group for this view
	local sceneGroup = display.newGroup()

	local bg = display.newRect( sceneGroup, _w*.5, _h*.5, _w, _h )
	
	local statusbar = ui.newStatusbar({parent = sceneGroup, statusBarMode = {isLite = true}})
	statusbar.y = statusbar.height*.5

	local navBar = ui.newNavbar({
		title = "Update required",
    })
    navBar.x = _w*.5
	navBar.y = statusbar.height + navBar.height*.5
	sceneGroup:insert(navBar)

	local no_data = ui.newNoData({
		parent = sceneGroup,
		tag = "update",
		title = {
			text = "Sorry but your app needs to be updated."
		},
		description = {
			text = "Update your app to continue using. Thank you."
		},
		image = {
			fileName = "images/update_icon.png"
		}
	})
    no_data.x = _w*.5
    no_data.y = _h*.5

	return sceneGroup
end

return View
