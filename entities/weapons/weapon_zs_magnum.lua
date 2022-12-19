AddCSLuaFile()
DEFINE_BASECLASS("weapon_zs_base")

--SWEP.PrintName = "'Ricochete' Magnum"
--SWEP.Description = "This gun's bullets will bounce off of walls which will then deal extra damage."
SWEP.PrintName = translate.Get("wep_magnum")
SWEP.Description = translate.Get("wep_d_magnum")
SWEP.Slot = 1
SWEP.SlotPos = 0

if CLIENT then
	SWEP.ViewModelFlip = false
	SWEP.ViewModelFOV = 60

	SWEP.HUD3DBone = "Python"
	SWEP.HUD3DPos = Vector(0.85, 0, -2.5)
	SWEP.HUD3DScale = 0.015
end

SWEP.Base = "weapon_zs_base"

SWEP.HoldType = "revolver"

SWEP.ViewModel = "models/weapons/c_357.mdl"
SWEP.WorldModel = "models/weapons/w_357.mdl"
SWEP.UseHands = true

SWEP.CSMuzzleFlashes = false

SWEP.Primary.Sound = Sound("Weapon_357.Single")
SWEP.Primary.Delay = 0.92
SWEP.Primary.Damage = 44
SWEP.Primary.NumShots = 1

SWEP.Primary.ClipSize = 6
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "pistol"
SWEP.Primary.Gesture = ACT_HL2MP_GESTURE_RANGE_ATTACK_PISTOL
GAMEMODE:SetupDefaultClip(SWEP.Primary)

SWEP.Tier = 2

SWEP.ConeMax = 0
SWEP.ConeMin = 0
SWEP.BounceMulti = 2

SWEP.IronSightsPos = Vector(-4.65, 4, 0.25)
SWEP.IronSightsAng = Vector(0, 0, 1)
if CLIENT then
	local matBeam = Material("effects/laser1")
	local matGlow = Material("sprites/glow04_noz")
	local colBeam = Color(80, 80, 255, 255)
	local COLOR_WHITE = color_white	
	local temp_angle = Angle(0, 0, 0)
	function SWEP:PostDrawViewModel(vm, pl, wep)
		if self.HUD3DPos and GAMEMODE:ShouldDraw3DWeaponHUD() then
			local pos, ang = self:GetHUD3DPos(vm)
			if pos then
				self:Draw3DHUD(vm, pos, ang)
			end
		end
		
		local owner = self:GetOwner()
		if not MySelf:KeyDown(IN_SPEED) then return end
		 local beamcol = colBeam
		 local trace = owner:CompensatedMeleeTrace(20000,1)
		 local normal = trace.Normal
		 local hitnormal = trace.HitNormal
		 local hitpos = trace.HitPos
		-- render.SetMaterial(matBeam)
		-- render.DrawBeam(pos, hitpos, 0.2, 0, 1, beamcol)
		 render.SetMaterial(matBeam)
			 local dir = 2*hitnormal * hitnormal:Dot(normal * -1) + normal
			temp_angle:Set(dir:Angle())
			temp_angle:RotateAroundAxis(
				temp_angle:Forward(),
				math.Rand(0, 360)
			)
			temp_angle:RotateAroundAxis(
				temp_angle:Up(),
				math.Rand(-0, 0)
			)
			

			 dir = temp_angle:Forward()
			 local endpos = hitpos + dir * 20000
			 if !WorldVisible(endpos,hitpos) then endpos = WorldVisiblePos(hitpos,endpos) end
		 render.DrawBeam(hitpos, endpos, 4, 0, 2, COLOR_WHITE)
		 render.DrawBeam(hitpos, endpos, 6, 0, 2, beamcol)
		 render.SetMaterial(matGlow)
		 render.DrawSprite(hitpos, 12, 12, Color(115, 255, 80))
		 render.DrawSprite(endpos, 18, 18, beamcol)
	end
end
GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_MAX_SPREAD, -0.7, 1)
GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_MIN_SPREAD, -0.35, 1)
GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_FIRE_DELAY, -0.07, 1)
GAMEMODE:AddNewRemantleBranch(SWEP, 1, translate.Get("wep_magnum_r1"), translate.Get("wep_d_magnum_r1"), function(wept)
	wept.Primary.Damage = wept.Primary.Damage * 0.85
	wept.BounceMulti = 3
	wept.GetCone = function(self)
		return BaseClass.GetCone(self) * (1 - self:GetDTInt(9)/13)
	end
	wept.FinishReload = function(self)
		self:SetDTInt(9, 0)
		BaseClass.FinishReload(self)
	end
end)

local function DoRicochet(attacker, hitpos, hitnormal, normal, damage)
	local RicoCallback = function(att, tr, dmginfo)
		local ent = tr.Entity
		local wep = att:GetActiveWeapon()
		if wep.Branch == 1 and ent:IsValidZombie() then
			wep:SetDTInt(9, wep:GetDTInt(9) + 2)
		end
	end

	attacker.RicochetBullet = true
	if attacker:IsValid() then
		attacker:FireBulletsLua(hitpos, 2*hitnormal * hitnormal:Dot(normal * -1) + normal, 0, 1, damage, nil, nil, "tracer_rico", RicoCallback, nil, nil, nil, nil, attacker:GetActiveWeapon())
	end
	attacker.RicochetBullet = nil
end
function SWEP.BulletCallback(attacker, tr, dmginfo)
	local ent = tr.Entity
	if SERVER and tr.HitWorld and not tr.HitSky then
		local hitpos, hitnormal, normal, dmg = tr.HitPos, tr.HitNormal, tr.Normal, dmginfo:GetDamage() * attacker:GetActiveWeapon().BounceMulti
		timer.Simple(0, function() DoRicochet(attacker, hitpos, hitnormal, normal, dmg) end)
	end

	if SERVER then
		local wep = attacker:GetActiveWeapon()
		if wep.Branch == 1 and ent:IsValidZombie() then
			wep:SetDTInt(9, wep:GetDTInt(9) + 1)
		end
	end
end




