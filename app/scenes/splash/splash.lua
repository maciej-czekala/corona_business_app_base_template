local scene = {}
local View = require("app.scenes.splash.splash_view")

function scene.new(viewGroup, controler, viewControler, params)
--==========================================--
	-------------
	-- Imports
	-------------
	-- declair model with set of items
	local model = app.Model(
		{
			title = "string"
		})

	-- set value for model item
	model.set("title", "SPLASH")

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



--==========================================--
	--------------
	-- Scene init
	--------------
	function controler.onCreate()
		print("splash created")
		local splashView = View(controler, model)
		viewGroup:insertScene(splashView)

		timer.performWithDelay( 1000, 
			function()
				app.goTo("home")
			end)
	end

	function controler.onShow()
		print("splash show")
	end

	--------------
	-- Clean Scene
	--------------
	function controler.onDestroy()

	end
end

return scene
