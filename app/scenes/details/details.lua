local scene = {}
local View = require("app.scenes.details.details_view")
local x = 0
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


	local _devide_info = ""
	for k,v in pairs(app.deviceUtil) do
		_devide_info = _devide_info .. k .. " / " .. tostring(v) .. "\n"
	end
	-- set value for model item
	model.set("title", _devide_info)

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
	function controler.backCallback()
		app.goBack()
	end


--==========================================--
	--------------
	-- Scene init
	--------------
	function controler.onCreate()
		-- print("splash created")
		local view = View(controler, model)
		viewGroup:insertScene(view)

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
