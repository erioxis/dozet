AddCSLuaFile()

if CLIENT then
	SWEP.ViewModelFlip = false
	SWEP.ViewModelFOV = 70

	SWEP.ShowViewModel = false
	SWEP.ShowWorldModel = false

	SWEP.VElements = {
		["e1"] = { type = "Model", model = "models/hunter/tubes/tube1x1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(1.667, 1.52, 6.953), angle = Angle(-6.71, 180, 180), size = Vector(0.028, 0.028, 0.3), color = Color(21, 54, 106, 255), surpresslightning = false, material = "phoenix_storms/trains/track_beamtop", skin = 0, bodygroup = {} },
		["e1+"] = { type = "Model", model = "models/hunter/tubes/circle4x4.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(-0.008, 0, 14.653), angle = Angle(0, 0, 0), size = Vector(0.012, 0.008, 0.302), color = Color(21, 54, 106, 255), surpresslightning = false, material = "phoenix_storms/trains/track_beamtop", skin = 0, bodygroup = {} },
		["e1++"] = { type = "Model", model = "models/gibs/manhack_gib05.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(2.399, 0.001, 13.118), angle = Angle(-81, 0, -89.999), size = Vector(0.25, 0.284, 2.03), color = Color(21, 54, 106, 255), surpresslightning = false, material = "phoenix_storms/concrete0", skin = 0, bodygroup = {} },
		["e1+++"] = { type = "Model", model = "models/gibs/manhack_gib05.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(-2.359, 0.001, 13.118), angle = Angle(-81.378, 180, -90), size = Vector(0.25, 0.284, 2.03), color = Color(11, 43, 101, 255), surpresslightning = false, material = "phoenix_storms/concrete0", skin = 0, bodygroup = {} },
		["e1++++"] = { type = "Model", model = "models/gibs/manhack_gib05.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(-0.82, 0, 15.352), angle = Angle(-60, 0, 90), size = Vector(0.148, 0.148, 3.257), color = Color(40, 111, 186, 255), surpresslightning = false, material = "phoenix_storms/trains/track_beamtop", skin = 0, bodygroup = {} },
		["e1+++++"] = { type = "Model", model = "models/gibs/manhack_gib05.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(0.827, 0, 15.352), angle = Angle(-60.001, -180, 90), size = Vector(0.148, 0.148, 3.257), color = Color(40, 111, 186, 255), surpresslightning = false, material = "phoenix_storms/trains/track_beamtop", skin = 0, bodygroup = {} },
		["e1++++++"] = { type = "Model", model = "models/gibs/manhack_gib06.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(0.001, 0.433, 15.353), angle = Angle(0, -90, 90), size = Vector(0.071, 0.189, 2.681), color = Color(40, 111, 186, 255), surpresslightning = false, material = "phoenix_storms/trains/track_beamtop", skin = 0, bodygroup = {} },
		["e1+++++++"] = { type = "Model", model = "models/gibs/manhack_gib06.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(0.001, -0.429, 15.353), angle = Angle(0, 90, 90), size = Vector(0.071, 0.189, 2.681), color = Color(40, 111, 186, 255), surpresslightning = false, material = "phoenix_storms/trains/track_beamtop", skin = 0, bodygroup = {} },
		["e1++++++++"] = { type = "Model", model = "models/xqm/jettailpiece1medium.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(-0.703, 0, 31.074), angle = Angle(0, -90, 1.5), size = Vector(0.271, 0.02, 0.502), color = Color(42, 215, 255, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["e1+++++++++"] = { type = "Model", model = "models/xqm/jettailpiece1medium.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(0.271, 0, 31.056), angle = Angle(0, 90, 0), size = Vector(0.271, 0.02, 0.503), color = Color(42, 215, 255, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["e1++++++++++"] = { type = "Model", model = "models/xqm/jettailpiece1medium.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(-0.746, 0, 31.056), angle = Angle(0, -90, 1.5), size = Vector(0.275, 0.021, 0.504), color = Color(231, 252, 254, 255), surpresslightning = false, material = "models/wireframe", skin = 0, bodygroup = {} },
		["e1+++++++++++"] = { type = "Model", model = "models/xqm/jettailpiece1medium.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(0.256, 0, 31.056), angle = Angle(0, 90, 0), size = Vector(0.275, 0.02, 0.504), color = Color(231, 252, 254, 255), surpresslightning = false, material = "models/wireframe", skin = 0, bodygroup = {} },
		["e1++++++++++++"] = { type = "Model", model = "models/props_trainstation/trainstation_ornament002.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(0, 0, 1.009), angle = Angle(0, -180, 180), size = Vector(0.09, 0.09, 0.111), color = Color(21, 54, 106, 255), surpresslightning = false, material = "phoenix_storms/trains/track_beamtop", skin = 0, bodygroup = {} },
		["e1+++++++++++++"] = { type = "Model", model = "models/props_phx/gibs/flakgib1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(-2.123, 0, -1.66), angle = Angle(0, 0, 180), size = Vector(0.182, 0.182, 0.182), color = Color(168, 255, 241, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["e1++++++++++++++"] = { type = "Model", model = "models/props_phx/gibs/flakgib1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(-2.135, 0, -1.659), angle = Angle(0, 0, 180), size = Vector(0.183, 0.183, 0.183), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/wireframe", skin = 0, bodygroup = {} },
		["e1+++++++++++++++"] = { type = "Model", model = "models/xqm/jettailpiece1medium.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(-0.908, 0, 31.056), angle = Angle(0, -90, 1.5), size = Vector(0.273, 0.025, 0.504), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/roller/rollermine_glow", skin = 0, bodygroup = {} },
		["e1++++++++++++++++"] = { type = "Model", model = "models/xqm/jettailpiece1medium.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(-0.908, 0, 24.28), angle = Angle(0, -90, 1.5), size = Vector(0.273, 0.035, 0.53), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/roller/rollermine_glow", skin = 0, bodygroup = {} }
	}
	SWEP.WElements = {
		["e1"] = { type = "Model", model = "models/hunter/tubes/tube1x1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.524, 1.152, 6.953), angle = Angle(-6.71, 180, 180), size = Vector(0.028, 0.028, 0.3), color = Color(21, 54, 106, 255), surpresslightning = false, material = "phoenix_storms/trains/track_beamtop", skin = 0, bodygroup = {} },
		["e1+"] = { type = "Model", model = "models/hunter/tubes/circle4x4.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(-0.008, 0, 14.653), angle = Angle(0, 0, 0), size = Vector(0.012, 0.008, 0.302), color = Color(21, 54, 106, 255), surpresslightning = false, material = "phoenix_storms/trains/track_beamtop", skin = 0, bodygroup = {} },
		["e1++"] = { type = "Model", model = "models/gibs/manhack_gib05.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(2.399, 0.001, 13.118), angle = Angle(-81, 0, -89.999), size = Vector(0.25, 0.284, 2.03), color = Color(21, 54, 106, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["e1+++"] = { type = "Model", model = "models/gibs/manhack_gib05.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(-2.359, 0.001, 13.118), angle = Angle(-81.378, 180, -90), size = Vector(0.25, 0.284, 2.03), color = Color(11, 43, 101, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["e1++++"] = { type = "Model", model = "models/gibs/manhack_gib05.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(-0.82, 0, 15.352), angle = Angle(-60, 0, 90), size = Vector(0.148, 0.148, 3.257), color = Color(21, 54, 106, 255), surpresslightning = false, material = "phoenix_storms/trains/track_beamtop", skin = 0, bodygroup = {} },
		["e1+++++"] = { type = "Model", model = "models/gibs/manhack_gib05.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(0.827, 0, 15.352), angle = Angle(-60.001, -180, 90), size = Vector(0.148, 0.148, 3.257), color = Color(21, 54, 106, 255), surpresslightning = false, material = "phoenix_storms/trains/track_beamtop", skin = 0, bodygroup = {} },
		["e1++++++"] = { type = "Model", model = "models/gibs/manhack_gib06.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(0.001, 0.433, 15.353), angle = Angle(0, -90, 90), size = Vector(0.071, 0.189, 2.681), color = Color(21, 54, 106, 255), surpresslightning = false, material = "phoenix_storms/trains/track_beamtop", skin = 0, bodygroup = {} },
		["e1+++++++"] = { type = "Model", model = "models/gibs/manhack_gib06.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(0.001, -0.429, 15.353), angle = Angle(0, 90, 90), size = Vector(0.071, 0.189, 2.681), color = Color(21, 54, 106, 255), surpresslightning = false, material = "phoenix_storms/trains/track_beamtop", skin = 0, bodygroup = {} },
		["e1++++++++"] = { type = "Model", model = "models/xqm/jettailpiece1medium.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(-0.683, 0.001, 31.056), angle = Angle(0, -90, 1.5), size = Vector(0.271, 0.02, 0.503), color = Color(42, 215, 255, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["e1+++++++++"] = { type = "Model", model = "models/xqm/jettailpiece1medium.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(0.271, 0, 31.056), angle = Angle(0, 90, 0), size = Vector(0.271, 0.02, 0.503), color = Color(42, 215, 255, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["e1++++++++++"] = { type = "Model", model = "models/xqm/jettailpiece1medium.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(-0.681, 0, 31.056), angle = Angle(0, -90, 1.5), size = Vector(0.273, 0.021, 0.504), color = Color(231, 252, 254, 255), surpresslightning = false, material = "models/wireframe", skin = 0, bodygroup = {} },
		["e1+++++++++++"] = { type = "Model", model = "models/xqm/jettailpiece1medium.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(0.271, 0, 31.056), angle = Angle(0, 90, 0), size = Vector(0.272, 0.021, 0.504), color = Color(231, 252, 254, 255), surpresslightning = false, material = "models/wireframe", skin = 0, bodygroup = {} },
		["e1++++++++++++"] = { type = "Model", model = "models/props_trainstation/trainstation_ornament002.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(-0.007, 0, 1.009), angle = Angle(0, -180, 180), size = Vector(0.09, 0.09, 0.111), color = Color(21, 54, 106, 255), surpresslightning = false, material = "phoenix_storms/trains/track_beamtop", skin = 0, bodygroup = {} },
		["e1+++++++++++++"] = { type = "Model", model = "models/props_phx/gibs/flakgib1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(-2.123, 0, -1.66), angle = Angle(0, 0, 180), size = Vector(0.182, 0.182, 0.182), color = Color(168, 255, 241, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["e1++++++++++++++"] = { type = "Model", model = "models/props_phx/gibs/flakgib1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(-2.135, 0, -1.659), angle = Angle(0, 0, 180), size = Vector(0.183, 0.183, 0.183), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/wireframe", skin = 0, bodygroup = {} },
		["e1+++++++++++++++"] = { type = "Model", model = "models/xqm/jettailpiece1medium.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(-0.908, 0, 31.056), angle = Angle(0, -90, 1.5), size = Vector(0.273, 0.025, 0.504), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/roller/rollermine_glow", skin = 0, bodygroup = {} },
		["e1++++++++++++++++"] = { type = "Model", model = "models/xqm/jettailpiece1medium.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(-0.908, 0, 24.28), angle = Angle(0, -90, 1.5), size = Vector(0.273, 0.035, 0.53), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/roller/rollermine_glow", skin = 0, bodygroup = {} },
		["e1+++++++++++++++++"] = { type = "Model", model = "models/hunter/misc/squarecap2x1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(-0.418, 0, 48.457), angle = Angle(0, 90, 0), size = Vector(0.008, 0.009, 0.023), color = Color(42, 215, 255, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["e1++++++++++++++++++"] = { type = "Model", model = "models/hunter/misc/squarecap2x1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(-0.418, 0, 48.457), angle = Angle(0, 90, 0), size = Vector(0.009, 0.009, 0.024), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/wireframe", skin = 0, bodygroup = {} }
	}
	--[[function SWEP:PostDrawViewModel(vm, pl, wep)
		local veles = self.VElements
		local tbl = {}
		for k,v in pairs(self.VElements) do
			local b = string.Explode("",k)
			if b[1] == "e" and b[2] == "1" then
				local clr = Color(veles[k].color.r,veles[k].color.g,veles[k].color.b,0)
				veles[k].color = clr
			end
		end
		if self:GetClip() - 1 <= CurTime() then
			for k,v in pairs(self.VElements) do
				local b = string.Explode("",k)
				if b[1] == "e" and b[2] == "1" then
					local clr = Color(veles[k].color.r,veles[k].color.g,veles[k].color.b,255)
					veles[k].color = clr
				end
			end
		end
	end]]
	
	
end
SWEP.PrintName = translate.Get("wep_ice_nail")
SWEP.Description = translate.Get("wep_d_ice_nail")
function SWEP:PlayHitSound()
	self:EmitSound("physics/glass/glass_bottle_break"..math.random(1,2)..".wav", 1215, self:GetBlockState() and 200 or 2109)
end

function SWEP:PlayHitFleshSound()
	self:EmitSound("physics/body/body_medium_break"..math.random(2, 4)..".wav")
end

SWEP.Base = "weapon_zs_basemelee"

SWEP.HoldType = "melee2"
SWEP.ViewModel = "models/weapons/c_crowbar.mdl"
SWEP.ShowWorldModel = false
SWEP.WorldModel = "models/weapons/w_pistol.mdl"
SWEP.UseHands = true
SWEP.HitDecal = "Manhackcut"

SWEP.MeleeDamage = 112
SWEP.MeleeRange = 77
SWEP.MeleeSize = 1.6
SWEP.Tier = 4


SWEP.AllowQualityWeapons = true

SWEP.WalkSpeed = SPEED_NORMAL

SWEP.Primary.Delay = 0.5
SWEP.Secondary.Delay = 10
SWEP.HitAnim = ACT_VM_MISSCENTER
SWEP.ChargeSpeed = 1000

function SWEP:OnMeleeHit(hitent, hitflesh, tr)
	local ent = tr.Entity
	local owner = self:GetOwner()
	if ent:IsPlayer() and SERVER then
		ent:AttachmentDamage(self.MeleeDamage/1.7/(self:GetBlockState() and 2 or 1), owner, self, SLOWTYPE_COLD)
		if self:GetBlockState() then
			owner:SetVelocity(owner:GetEyeTrace().Normal * 1 + (-owner:GetAngles():Forward()*190))
		end
	end
end
