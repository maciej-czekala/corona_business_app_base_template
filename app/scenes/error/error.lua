local scene = {}
local View = require("app.scenes.error.error_view")

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
	function controler.goBack()
		app.goBack({params = params})
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

	--------------
	-- Clean Scene
	--------------
	function controler.onDestroy()

	end

	function controler.onAndroidBackButtonPressed()
		controler.goBack()
	end

	function controler.onHardwareButtonPressed(key)
		controler.goBack()
	end
end

return scene
