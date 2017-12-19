local fragment = {}
local View = require("app.fragments.test_1.test_1_view")
local data_source = require("app.data.data_source")

local _w = display.contentWidth
local _h = display.contentHeight
function fragment.new(fragmentGroup, controler, viewControler, params)
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

	------------
	-- Scene functions declaration
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
    	local view = View(controler, model)
		fragmentGroup:insert(view)
	end

	--------------
	-- Clean Scene
	--------------
	function controler.onDestroy()

	end
end

return fragment
