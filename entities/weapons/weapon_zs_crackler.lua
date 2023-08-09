AddCSLuaFile()

--SWEP.PrintName = "'Crackler' Assault Rifle"
--SWEP.Description = "An unsophisticated assault rifle which has good damage and accuracy."
SWEP.PrintName = translate.Get("wep_cracker")
SWEP.Description = translate.Get("wep_d_cracker")
SWEP.Slot = 2
SWEP.SlotPos = 0

if CLIENT then
	SWEP.ViewModelFlip = false
	SWEP.ViewModelFOV = 60

	SWEP.HUD3DBone = "v_weapon.famas"
	SWEP.HUD3DPos = Vector(1.1, -3.5, 10)
	SWEP.HUD3DScale = 0.02
end

SWEP.Base = "weapon_zs_base"

SWEP.HoldType = "ar2"

SWEP.ViewModel = "models/weapons/cstrike/c_rif_famas.mdl"
SWEP.WorldModel = "models/weapons/w_rif_famas.mdl"
SWEP.UseHands = true

local a = math.Round(util.SharedRandom("Cracker_Rand",12,25,math.random(12,25)))

SWEP.ReloadSound = Sound("Weapon_FAMAS.Clipout")
SWEP.Primary.Sound = Sound("Weapon_FAMAS.Single")
SWEP.Primary.Damage = a
SWEP.Primary.NumShots = 1
SWEP.Primary.Delay = 0.175

SWEP.Primary.ClipSize = 22
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "ar2"
GAMEMODE:SetupDefaultClip(SWEP.Primary)

SWEP.ConeMax = 3.0 --0.045
SWEP.ConeMin = 1.6 --0.019

SWEP.ReloadSpeed = 1.1

SWEP.WalkSpeed = SPEED_SLOW

SWEP.IronSightsPos = Vector(-3, 3, 2)

GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_MAX_SPREAD, -0.375, 1)
GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_MIN_SPREAD, -0.2, 1)
GAMEMODE:AddNewRemantleBranch(SWEP, 1, translate.Get("wep_cracker"), translate.Get("wep_d_cracker_r1"), function(wept)
	wept.Primary.Damage = wept.Primary.Damage * 1.2
	wept.Primary.Delay = wept.Primary.Delay * 1.2
	wept.Primary.ClipSize = 15
	wept.ConeMin = wept.ConeMin * 0.7
	wept.ConeMax = wept.ConeMax * 0.7
	wept.Primary.Automatic = false
end)
function SWEP:DealThink(dmginfo) 
	if self.NoAbility then return end
	self:SetDTFloat(6,math.min(302,self:GetDTFloat(6)+math.min(50,dmginfo:GetDamage()*0.4)))
end
function SWEP:HaveAbility() 
	if self:GetDTFloat(6) >= 300 then
		if !self.OldCallBack then
			self.OldCallBack = self.BulletCallback
		end
		self.BulletCallback = function(attacker, tr, dmginfo)
			local ent = tr.Entity
			if ent and ent:IsValidLivingZombie() then
				self:SetDTFloat(6,self:GetDTFloat(6)-40)
				attacker:SetProgress(attacker:GetProgress('bprog')+dmginfo:GetDamage()*3, 'bprog')
				attacker.DamagedBounty = true
				if self:GetDTFloat(6) < 0 then
					self:SetDTFloat(6,0)
					self.NoAbility = false
					self.BulletCallback = self.OldCallBack
				end
			end
		end
	end
end
if !CLIENT then return end
	local ablicolor =  Color( 19,174,115)
	function SWEP:Draw2DHUD()
		self:Draw2DFeature( self:GetDTFloat(6)/300, nil, nil, "weapon_ability_crack", "ZSHUDFontSmallest", ablicolor, "+menu" )
		self.BaseClass.Draw2DHUD(self)
	end
	
	function SWEP:Draw3DHUD(vm, pos, ang)
	
		cam.Start3D2D( pos, ang, self.HUD3DScale / 6 )
				self:Draw3DFeatureHorizontal( vm, pos+Vector(0,0,1), ang, self:GetDTFloat(6)/300, nil, nil, "weapon_ability_crack", "ZSHUDFont", ablicolor )
		cam.End3D2D()
		self.BaseClass.Draw3DHUD(self,vm, pos, ang)
	end
	