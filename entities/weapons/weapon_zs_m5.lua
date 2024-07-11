AddCSLuaFile()
DEFINE_BASECLASS("weapon_zs_base")

--SWEP.PrintName = "'Sacred' M5"
--SWEP.Description = "Secret sacred Weapon."
SWEP.PrintName = ""..translate.Get("wep_m5")
SWEP.Description = ""..translate.Get("wep_d_m5")
SWEP.Slot = 2
SWEP.SlotPos = 0


if CLIENT then
	SWEP.ViewModelFlip = true
	SWEP.ViewModelFOV = 60

	SWEP.VElements = {
		["003"] = { type = "Model", model = "models/phxtended/bar2x.mdl", bone = "v_weapon.m4_Silencer", rel = "", pos = Vector(0.406, -0.426, -5.622), angle = Angle(94.279, -6.739, 102.273), size = Vector(0.1, 0.1, 0.1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["013"] = { type = "Model", model = "models/phxtended/tri1x1x2solid.mdl", bone = "v_weapon.m4_Silencer", rel = "", pos = Vector(0.686, 0.468, -9.888), angle = Angle(2.191, -71.148, 4.095), size = Vector(0.06, 0.06, 0.06), color = Color(255, 29, 29, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["023"] = { type = "Model", model = "models/props_phx/box_torpedo.mdl", bone = "v_weapon.m4_Silencer", rel = "", pos = Vector(0.123, -0.209, 0.001), angle = Angle(-85.914, 1.837, -1.745), size = Vector(0.046, 0.046, 0.046), color = Color(201, 33, 33, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["10"] = { type = "Model", model = "models/props_phx/rt_screen.mdl", bone = "v_weapon.m4_Silencer", rel = "", pos = Vector(-7.458, 0.4, -8.839), angle = Angle(-97.358, 104.151, -169.811), size = Vector(0.03, 0.03, 0.03), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	SWEP.WElements = {
		["01"] = { type = "Model", model = "models/phxtended/tri1x1x2solid.mdl", bone = "ValveBiped.Bip01_R_Finger01", rel = "", pos = Vector(6.96, -1.042, -1.978), angle = Angle(-97.795, 21.827, 3.541), size = Vector(0.06, 0.06, 0.06), color = Color(199, 28, 28, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["02"] = { type = "Model", model = "models/props_phx/box_torpedo.mdl", bone = "ValveBiped.Anim_Attachment_RH", rel = "", pos = Vector(-1.206, -7.908, 22.268), angle = Angle(95.284, -56.149, 138.638), size = Vector(0.046, 0.046, 0.046), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	SWEP.HUD3DBone = "v_weapon.m4_Parent"

end

SWEP.AllowQualityWeapons = false

SWEP.Base = "weapon_zs_base"


SWEP.ViewModel = "models/weapons/v_rif_m4a1.mdl"
SWEP.WorldModel = "models/weapons/w_rif_m4a1.mdl"
SWEP.Primary.Sound = Sound("Weapon_m4a1.Single")
SWEP.Primary.Damage = 22
SWEP.Primary.NumShots = 1
SWEP.Primary.Delay = 0.12

SWEP.Primary.ClipSize = 35
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "ar2"
GAMEMODE:SetupDefaultClip(SWEP.Primary)
SWEP.HoldType = "ar2"


SWEP.ConeMax = 4
SWEP.ConeMin = 0.7

SWEP.WalkSpeed = SPEED_SLOW

SWEP.Tier = 6
SWEP.MaxStock = 2
function SWEP:OnZombieKilled()
	local killer = self:GetOwner()

	if killer:IsValid() then
		local reaperstatus = killer:GiveStatus("bloodlust", 5)
		if reaperstatus and reaperstatus:IsValid() then
			reaperstatus:SetDTInt(1, math.min(reaperstatus:GetDTInt(1) + 10, 120))
			killer:EmitSound("hl1/ambience/particle_suck1.wav", 55, 150 + reaperstatus:GetDTInt(1) * 30, 0.45)
		end
	end
end


SWEP.IronSightsPos = Vector(-3, 0, 2)
GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_MAX_SPREAD, -0.625)
GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_MIN_SPREAD, -0.187)
local branch = GAMEMODE:AddNewRemantleBranch(SWEP, 1, "'Ultra Shine' Burst M5", "Increased damage, shoots in a slower, more accurate 6 round burst", function(wept)
	wept.Primary.Damage = wept.Primary.Damage * 1.5
	wept.Primary.Delay = wept.Primary.Delay * 1.8
	wept.Primary.BurstShots = 6
	wept.ConeMin = wept.ConeMin * 0.6
	wept.ConeMax = wept.ConeMax * 0.5

	wept.PrimaryAttack = function(self)
		if not self:CanPrimaryAttack() then return end

		self:SetNextPrimaryFire(CurTime() + self:GetFireDelay())
		self:EmitFireSound()

		self:SetNextShot(CurTime())
		self:SetShotsLeft(self.Primary.BurstShots)

		self.IdleAnimation = CurTime() + self:SequenceDuration()
	end

	wept.Think = function(self)
		BaseClass.Think(self)

		local shotsleft = self:GetShotsLeft()
		if shotsleft > 0 and CurTime() >= self:GetNextShot() then
			self:SetShotsLeft(shotsleft - 1)
			self:SetNextShot(CurTime() + self:GetFireDelay()/6)

			if self:Clip1() > 0 and self:GetReloadFinish() == 0 then
				self:EmitFireSound()
				self:TakeAmmo()
				self:ShootBullets(self.Primary.Damage, self.Primary.NumShots, self:GetCone())

				self.IdleAnimation = CurTime() + self:SequenceDuration()
			else
				self:SetShotsLeft(0)
			end
		end
	end

	wept.EmitFireSound = function(self)
		self:EmitSound("weapons/m4a1/m4a1_unsil-1.wav", 75, math.random(82, 86), 0.75)
		self:EmitSound("weapons/galil/galil-1.wav", 75, math.random(154, 156), 0.6, CHAN_WEAPON + 20)
	end

	if CLIENT then
		wept.VElements = {
			["lol"] = { type = "Model", model = "models/props_c17/TrapPropeller_Engine.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "top", pos = Vector(0.317, 0.012, -15.013), angle = Angle(180, 90, 180), size = Vector(0.201, 0.115, 0.261), color = Color(175, 175, 165, 255), surpresslightning = false, material = "models/props_combine/metal_combinebridge001", skin = 0, bodygroup = {} },
			["SCOPE1"] = { type = "Model", model = "models/props_wasteland/light_spotlight01_lamp.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "LOL2", pos = Vector(-0.899, -0.706, -0.01), angle = Angle(0, -180, 90), size = Vector(0.136, 0.079, 0.079), color = Color(175, 175, 165, 255), surpresslightning = false, material = "models/props_combine/metal_combinebridge001", skin = 0, bodygroup = {} },
			["LOL2"] = { type = "Model", model = "models/Mechanics/robotics/d1.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "grip", pos = Vector(-6.801, 0.108, 2.618), angle = Angle(0, 0, 90), size = Vector(0.071, 0.056, 0.048), color = Color(175, 175, 165, 255), surpresslightning = false, material = "models/props_combine/metal_combinebridge001", skin = 0, bodygroup = {} },
			["top"] = { type = "Model", model = "models/props_c17/FurnitureBoiler001a.mdl", bone = "v_weapon.m4_Parent", rel = "", pos = Vector(0.092, -4.251, -17.129), angle = Angle(-1.66, -8.7, 180), size = Vector(0.054, 0.054, 0.087), color = Color(175, 175, 165, 255), surpresslightning = false, material = "models/props_combine/metal_combinebridge001", skin = 0, bodygroup = {} },
			["SCOPE1+"] = { type = "Model", model = "models/props_wasteland/light_spotlight01_lamp.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "SCOPE1", pos = Vector(-0.916, 0, 0), angle = Angle(0, 180, 0), size = Vector(0.136, 0.079, 0.079), color = Color(175, 175, 165, 255), surpresslightning = false, material = "models/props_combine/metal_combinebridge001", skin = 0, bodygroup = {} },
			["grip"] = { type = "Model", model = "models/props_wasteland/laundry_washer003.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "top", pos = Vector(0.017, 0.479, -8.181), angle = Angle(90, 90, 0), size = Vector(0.063, 0.061, 0.057), color = Color(175, 175, 165, 255), surpresslightning = false, material = "models/props_combine/metal_combinebridge001", skin = 0, bodygroup = {} },
			["rail"] = { type = "Model", model = "models/combine_apc.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "lol", pos = Vector(-0.225, 0.217, 1.909), angle = Angle(0, 90, 90), size = Vector(0.02, 0.045, 0.035), color = Color(175, 175, 165, 255), surpresslightning = false, material = "models/props_combine/metal_combinebridge001", skin = 0, bodygroup = {} },
			["GLASS"] = { type = "Model", model = "models/XQM/panel360.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "SCOPE1", pos = Vector(0.37, 0, 0.319), angle = Angle(0, 0, 0), size = Vector(2.65, 0.027, 0.027), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/weapons/v_models/snip_awp/v_awp_scope", skin = 0, bodygroup = {} }
		}

		wept.WElements = {
			["GLASS"] = { type = "Model", model = "models/XQM/panel360.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "SCOPE1", pos = Vector(0.37, 0, 0.319), angle = Angle(0, 0, 0), size = Vector(2.65, 0.027, 0.027), color = Color(175, 175, 165, 255), surpresslightning = false, material = "models/weapons/v_models/snip_awp/v_awp_scope", skin = 0, bodygroup = {} },
			["SCOPE1"] = { type = "Model", model = "models/props_wasteland/light_spotlight01_lamp.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "LOL2", pos = Vector(-0.899, -0.706, -0.01), angle = Angle(0, -180, 90), size = Vector(0.136, 0.079, 0.079), color = Color(175, 175, 165, 255), surpresslightning = false, material = "models/props_combine/metal_combinebridge001", skin = 0, bodygroup = {} },
			["LOL2"] = { type = "Model", model = "models/Mechanics/robotics/d1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "grip", pos = Vector(-9.316, 0.108, 2.97), angle = Angle(0, 0, 90), size = Vector(0.071, 0.056, 0.048), color = Color(175, 175, 165, 255), surpresslightning = false, material = "models/props_combine/metal_combinebridge001", skin = 0, bodygroup = {} },
			["top"] = { type = "Model", model = "models/props_c17/FurnitureBoiler001a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(23.756, 0.8, -6.969), angle = Angle(0, 90, 99.805), size = Vector(0.054, 0.054, 0.128), color = Color(175, 175, 165, 255), surpresslightning = false, material = "models/props_combine/metal_combinebridge001", skin = 0, bodygroup = {} },
			["SCOPE1+"] = { type = "Model", model = "models/props_wasteland/light_spotlight01_lamp.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "SCOPE1", pos = Vector(-0.916, 0, 0), angle = Angle(0, 180, 0), size = Vector(0.136, 0.079, 0.079), color = Color(175, 175, 165, 255), surpresslightning = false, material = "models/props_combine/metal_combinebridge001", skin = 0, bodygroup = {} },
			["grip"] = { type = "Model", model = "models/props_wasteland/laundry_washer003.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "top", pos = Vector(-0.062, 0.479, -8.021), angle = Angle(90, 90, 0), size = Vector(0.072, 0.061, 0.057), color = Color(175, 175, 165, 255), surpresslightning = false, material = "models/props_combine/metal_combinebridge001", skin = 0, bodygroup = {} },
			["RAIL"] = { type = "Model", model = "models/combine_apc.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "lol", pos = Vector(0.172, 0.31, 1.508), angle = Angle(0, 90, 90), size = Vector(0.019, 0.054, 0.032), color = Color(175, 175, 165, 255), surpresslightning = false, material = "models/props_combine/metal_combinebridge001", skin = 0, bodygroup = {} },
			["lol"] = { type = "Model", model = "models/props_c17/TrapPropeller_Engine.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "top", pos = Vector(0.393, 0.192, -17.122), angle = Angle(180, 90, 180), size = Vector(0.21, 0.115, 0.372), color = Color(175, 175, 165, 255), surpresslightning = false, material = "models/props_combine/metal_combinebridge001", skin = 0, bodygroup = {} }
		}

		wept.HUD3DPos = Vector(-1.2, -5, -1.2)
	end
end)
branch.Killicon = "weapon_zs_aspirant"

function SWEP:SetNextShot(nextshot)
	self:SetDTFloat(5, nextshot)
end

function SWEP:GetNextShot()
	return self:GetDTFloat(5)
end

function SWEP:SetShotsLeft(shotsleft)
	self:SetDTInt(1, shotsleft)
end

function SWEP:GetShotsLeft()
	return self:GetDTInt(1)
end

function SWEP:GetAuraRange()
	return 256
end
