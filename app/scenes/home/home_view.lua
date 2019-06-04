local _w = display.contentWidth
local _h = display.contentHeight
local toPx = ui.screen.toPx

local function onRowRender(e)
    local row = e.row

    -- Cache the row "contentWidth" and "contentHeight" because the row bounds can change as children objects are added
    local rowHeight = row.contentHeight
    local rowWidth = row.contentWidth
    local tile = ui.newRow({
		config = { 
			y = 0, 
			x = 0,
			-- color = {1,0,0}
		},
		title = {
			text = row.data.title,
			isActive = true
		},
	 })

    row:insert(tile)
end

local function View(viewGroup, controler, viewControler, config)
	-- define group for this view
	local bg = display.newRect( viewGroup, _w*.5, _h*.5, _w, _h )

	local statusbar = ui.newStatusbar({parent = viewGroup })
	statusbar.y = statusbar.height*.5

	local navBar = ui.newNavbar({
		title = "title",
		image = {fileName = "images/app_logo.png", width = toPx(86), height = toPx(38) },
    })
    navBar.x = display.contentWidth*.5
	navBar.y = statusbar.height + navBar.height*.5
	viewGroup:insert(navBar)

	navBar:toFront()

	local tile_setting = ui.getRowSettings()

	local tableView = ui.newScrollView(
	    {
	        left = 0,
	        top = statusbar.height + navBar.height,
	        height = display.contentHeight - statusbar.height - navBar.height,
	        width = _w,
	        horizontalScrollDisabled = true,
	        -- columns = 1,
	        verticalSpacing = toPx(8),
	        onRowRender = onRowRender,
	        onRowTouch = controler.onRowTouch,
	        -- renderSpeed = 100,
	        --listener = scrollListener
	    })



	function viewControler.addItems(items)
		for i = 1, #items do
			print(i, tile_setting.config.height)
		    tableView:insertItem(
		        {
		            height = tile_setting.config.height,
		            width = _w,
		            data = items[i],
		            params = {}
		        }
		    )
		end

		tableView:updateScrollSize()
	end

	viewGroup:insert(tableView)
end

return View
