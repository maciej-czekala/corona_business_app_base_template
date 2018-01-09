-- 
-- Abstract: app_framework Library Plugin Test Project
-- 
-- Sample code is MIT licensed, see http://www.coronalabs.com/links/code/license
-- Copyright (C) 2015 Corona Labs Inc. All Rights Reserved.
--
------------------------------------------------------------
display.setDefault( "background", 1, 1, 1 )
app = require ("plugin.app_framework")
app.init()
app.goTo("splash", {effect = "none"})

-- ui =  require ("plugin.ui_framework")
-- ui:init()

