local scene = {}

function scene.new(viewGroup, controler, viewControler, params)
--==========================================--
	-------------
	-- Imports
	-------------
	-- declair model with set of items
	local model = app.Model(
		{
			items = "table"
		})

	-- set value for model item

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
		viewControler.removeFocus()
		app.goBack({effect = "fade", time = 200})
	end


	function controler.submittedCallback(query)
		if query and query ~= "" then
			viewControler.showLoader()
			viewControler.hideNoResultsInfo()
			-- todo get data from API
			
		end		
	end

	function controler.onRowTouch(e)
		if e.target.isRow then
			-- app.goTo("asset",{params = { } })
		end
	end


--==========================================--
	--------------
	-- Scene init
	--------------
	function controler.onCreate()
		require(params.viewFilePath)(viewGroup, controler, viewControler, model)
	end

	function controler.onShow()

	end

	function controler.onAndroidBackButtonPressed()
	
	end

	--------------
	-- Clean Scene
	--------------
	function controler.onDestroy()

	end
end

return scene
