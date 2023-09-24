AddCSLuaFile()
DEFINE_BASECLASS("weapon_zs_basemelee")
SWEP.PrintName = translate.Get("wep_dubin")
SWEP.Description = translate.Get("wep_d_dubin")
if CLIENT then
	SWEP.ViewModelFOV = 65
	SWEP.ViewModelFlip = false
	SWEP.HUD3DScale = 0.015

	SWEP.ShowViewModel = false
	SWEP.ShowWorldModel = false
	SWEP.ViewModelBoneMods = {}
	
	
	SWEP.IronSightsPos = Vector(-0.28, 0, 0.28)
	SWEP.IronSightsAng = Vector(0, 0, 0)
	
	SWEP.VElements = {
		["e1"] = { type = "Model", model = "models/hunter/tubes/tube4x4x8.mdl", bone = "RW_Weapon", rel = "", pos = Vector(0, 0.001, -7.214), angle = Angle(0, 0, 0), size = Vector(0.009, 0.009, 0.073), color = Color(253, 255, 254, 255), surpresslightning = false, material = "models/weapons/v_crowbar/crowbar_cyl", skin = 0, bodygroup = {} },
		["e1+"] = { type = "Model", model = "models/hunter/tubes/circle2x2.mdl", bone = "RW_Weapon", rel = "e1", pos = Vector(0, -0.002, 13.618), angle = Angle(0, 0, 0), size = Vector(0.022, 0.022, 0.254), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_vents/borealis_vent001c", skin = 0, bodygroup = {} },
		["e1++"] = { type = "Model", model = "models/mechanics/robotics/xfoot.mdl", bone = "RW_Weapon", rel = "e1", pos = Vector(0, -0.001, -15.465), angle = Angle(0, 0, -180), size = Vector(0.065, 0.065, 0.141), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_vents/borealis_vent001c", skin = 0, bodygroup = {} },
		["e1+++"] = { type = "Model", model = "models/hunter/geometric/pent1x1.mdl", bone = "RW_Weapon", rel = "e1", pos = Vector(0, 0, 14.263), angle = Angle(0, 0, -180), size = Vector(0.042, 0.042, 0.193), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_vents/borealis_vent001c", skin = 0, bodygroup = {} },
		["e1++++"] = { type = "Model", model = "models/hunter/geometric/pent1x1.mdl", bone = "RW_Weapon", rel = "e1", pos = Vector(0, 0, 15.993), angle = Angle(0, 0, -180), size = Vector(0.042, 0.042, 0.954), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props/CS_militia/roofbeams03", skin = 0, bodygroup = {} },
		["e1+++++"] = { type = "Model", model = "models/hunter/geometric/pent1x1.mdl", bone = "RW_Weapon", rel = "e1", pos = Vector(0, 0, 18.839), angle = Angle(0, 0, -180), size = Vector(0.042, 0.042, 0.954), color = Color(254, 255, 253, 255), surpresslightning = false, material = "models/props/CS_militia/roofbeams03", skin = 0, bodygroup = {} },
		["e1++++++"] = { type = "Model", model = "models/hunter/geometric/pent1x1.mdl", bone = "RW_Weapon", rel = "e1", pos = Vector(0, 0, 21.707), angle = Angle(0, 0, -180), size = Vector(0.042, 0.042, 0.954), color = Color(254, 255, 253, 255), surpresslightning = false, material = "models/props/CS_militia/roofbeams02", skin = 0, bodygroup = {} },
		["e1+++++++"] = { type = "Model", model = "models/hunter/geometric/pent1x1.mdl", bone = "RW_Weapon", rel = "e1", pos = Vector(0, 0, 24.576), angle = Angle(0, 0, 180), size = Vector(0.042, 0.042, 0.954), color = Color(254, 255, 253, 255), surpresslightning = false, material = "models/props/CS_militia/roofbeams01", skin = 0, bodygroup = {} },
		["e1++++++++"] = { type = "Model", model = "models/hunter/geometric/pent1x1.mdl", bone = "RW_Weapon", rel = "e1", pos = Vector(0, 0, 27.415), angle = Angle(0, 0, 180), size = Vector(0.042, 0.042, 0.954), color = Color(254, 255, 253, 255), surpresslightning = false, material = "models/props/CS_militia/roofbeams03", skin = 0, bodygroup = {} },
		["e1+++++++++"] = { type = "Model", model = "models/hunter/geometric/pent1x1.mdl", bone = "RW_Weapon", rel = "e1", pos = Vector(0, 0, 35.985), angle = Angle(0, 0, 180), size = Vector(0.042, 0.042, 0.954), color = Color(254, 255, 253, 255), surpresslightning = false, material = "models/props/CS_militia/roofbeams01", skin = 0, bodygroup = {} },
		["e1++++++++++"] = { type = "Model", model = "models/hunter/geometric/pent1x1.mdl", bone = "RW_Weapon", rel = "e1", pos = Vector(0, 0, 30.284), angle = Angle(0, 0, 180), size = Vector(0.042, 0.042, 0.954), color = Color(254, 255, 253, 255), surpresslightning = false, material = "models/props/CS_militia/roofbeams01", skin = 0, bodygroup = {} },
		["e1+++++++++++"] = { type = "Model", model = "models/hunter/geometric/pent1x1.mdl", bone = "RW_Weapon", rel = "e1", pos = Vector(0, 0, 33.132), angle = Angle(0, 0, 180), size = Vector(0.042, 0.042, 0.954), color = Color(254, 255, 253, 255), surpresslightning = false, material = "models/props/CS_militia/roofbeams01", skin = 0, bodygroup = {} },
		["e1++++++++++++"] = { type = "Model", model = "models/hunter/geometric/pent1x1.mdl", bone = "RW_Weapon", rel = "e1", pos = Vector(0, 0, 41.673), angle = Angle(0, 0, 180), size = Vector(0.042, 0.042, 0.954), color = Color(254, 255, 253, 255), surpresslightning = false, material = "models/props/CS_militia/roofbeams01", skin = 0, bodygroup = {} },
		["e1+++++++++++++"] = { type = "Model", model = "models/hunter/geometric/pent1x1.mdl", bone = "RW_Weapon", rel = "e1", pos = Vector(0, 0, 38.832), angle = Angle(0, 0, 180), size = Vector(0.042, 0.042, 0.954), color = Color(254, 255, 253, 255), surpresslightning = false, material = "models/props/CS_militia/roofbeams01", skin = 0, bodygroup = {} },
		["e1++++++++++++++"] = { type = "Model", model = "models/hunter/geometric/pent1x1.mdl", bone = "RW_Weapon", rel = "e1", pos = Vector(0, 0, 44.483), angle = Angle(0, 0, 180), size = Vector(0.042, 0.042, 0.954), color = Color(254, 255, 253, 255), surpresslightning = false, material = "models/props/CS_militia/roofbeams01", skin = 0, bodygroup = {} },
		["e1+++++++++++++++"] = { type = "Model", model = "models/hunter/geometric/pent1x1.mdl", bone = "RW_Weapon", rel = "e1", pos = Vector(0, 0, 47.322), angle = Angle(0, 0, 180), size = Vector(0.042, 0.042, 0.954), color = Color(254, 255, 253, 255), surpresslightning = false, material = "models/props/CS_militia/roofbeams01", skin = 0, bodygroup = {} },
		["e1++++++++++++++++"] = { type = "Model", model = "models/hunter/geometric/pent1x1.mdl", bone = "RW_Weapon", rel = "e1", pos = Vector(0, 0, 49.023), angle = Angle(0, 0, -180), size = Vector(0.042, 0.042, 0.193), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_vents/borealis_vent001c", skin = 0, bodygroup = {} },
		["e1+++++++++++++++++"] = { type = "Model", model = "models/mechanics/wheels/wheel_extruded_48.mdl", bone = "RW_Weapon", rel = "e1", pos = Vector(0, 0, 49.832), angle = Angle(0, 0, 0), size = Vector(0.05, 0.05, 0.159), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_vents/borealis_vent001c", skin = 0, bodygroup = {} },
		["e1++++++++++++++++++"] = { type = "Model", model = "models/props/de_dust/dustteeth_7.mdl", bone = "RW_Weapon", rel = "e1", pos = Vector(0, 0, 46.232), angle = Angle(90, 50.682, 0), size = Vector(0.048, 0.048, 0.048), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_vents/borealis_vent001c", skin = 0, bodygroup = {} },
		["e1+++++++++++++++++++"] = { type = "Model", model = "models/props/de_dust/dustteeth_7.mdl", bone = "RW_Weapon", rel = "e1", pos = Vector(0, 0, 46.232), angle = Angle(90, 128.37601, 0), size = Vector(0.048, 0.048, 0.048), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_vents/borealis_vent001c", skin = 0, bodygroup = {} },
		["e1++++++++++++++++++++"] = { type = "Model", model = "models/props/de_dust/dustteeth_7.mdl", bone = "RW_Weapon", rel = "e1", pos = Vector(0, 0, 46.232), angle = Angle(90, -154.63, 0), size = Vector(0.048, 0.048, 0.048), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_vents/borealis_vent001c", skin = 0, bodygroup = {} },
		["e1+++++++++++++++++++++"] = { type = "Model", model = "models/props/de_dust/dustteeth_7.mdl", bone = "RW_Weapon", rel = "e1", pos = Vector(0, 0, 46.232), angle = Angle(90, -20.415, 0), size = Vector(0.048, 0.048, 0.048), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_vents/borealis_vent001c", skin = 0, bodygroup = {} },
		["e1++++++++++++++++++++++"] = { type = "Model", model = "models/props/de_dust/dustteeth_7.mdl", bone = "RW_Weapon", rel = "e1", pos = Vector(0, 0, 46.232), angle = Angle(90, -90.743, 0), size = Vector(0.048, 0.048, 0.048), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_vents/borealis_vent001c", skin = 0, bodygroup = {} }
	}
	
	SWEP.WElements = {
		["e1"] = { type = "Model", model = "models/hunter/tubes/tube4x4x8.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.203, 1.442, -0.18), angle = Angle(-180, 0, 0), size = Vector(0.009, 0.009, 0.073), color = Color(253, 255, 254, 255), surpresslightning = false, material = "models/weapons/v_crowbar/crowbar_cyl", skin = 0, bodygroup = {} },
		["e1+"] = { type = "Model", model = "models/hunter/tubes/circle2x2.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(0, -0.002, 13.618), angle = Angle(0, 0, 0), size = Vector(0.022, 0.022, 0.254), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_vents/borealis_vent001c", skin = 0, bodygroup = {} },
		["e1++"] = { type = "Model", model = "models/mechanics/robotics/xfoot.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(0, -0.001, -15.465), angle = Angle(0, 0, -180), size = Vector(0.065, 0.065, 0.141), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_vents/borealis_vent001c", skin = 0, bodygroup = {} },
		["e1+++"] = { type = "Model", model = "models/hunter/geometric/pent1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(0, 0, 14.263), angle = Angle(0, 0, -180), size = Vector(0.042, 0.042, 0.193), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_vents/borealis_vent001c", skin = 0, bodygroup = {} },
		["e1++++"] = { type = "Model", model = "models/hunter/geometric/pent1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(0, 0, 15.993), angle = Angle(0, 0, -180), size = Vector(0.042, 0.042, 0.954), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props/CS_militia/roofbeams03", skin = 0, bodygroup = {} },
		["e1+++++"] = { type = "Model", model = "models/hunter/geometric/pent1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(0, 0, 18.839), angle = Angle(0, 0, -180), size = Vector(0.042, 0.042, 0.954), color = Color(254, 255, 253, 255), surpresslightning = false, material = "models/props/CS_militia/roofbeams03", skin = 0, bodygroup = {} },
		["e1++++++"] = { type = "Model", model = "models/hunter/geometric/pent1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(0, 0, 21.707), angle = Angle(0, 0, -180), size = Vector(0.042, 0.042, 0.954), color = Color(254, 255, 253, 255), surpresslightning = false, material = "models/props/CS_militia/roofbeams02", skin = 0, bodygroup = {} },
		["e1+++++++"] = { type = "Model", model = "models/hunter/geometric/pent1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(0, 0, 24.576), angle = Angle(0, 0, 180), size = Vector(0.042, 0.042, 0.954), color = Color(254, 255, 253, 255), surpresslightning = false, material = "models/props/CS_militia/roofbeams01", skin = 0, bodygroup = {} },
		["e1++++++++"] = { type = "Model", model = "models/hunter/geometric/pent1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(0, 0, 27.415), angle = Angle(0, 0, 180), size = Vector(0.042, 0.042, 0.954), color = Color(254, 255, 253, 255), surpresslightning = false, material = "models/props/CS_militia/roofbeams03", skin = 0, bodygroup = {} },
		["e1+++++++++"] = { type = "Model", model = "models/hunter/geometric/pent1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(0, 0, 35.985), angle = Angle(0, 0, 180), size = Vector(0.042, 0.042, 0.954), color = Color(254, 255, 253, 255), surpresslightning = false, material = "models/props/CS_militia/roofbeams01", skin = 0, bodygroup = {} },
		["e1++++++++++"] = { type = "Model", model = "models/hunter/geometric/pent1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(0, 0, 30.284), angle = Angle(0, 0, 180), size = Vector(0.042, 0.042, 0.954), color = Color(254, 255, 253, 255), surpresslightning = false, material = "models/props/CS_militia/roofbeams01", skin = 0, bodygroup = {} },
		["e1+++++++++++"] = { type = "Model", model = "models/hunter/geometric/pent1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(0, 0, 33.132), angle = Angle(0, 0, 180), size = Vector(0.042, 0.042, 0.954), color = Color(254, 255, 253, 255), surpresslightning = false, material = "models/props/CS_militia/roofbeams01", skin = 0, bodygroup = {} },
		["e1++++++++++++"] = { type = "Model", model = "models/hunter/geometric/pent1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(0, 0, 41.673), angle = Angle(0, 0, 180), size = Vector(0.042, 0.042, 0.954), color = Color(254, 255, 253, 255), surpresslightning = false, material = "models/props/CS_militia/roofbeams01", skin = 0, bodygroup = {} },
		["e1+++++++++++++"] = { type = "Model", model = "models/hunter/geometric/pent1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(0, 0, 38.832), angle = Angle(0, 0, 180), size = Vector(0.042, 0.042, 0.954), color = Color(254, 255, 253, 255), surpresslightning = false, material = "models/props/CS_militia/roofbeams01", skin = 0, bodygroup = {} },
		["e1++++++++++++++"] = { type = "Model", model = "models/hunter/geometric/pent1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(0, 0, 44.483), angle = Angle(0, 0, 180), size = Vector(0.042, 0.042, 0.954), color = Color(254, 255, 253, 255), surpresslightning = false, material = "models/props/CS_militia/roofbeams01", skin = 0, bodygroup = {} },
		["e1+++++++++++++++"] = { type = "Model", model = "models/hunter/geometric/pent1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(0, 0, 47.322), angle = Angle(0, 0, 180), size = Vector(0.042, 0.042, 0.954), color = Color(254, 255, 253, 255), surpresslightning = false, material = "models/props/CS_militia/roofbeams01", skin = 0, bodygroup = {} },
		["e1++++++++++++++++"] = { type = "Model", model = "models/hunter/geometric/pent1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(0, 0, 49.023), angle = Angle(0, 0, -180), size = Vector(0.042, 0.042, 0.193), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_vents/borealis_vent001c", skin = 0, bodygroup = {} },
		["e1+++++++++++++++++"] = { type = "Model", model = "models/mechanics/wheels/wheel_extruded_48.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(0, 0, 49.832), angle = Angle(0, 0, 0), size = Vector(0.05, 0.05, 0.159), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_vents/borealis_vent001c", skin = 0, bodygroup = {} },
		["e1++++++++++++++++++"] = { type = "Model", model = "models/props/de_dust/dustteeth_7.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(0, 0, 46.232), angle = Angle(90, 50.682, 0), size = Vector(0.048, 0.048, 0.048), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_vents/borealis_vent001c", skin = 0, bodygroup = {} },
		["e1+++++++++++++++++++"] = { type = "Model", model = "models/props/de_dust/dustteeth_7.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(0, 0, 46.232), angle = Angle(90, 128.37601, 0), size = Vector(0.048, 0.048, 0.048), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_vents/borealis_vent001c", skin = 0, bodygroup = {} },
		["e1++++++++++++++++++++"] = { type = "Model", model = "models/props/de_dust/dustteeth_7.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(0, 0, 46.232), angle = Angle(90, -154.63, 0), size = Vector(0.048, 0.048, 0.048), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_vents/borealis_vent001c", skin = 0, bodygroup = {} },
		["e1+++++++++++++++++++++"] = { type = "Model", model = "models/props/de_dust/dustteeth_7.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(0, 0, 46.232), angle = Angle(90, -20.415, 0), size = Vector(0.048, 0.048, 0.048), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_vents/borealis_vent001c", skin = 0, bodygroup = {} },
		["e1++++++++++++++++++++++"] = { type = "Model", model = "models/props/de_dust/dustteeth_7.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(0, 0, 46.232), angle = Angle(90, -90.743, 0), size = Vector(0.048, 0.048, 0.048), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_vents/borealis_vent001c", skin = 0, bodygroup = {} }
	}
end

SWEP.Base = "weapon_zs_basemelee"

SWEP.ViewModel = "models/melee_anims/c_crovel.mdl"
SWEP.WorldModel = "models/weapons/w_crowbar.mdl"
SWEP.UseHands = true

SWEP.HoldType = "melee2"

SWEP.DamageType = DMG_CLUB

SWEP.Tier = 4

SWEP.MeleeDamage = 163
SWEP.MeleeRange = 66
SWEP.MeleeSize = 1
SWEP.BlockMultiplierWeapon = 0.5
SWEP.IgnoreNiggers = true
SWEP.Primary.Delay = 1.6
SWEP.StartSwingAnimation =  ACT_VM_PRIMARYATTACK

SWEP.WalkSpeed = SPEED_SLOW

--SWEP.SwingRotation = Angle(0, -90, -60)

SWEP.SwingTime = 0.5
SWEP.SwingHoldType = "melee"
SWEP.HitAnim = ACT_VM_CRAWL
SWEP.MissAnim = nil

SWEP.AllowQualityWeapons = true
SWEP.Runn = false

GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_FIRE_DELAY, -0.1)

function SWEP:PlaySwingSound()
	self:EmitSound("weapons/iceaxe/iceaxe_swing1.wav", 80, 75)
end

function SWEP:PlayHitSound()
	self:EmitSound("physics/wood/wood_solid_impact_hard"..math.random(1, 3)..".wav", 60, math.Rand(100, 120))
end

function SWEP:PlayHitFleshSound()
	self:EmitSound("weapons/zs_power/power4.wav", 60, math.Rand(125, 220))
end

--function SWEP:MeleeSwing()
	--self.BaseClass.MeleeSwing(self)
--end
GAMEMODE:AddNewRemantleBranch(SWEP, 1, translate.Get("wep_dubin2"), translate.Get("wep_d_dubin2"), function(wept)
	wept.MeleeDamage = wept.MeleeDamage * 0.4
	wept.Runn = true
	end)
function SWEP:MeleeSwing()
	self.BaseClass.MeleeSwing(self)
	if self.Runn then
		timer.Simple(1,function() 
			local owner = self:GetOwner()
			--self:MeleeSwing() 
			owner:ViewPunch(132 * Angle(math.Rand(-0.1, -0.1), math.Rand(-0.1, 0.1), 0))

		owner:SetGroundEntity(NULL)
		owner:SetVelocity(-90 * owner:GetAimVector())
		end)
	end
end
function SWEP:DealThink(dmginfo) 
	if self.NoAbility then return end
	self:SetDTFloat(6,self:GetDTFloat(6)+math.min(self.MeleeDamage*3,dmginfo:GetDamage()*0.4))
end
function SWEP:HaveAbility() 
	if self:GetDTFloat(6)> 550 then
		self.NoAbility = true
		self:SetDTFloat(6,0)
		self.MeleeDamage = self.MeleeDamage*10
		self:StartSwinging()
		timer.Simple(0.7, function()
			self.MeleeDamage = self.MeleeDamage/10
			local own  = self:GetOwner()
			local pos = own:GetPos()
			local pushvel = own:GetEyeTrace().Normal * 0 + (own:GetAngles():Forward()*(own:OnGround() and 3000 or 1000))
			own:SetVelocity(pushvel)
			for k,v in pairs(ents.FindInBoxRadius(self:GetPos(), 250)) do
				if v:IsValidLivingZombie() then
					v:TakeSpecialDamage(self.MeleeDamage*6,DMG_DISSOLVE,own,self)
					
					local worldspace = v:WorldSpaceCenter()
					effectdata = EffectData()
						effectdata:SetOrigin(worldspace)
						effectdata:SetStart(pos)
						effectdata:SetEntity(v)
					util.Effect("tracer_zapper", effectdata)
				end
			end
			self.NoAbility = false
		end)
	end
end
if !CLIENT then return end
	local ablicolor =  Color( 93,144,246)
	function SWEP:Draw2DHUD()
		self:Draw2DFeature( self:GetDTFloat(6)/550, nil, nil, "weapon_ability_83_gramm", "ZSHUDFontSmallest", ablicolor, "+menu" )
	end

	