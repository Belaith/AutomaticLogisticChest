﻿data:extend({
	{
		type = "int-setting",
		name = "AutomaticLogisticChest-BuffertimeRequester",
		setting_type = "runtime-global",
		default_value = 10,
		minimum_value = 0,
		maximum_value = 3600,
	},
	{
		type = "int-setting",
		name = "AutomaticLogisticChest-BuffertimeProvider",
		setting_type = "runtime-global",
		default_value = 10,
		minimum_value = 0,
		maximum_value = 3600,
	},
	{
      type = "string-setting",
      name = "AutomaticLogisticChest-ConnectionType",
      setting_type = "runtime-global",
      default_value = "RedCable",
      allowed_values = {"RedCable", "GreenCable", "Logistic"},
   },
	{
      type = "bool-setting",
      name = "AutomaticLogisticChest-OverrideExisting",
      setting_type = "runtime-global",
      default_value = true,
   },
	{
      type = "string-setting",
      name = "AutomaticLogisticChest-BuildOn",
      setting_type = "runtime-global",
      default_value = "Both",
      allowed_values = {"Both", "Manual", "Bot"},
   }
})

--[[
Types of settings:
	• startup - game must be restarted if changed (such a setting may affect prototypes' changes)
	• runtime-global - per-world setting
	• runtime-per-user - per-user setting

Types of values:
	• bool-setting
	• double-setting
	• int-setting
	• string-setting

Files being processed by the game:
	• settings.lua
	• settings-updates.lua
	• settings-final-fixes.lua
	
Using in DATA.lua:
data:extend({
   {
      type = "int-setting",
      name = "setting-name1",
      setting_type = "runtime-per-user",
      default_value = 25,
      minimum_value = -20,
      maximum_value = 100,
      per_user = true,
   },
   {
      type = "bool-setting",
      name = "setting-name2",
      setting_type = "runtime-per-user",
      default_value = true,
      per_user = true,
   },
   {
      type = "double-setting",
      name = "setting-name3",
      setting_type = "runtime-per-user",
      default_value = -23,
      per_user = true,
   },
   {
      type = "string-setting",
      name = "setting-name4",
      setting_type = "runtime-per-user",
      default_value = "Hello",
      allowed_values = {"Hello", "foo", "bar"},
      per_user = true,
   },
})

Using in LOCALE.cfg:
	[mod-setting-name]
	setting-name1=Seting name
	[mod-setting-description]
	setting-name1=Seting description

Using in CONTROL.lua and in other code for reading:
	EVENT: on_runtime_mod_setting_changed - called when a player changed its setting
		event.player_index
		event.setting
	GET: settings.startup["setting-name"].value - current value of startup setting; can be used in DATA.lua
	GET: settings.global["setting-name"].value - current value of per-world setting
	GET: set = settings.get_player_settings(LuaPlayer) - current values for per-player settings; then use set["setting-name"].value
	GET: settings.player - default values
]]