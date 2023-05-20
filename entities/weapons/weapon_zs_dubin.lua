AddCSLuaFile()
DEFINE_BASECLASS("weapon_zs_basemelee")
SWEP.PrintName = translate.Get("wep_dubin")
SWEP.Description = translate.Get("wep_d_dubin")
if CLIENT then
	SWEP.ViewModelFOV = 65
	SWEP.ViewModelFlip = false

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
SWEP.WorldModel = "models/melee_anims/c_crovel.mdl"
SWEP.UseHands = true

SWEP.HoldType = "melee2"

SWEP.DamageType = DMG_CLUB

SWEP.Tier = 1

SWEP.MeleeDamage = 45
SWEP.MeleeRange = 120
SWEP.MeleeSize = 1
SWEP.BlockMultiplierWeapon = 0.5
SWEP.IgnoreNiggers = true
SWEP.Primary.Delay = 1.3
SWEP.StartSwingAnimation =  ACT_VM_HITLEFT

SWEP.WalkSpeed = SPEED_SLOW

SWEP.SwingRotation = Angle(0, -90, -60)
SWEP.SwingOffset = Vector(0, 30, -40)
SWEP.SwingTime = 0.2
SWEP.SwingHoldType = "melee"
SWEP.HitAnim = ACT_VM_HITLEFT
SWEP.MissAnim = nil

SWEP.AllowQualityWeapons = true
SWEP.Runn = false

GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_FIRE_DELAY, -0.1)

function SWEP:PlaySwingSound()
	self:EmitSound("weapons/iceaxe/iceaxe_swing1.wav", 80, math.Rand(125, 370))
end

function SWEP:PlayHitSound()
	self:EmitSound("physics/metal/metal_solid_impact_hard"..math.random(4, 5)..".wav", 120, math.Rand(125, 370))
end

function SWEP:PlayHitFleshSound()
	self:EmitSound("physics/body/body_medium_break"..math.random(2, 4)..".wav", 120, math.Rand(125, 370))
end

--function SWEP:MeleeSwing()
	--self.BaseClass.MeleeSwing(self)
--end
GAMEMODE:AddNewRemantleBranch(SWEP, 1, translate.Get("wep_dubin2"), translate.Get("wep_d_dubin2"), function(wept)
	wept.MeleeDamage = wept.MeleeDamage * 0.4
	wept.Runn = true
	end)
function SWEP:MeleeSwing()
	
	local owner = self:GetOwner()
	if owner.StaminaHAHA then
		owner:AddStamina(-(self.StaminaUse or 13)*0.4)
	end
	self.SwingingTrue = false
	owner:ResetSpeed()
	self:DoMeleeAttackAnim()

	local tr = owner:CompensatedMeleeTrace(self.MeleeRange * (owner.MeleeRangeMul or 1), self.MeleeSize)

	if not tr.Hit then
		if self.MissAnim then
			self:SendWeaponAnim(self.MissAnim)
		end
		self.IdleAnimation = CurTime() + self:SequenceDuration()-0.3
		self:PlaySwingSound()

		if owner.MeleePowerAttackMul and owner.MeleePowerAttackMul > 1 then
			self:SetPowerCombo(0)
		end

		if self.PostOnMeleeMiss then self:PostOnMeleeMiss(tr) end

		return
	end

	local damagemultiplier = owner:Team() == TEAM_HUMAN and owner.MeleeDamageMultiplier or 1 --(owner.BuffMuscular and owner:Team()==TEAM_HUMAN) and 1.2 or 1
	if owner:IsSkillActive(SKILL_LASTSTAND) then
		if owner:Health() <= owner:GetMaxHealth() * 0.25 then
			damagemultiplier = damagemultiplier * 2
		else
			damagemultiplier = damagemultiplier * 0.85
		end
	end
	if owner:IsSkillActive(SKILL_SAHA) and owner.StaminaHAHA then
		if owner:GetStamina() <= 50 then
			damagemultiplier = damagemultiplier * 1.33
		end
	end
	if owner:IsSkillActive(SKILL_CURSE_OF_MISS) and math.random(1,3) == 1 and SERVER then
		GAMEMODE:BlockFloater(owner, NULL, tr.HitPos, 1)
		self:SetPowerCombo(0)
		owner.MissTimes = (owner.MissTimes or 0) + 1
		if owner.MissTimes >= 10 then
			owner:GiveAchievement("koso")
		end
		return
	end
	owner.MissTimes = 0
	 



	local hitent = tr.Entity
	local hitflesh = true

	if self.HitAnim then
		self:SendWeaponAnim(self.HitAnim)
	end
	self.IdleAnimation = CurTime() + self:SequenceDuration()

	if hitflesh then
		util.Decal(self.BloodDecal, tr.HitPos + tr.HitNormal, tr.HitPos - tr.HitNormal)
		self:PlayHitFleshSound()
	else
		util.Decal(self.HitDecal, tr.HitPos + tr.HitNormal, tr.HitPos - tr.HitNormal)
		self:PlayHitSound()
	end

	if self.OnMeleeHit and self:OnMeleeHit(hitent, hitflesh, tr) then
		return
	end

	if SERVER then
		self:ServerMeleeHitEntity(tr, hitent, damagemultiplier)
	end

	self:MeleeHitEntity(tr, hitent, damagemultiplier)

	if self.PostOnMeleeHit then self:PostOnMeleeHit(hitent, hitflesh, tr) end

	if SERVER then
		self:ServerMeleePostHitEntity(tr, hitent, damagemultiplier)
	end
	if self.Runn then
		timer.Simple(1,function() self:MeleeSwing() end)
	end
end