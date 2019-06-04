local scene = {}
local config = {
	register_is_visible = false,
	recover_password_is_visible = false,
	register_url = "",
	recover_password_url = "",

}

function scene.new(viewGroup, controler, viewControler, params)
--==========================================--
	-------------
	-- Imports
	-------------
	-- declair model with set of items

	-------------
	-- Scene helpers
	-------------


	------------
	-- Scene variables and settings
	------------

--==========================================--

	------------
	--Functions
	------------ 
	function controler.backTouched()
		app.goBack({params = params})
	end


	function controler.login(a)
		if a.login == "" and a.password == "" then
			-- -- show info to end user about not all data is typed in
		else
			-- viewControler.showLoader()

			-- api.call
			-- onSuccess
			-- -- viewControler.hideLoader()
			-- -- app.goTo("home")
			-- onError
			-- -- viewControler.hideLoader()
			-- -- show info to end user about error
		end
	end


	function controler.registerTouchCallback()
		system.openURL( config.register_url )
	end

	function controler.recoveryTouchCallback()
		system.openURL( config.recover_password_url )
	end


--==========================================--
	--------------
	-- Scene init
	--------------
	function controler.onCreate()
		require(params.viewFilePath)(viewGroup, controler, viewControler, config)
	end

	function controler.onShow()
		print("login screen - show")
	end

	function controler.onAndroidBackButtonPressed()
		controler.backTouched()
	end

	function controler.onHardwareButtonPressed(key)
		if key == "back" then
			controler.backTouched()
		else
			viewControler.remote(key)
		end
	end

	--------------
	-- Clean Scene
	--------------
	function controler.onDestroy()

	end
end

-- configure this scene before it is rendered. To have one template for many scenarios
function scene.set(a)
	if a then
		if a.register_is_visible then
			config.register_is_visible = true
		end
		if a.recover_password_is_visible then
			config.recover_password_is_visible = true
		end
		if a.recover_password_url then
			config.recover_password_url = a.recover_password_url
		end
		if a.register_url then
			config.register_url = a.register_url
		end
	end
end

return scene
