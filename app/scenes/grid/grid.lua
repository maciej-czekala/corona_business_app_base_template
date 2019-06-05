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
	function controler.goBack()
		app.goBack({params = params})
	end


--==========================================--
	--------------
	-- Scene init
	--------------
	function controler.onCreate()
		require(params.viewFilePath)(viewGroup, controler, viewControler)
	end

	function controler.onShow()

	end

	--------------
	-- Clean Scene
	--------------
	function controler.onDestroy()

	end

	function controler.onAndroidBackButtonPressed()
		controler.goBack()
	end
end

return scene
