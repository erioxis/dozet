GM.WorldConversions = {}
GM.StarterTrinkets = {
	"trinket_armband",
	"trinket_condiments",
	"trinket_emanual",
	"trinket_aimaid",
	"trinket_vitamins",
	"trinket_welfare",
	"trinket_chemistry"
	
}
GM.GetActiveTrinkets = {
	"cons_pill_unk",
	"cons_void",
	"cons_mantle",
	"cons_necronomicon",
	"cons_chaos",
	"cons_d4",
	"cons_friendship",
	"cons_timer"
}
GM.StarterSoul = {
	"trinket_bleaksoul",  -- 1
	"trinket_spiritess",  -- 2
	"trinket_samsonsoul",  -- 3
	"trinket_evesoul",  -- 4
    "trinket_jacobjesausoul",  -- 5
    "trinket_isaacsoul",  -- 6
    "trinket_magdalenesoul",  -- 7
    "trinket_lilithsoul",  -- 8
    "trinket_whysoul",  -- 9
    "trinket_blanksoul", -- 10
    "trinket_classixsoul",  -- 11
	"trinket_darksoul",  --12
	"trinket_eriosoul",  --13
	"trinket_aposoul",  --14
	"trinket_betsoul",  --15
	"trinket_lostsoul",  --16
	"trinket_greedsoul",  --17
	"trinket_cainsoul",   --18
	"trinket_lazarussoul",	-- 19
	"trinket_forsoul",  -- 20
	"trinket_starsoul",  -- 21
	"trinket_teasoul",  -- 22
	"trinket_sugersoul", -- 23
	"trinket_nulledsoul"  -- 24
}
GM.Via = {
	"trinket_via",
	"trinket_via1",
	"trinket_via2",
	"trinket_via3"
}
GM.Curses = {
	"trinket_curse_dropping",
	"trinket_hurt_curse",
	"trinket_un_curse",
	"trinket_curse_faster",
	"trinket_curse_slow",
	"trinket_curse_ponos",
	"trinket_curse_heart",
	"trinket_curse_unknown"

}
GM.MedPremium = {
	"trinket_pr_gold",
	"trinket_pr_barapaw",
	"trinket_pr_chamomile",
	"trinket_pr_bloodpack",
	"trinket_soulmedical"
}



function GM:AddWorldPropConversionRecipe(model, result)
	local datatab = {Result = result, Index = wcindex}
	self.WorldConversions[model] = datatab
	self.WorldConversions[#self.WorldConversions + 1] = datatab
end

GM:AddWorldPropConversionRecipe("models/props_combine/breenbust.mdl", 		"comp_busthead")
GM:AddWorldPropConversionRecipe("models/props_junk/sawblade001a.mdl", 		"comp_sawblade")
GM:AddWorldPropConversionRecipe("models/props_junk/propane_tank001a.mdl", 	"comp_propanecan")
GM:AddWorldPropConversionRecipe("models/items/car_battery01.mdl", 			"comp_electrobattery")
GM:AddWorldPropConversionRecipe("models/props_lab/reciever01b.mdl", 		"comp_reciever")
GM:AddWorldPropConversionRecipe("models/props_lab/harddrive01.mdl", 		"comp_cpuparts")
