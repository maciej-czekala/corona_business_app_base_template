local _w = display.contentWidth
local _h = display.contentHeight
local toPx = ui.screen.toPx


local function View(viewGroup, controler, viewControler, model)
	-- define group for this view
	local sceneGroup = display.newGroup()
	viewGroup:insert(sceneGroup)

	local bg = display.newRect( sceneGroup, _w*.5, _h*.5, _w, _h )
	bg:setFillColor( 1 )

	local statusbar = ui.newStatusbar({parent = sceneGroup}) --, statusBarMode = {isLite = true}
	statusbar.y = statusbar.height*.5
	
	local search_bar = ui.newSearchbar({
		parent = sceneGroup,
        config = {
            -- edittingCallback = function(a,b,c) print(a,b,c) end
        },
        cancel = {
        	text = "cancel",
        	touchCallback = controler.backTouched,
        	color = ui.colors.blue,
        },
        placeholder = {
        	text = "search"
        }
    })

    search_bar:setSubmittedCallback(
    	function(input_value) 
    		controler.submittedCallback(input_value) 
    		search_bar:removeFocus() 
    	end)
    search_bar.x = display.contentWidth*.5
    search_bar.y = statusbar.height + search_bar.height*.5

    function viewControler.setFocus()
    	search_bar.input:setFocus()
    end

     function viewControler.removeFocus()
    	search_bar:removeFocus()
    end


    local function onRowRender(e)
	    local row = e.row
	    -- print(row.params)
	    -- Cache the row "contentWidth" and "contentHeight" because the row bounds can change as children objects are added
	    local rowHeight = row.contentHeight
	    local rowWidth = row.contentWidth

	    
	end

    local tableView = ui.newScrollView(
	    {
	        left = 0,
	        top = statusbar.height + search_bar.height,
	        height = _h - search_bar.height - statusbar.height,
	        width = _w,
	        horizontalScrollDisabled = true,
	        onRowRender = onRowRender,
	  
	        --noLines = true,
	        onRowTouch = controler.play,
	        --listener = scrollListener
	    })

    function viewControler.addItems(items)
    	tableView:removeAllItems()
		for i = 1, #items do
		    tableView:insertItem(
		        {
		            height = tile_setting.config.height,
		            width = tile_setting.config.width,
		            params = items[i]
		        }
		    )
		end

		tableView:updateScrollSize()
	end

	function viewControler.showNoResultsInfo()
    	tableView:removeAllItems()
		ui.removeNoData("no_data")
    	

		local no_data = ui.newNoData({
			parent = sceneGroup,
			tag = "no_data",
			title = {
				text = "No search results."
			},
			description = {
				text = "Try to look for something else."
			}
		})
	    no_data.x = _w*.5
	    no_data.y = _h*.5
	end

	function viewControler.hideNoResultsInfo()
		ui.removeNoData("no_data")
	end
	
	sceneGroup:insert(tableView)


	function viewControler.showLoader()
		local loader = ui.newLoader({
			parent = sceneGroup,
			tag = "list_loader", 
			config = {
				x = _w*.5, 
				y = _h*.5
			}
		})
	end

	function viewControler.hideLoader()
		ui.removeLoader("list_loader")
	end
	

	return sceneGroup
end

return View
