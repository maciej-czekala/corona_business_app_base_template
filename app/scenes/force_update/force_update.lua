local scene = {}
local View = require("app.scenes.force_update.force_update_view")

function scene.new(viewGroup, controler, viewControler, params)
--==========================================--
	-------------
	-- Imports
	-------------

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
		app.goBack()
	end


--==========================================--
	--------------
	-- Scene init
	--------------
	function controler.onCreate()
		local splashView = View(controler, model)
		viewGroup:insertScene(splashView)
	end

	function controler.onShow()
		print("splash show")
	end

	function controler.onAndroidBackButtonPressed()
		-- controler.backTouched()
	end
	
	--------------
	-- Clean Scene
	--------------
	function controler.onDestroy()

	end
end

return scene
