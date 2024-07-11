AddCSLuaFile()

--SWEP.PrintName = "'Sprayer' Uzi 9mm"
--SWEP.Description = "Quite inaccurate, but has good, cheap and reliable firepower potential."
SWEP.PrintName = translate.Get("wep_uzi")
SWEP.Description = translate.Get("wep_d_uzi")

SWEP.Slot = 2
SWEP.SlotPos = 0

if CLIENT then
	SWEP.ViewModelFlip = false
	SWEP.ViewModelFOV = 50

	SWEP.HUD3DBone = "v_weapon.mac10_bolt"
	SWEP.HUD3DPos = Vector(-1.45, 1.25, 0)
	SWEP.HUD3DAng = Angle(0, 0, 0)
	SWEP.HUD3DScale = 0.015
end

SWEP.Base = "weapon_zs_base"

SWEP.HoldType = "pistol"

SWEP.ViewModel = "models/weapons/cstrike/c_smg_mac10.mdl"
SWEP.WorldModel = "models/weapons/w_smg_mac10.mdl"
SWEP.UseHands = true

SWEP.Primary.Sound = Sound("Weapon_MAC10.Single")
SWEP.Primary.Damage = 17
SWEP.Primary.NumShots = 1
SWEP.Primary.Delay = 0.075

SWEP.Primary.ClipSize = 35
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "smg1"
GAMEMODE:SetupDefaultClip(SWEP.Primary)

SWEP.Primary.Gesture = ACT_HL2MP_GESTURE_RANGE_ATTACK_SMG1
SWEP.ReloadGesture = ACT_HL2MP_GESTURE_RELOAD_SMG1

SWEP.ConeMax = 5.5
SWEP.ConeMin = 2.5

SWEP.FireAnimSpeed = 1.5

SWEP.WalkSpeed = SPEED_NORMAL

SWEP.Tier = 2

SWEP.IronSightsPos = Vector(-7, 15, 0)
SWEP.IronSightsAng = Vector(3, -3, -10)

GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_MAX_SPREAD, -0.58, 1)
GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_MIN_SPREAD, -0.27, 1)
GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_CLIP_SIZE, 3, 1)
GAMEMODE:AddNewRemantleBranch(SWEP, 1, "'Disperser' Uzi", "Decreases the clip size but increases the fire rate, and the last few shots bounce", function(wept)
	wept.Primary.ClipSize = math.floor(wept.Primary.ClipSize * 0.53)
	wept.Primary.Delay = 0.06

	local function DoRicochet(attacker, hitpos, hitnormal, normal, damage)
		attacker.RicochetBullet = true
		if attacker:IsValid() then
			attacker:FireBulletsLua(hitpos, 2 * hitnormal * hitnormal:Dot(normal * -1) + normal, 0, 1, damage, nil, nil, "tracer_rico", nil, nil, nil, nil, nil, attacker:GetActiveWeapon())
		end
		attacker.RicochetBullet = nil
	end
	wept.BulletCallback = function(attacker, tr, dmginfo)
		if SERVER and tr.HitWorld and not tr.HitSky and attacker:GetActiveWeapon():Clip1() < 8 then
			local hitpos, hitnormal, normal, dmg = tr.HitPos, tr.HitNormal, tr.Normal, dmginfo:GetDamage() * 1.5
			timer.Simple(0, function() DoRicochet(attacker, hitpos, hitnormal, normal, dmg) end)
		end
	end
end)
function SWEP:HaveAbility() 
	local float = self:GetDTFloat(6)
	if float>=700 then
		self:SetDTFloat(6,float-10)
		self.NoAbility = true
		if !self.OldDelay then
			self.OldDelay = self.Primary.Delay 
		end
		self.Primary.Delay = 0.01
		if !self.OldCallBack then
			self.OldCallBack = self.BulletCallback
		end
		self.BulletCallback = function(attacker, tr, dmginfo)
			local ent = tr.Entity
			if ent and ent:IsValidLivingZombie() then
				self:SetDTFloat(6,self:GetDTFloat(6)-30)
				if self:GetDTFloat(6) < 0 then
					self:SetDTFloat(6,0)
					self.NoAbility = false
					self.BulletCallback = self.OldCallBack
					self.Primary.Delay  = self.OldDelay
				end
			end
			--self.BaseClass.BulletCallback(self,self:GetOwner(), tr, dmginfo)
		end
	end
end
function SWEP:DealThink(dmginfo) 
	if self.NoAbility then return end
	self:SetDTFloat(6,math.min(700,self:GetDTFloat(6)+math.min(50,dmginfo:GetDamage())))
end
if !CLIENT then return end
	local ablicolor =  Color( 25,31,184)
	function SWEP:Draw2DHUD()
		self:Draw2DFeature( self:GetDTFloat(6)/700, nil, nil, "weapon_ability_spr", "ZSHUDFontSmallest", ablicolor, "+menu" )
		self.BaseClass.Draw2DHUD(self)
	end
	
	function SWEP:Draw3DHUD(vm, pos, ang)
	
		cam.Start3D2D( pos, ang, self.HUD3DScale / 6 )
				self:Draw3DFeatureHorizontal( vm, pos+Vector(0,0,1), ang, self:GetDTFloat(6)/700, nil, nil, "weapon_ability_spr", "ZSHUDFont", ablicolor )
		cam.End3D2D()
		self.BaseClass.Draw3DHUD(self,vm, pos, ang)
	end
	