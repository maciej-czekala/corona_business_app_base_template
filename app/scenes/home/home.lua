local scene = {}

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
	function controler.onRowTouch(e)
		app.goTo(e.target.data.scene)
	end

--==========================================--
	--------------
	-- Scene init
	--------------
	function controler.onCreate()
		require(params.viewFilePath)(viewGroup, controler, viewControler, config)

		viewControler.addItems({
				{title = "Splash screen", scene = "splash" },
				{title = "Login screen", scene = "login"},
				{title = "Force app update", scene = "force_update"},
				{title = "Search", scene = "search"},
				{title = "Grid", scene = "grid"},


			})
	end

	function controler.onShow()

	end

	--------------
	-- Clean Scene
	--------------
	function controler.onDestroy()

	end
end

return scene
