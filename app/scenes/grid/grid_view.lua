local _w = display.contentWidth
local _h = display.contentHeight

local function View(viewGroup, controler, model)
	-- define group for this view

	local bg = display.newImageRect(viewGroup, "images/bg.jpg", _w, _h )
	bg.x = _w*.5
	bg.y = _h*.5

	local statusbar = ui.newStatusbar({parent = viewGroup} )
	statusbar.y = statusbar.height*.5

	local navBar = ui.newNavbar({
		title = "Grid usage example", 
		buttons = {
			left = {config = {style = "back", touchCallback = controler.goBack }}
        } 
    })
    navBar.x = display.contentWidth*.5
	navBar.y = statusbar.height + navBar.height*.5
	viewGroup:insert(navBar)


	------------
	------------

	local gridPanel = ui.newGridPanel({
		x = _w*.5, 
		y = _h*.5 + statusbar.height*.5 + navBar.height*.5, 
		width = _w, 
		height = _h - (statusbar.height + navBar.height), 
		columns = {"*","*","*", 20,"50"}, -- "*" = equal size, number (1, 2, 3) = pixels, number as a string "50" = percent
		rows = {"*","*","*", 20}, 
		debug = true})
	viewGroup:insert(gridPanel)

	local testItem = display.newRect( 0, 0, 20, 20 )
	testItem:setFillColor( 1,0,0 )
	testItem.grid = {row = 1, column = 1} -- define where item should go with this table
	-- testItem.cellId = "1_1" -- alternative definition can be done with cellId and string

	gridPanel:insert(testItem) -- when item is defined, inser it into gridPanel.

end

return View
