local scene = {}
local View = require("app.scenes.home.home_view")
function scene.new(viewGroup, controler, viewControler, params)
--==========================================--
	-------------
	-- Imports
	-------------
	-- declair model with set of items
	local model = app:Model(
		{
			title = "string",
			count = "number",
			is_active = "boolean"
		})

	-- set value for model item
	model:set("title", "SPLASH")
	model:set("count", 0)
	model:set("is_active", true)
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
	function controler.titleTextTapped()
		app:goTo("details")
	end

	-- controler function for touch callback
	function controler.countTextTapped()
		-- get value from model and then set new value to model item
		local _count = model:get("count")
		_count = _count + 1
		model:set("count", _count)
		
		-- or use this 
		-- model:add("count", 1)
	end

	function controler.isActiveTextTapped()
		-- get value from model and then set new value to model item
		local _is_active = model:get("is_active")
		if _is_active == true then
			model:set("is_active", false)
		else
			model:set("is_active", true)
		end
	end


--==========================================--
	--------------
	-- Scene init
	--------------
	function controler.onCreate()
		print("splash created")
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
		model:removeBinding("count")
		model:removeBinding("is_active")
	end
end

return scene
