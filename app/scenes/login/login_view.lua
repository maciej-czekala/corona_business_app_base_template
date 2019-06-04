local _w = display.contentWidth
local _h = display.contentHeight
local toPx = ui.screen.toPx

local function View(viewGroup, controler, viewControler, config)
	-- define group for this view
	local sceneGroup = display.newGroup()

	local bg = display.newImageRect(sceneGroup, "images/bg.jpg", _w, _h )
	bg.x = _w*.5
	bg.y = _h*.5
	
	local statusbar = ui.newStatusbar({parent = sceneGroup} )
	statusbar.y = statusbar.height*.5

	local navBar = ui.newNavbar({
		title = "Login screen", 
		buttons = {
			left = {config = {style = "back", touchCallback = controler.backTouched }}
        } 
    })
    navBar.x = display.contentWidth*.5
	navBar.y = statusbar.height + navBar.height*.5
	sceneGroup:insert(navBar)
	
	----------------
	local _width = _w - toPx(60)

	local stackPanel = ui.newStackPanel({
		y = navBar.y + navBar.height*.5,
		x = _w*.5,
		spacing = toPx(12)
		})
	sceneGroup:insert(stackPanel)


	if ui.device.getOrientation() == "portrait" then
		local logo = display.newImageRect(sceneGroup, "images/app_logo.png", ui.screen.toPx(100), ui.screen.toPx(22) )
		logo.padding = {top = toPx(8)}
		stackPanel:insert(logo)
	end

	local function adjustInputY()
		if _h < toPx(700) then
			-- transition.to( stackPanel, {time = 250, y = -toPx(70)} )
		end
	end

	local function resetInputY()
		if _h < toPx(700) then
			-- transition.to( stackPanel, {time = 250, y = 0} )
		end
	end

	local i_login = ui.newInput({
		config = {
			width = _width,
			maxWidth = toPx(380),
			beganCallback = adjustInputY,
			inputType = "email",
		},
		background = {
	    	strokeWidth = 0
	    },
		placeholder = {
			text = "login"
		}
	})

	local i_password = ui.newInput({
	    config = {
	        isSecure = true, 
	        width = _width,
	        maxWidth = toPx(380),
	        beganCallback = adjustInputY,
	        -- height = toPx(40),
	    },
	    background = {
	    	strokeWidth = 0
	    },
	    placeholder = {
	        text = "password"
	    }
	})
	stackPanel:insert(i_login)
	stackPanel:insert(i_password)

	i_login:setSubmittedCallback(function() i_password:setFocus() end)
	i_password:setSubmittedCallback(function() i_password:removeFocus() resetInputY()  end)

	local btn_login = ui.newButton({
		config = { 
			style = "flat_fill",
			color = ui.colors.blue,
			width = _width,
			maxWidth = toPx(380),
			touchCallback = function()
				resetInputY()
				controler.login( { login = i_login:getValue(), password = i_password:getValue() } )
			end }, 
		label = {
			text = "login"
		}
		})
	btn_login.padding = {top = toPx(8)}
	stackPanel:insert(btn_login)

	if config.recover_password_is_visible then
		local btn_goto_recovery = ui.newButton({
			parent = stackPanel, 
			config = { 
				touchCallback = controler.recoveryTouchCallback }, 
				label = {
					text = "password recovery"
				}
			})
	end

	----- EXTRA
	if config.register_is_visible then
		local register_info = display.newText( {text = "don't have an account? ",
			fontSize = toPx(18)} )
		register_info:setFillColor( .4,.4,.4 )
		register_info.padding = {top = toPx(20)}
		stackPanel:insert(register_info)

		local btn_goto_register = ui.newButton({
			parent = stackPanel, 
			config = { 
				touchCallback = controler.registerTouchCallback }, 
				label = {
					text = "register"
				}
			})
	end

	function viewControler.showLoader()
		app.lockUi(true)
		local loader = ui.newLoader({parent = sceneGroup, tag = "list_loader",
			config = {
				x = _w *.5, 
				y = _h *.4
			}})
	end

	function viewControler.hideLoader()
		app.lockUi(false)
		ui.removeLoader("list_loader")
	end

	viewGroup:insertScene(sceneGroup)
end

return View
