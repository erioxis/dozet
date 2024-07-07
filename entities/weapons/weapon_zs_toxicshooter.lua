AddCSLuaFile()

--SWEP.PrintName = "'ToxicShooter' Handgun"
--SWEP.Description = "Тратит половину своих токсичных патрон имеет хороший токсичный уронн"
SWEP.PrintName = ""..translate.Get("wep_toxicshooter")
SWEP.Description = ""..translate.Get("wep_d_toxicshooter")

SWEP.Slot = 1
SWEP.SlotPos = 0

if CLIENT then
	SWEP.ViewModelFOV = 60
	SWEP.ViewModelFlip = false

	SWEP.HUD3DBone = "v_weapon.p228_Slide"
	SWEP.HUD3DPos = Vector(-0.88, 0.35, 1)
	SWEP.HUD3DAng = Angle(0, 0, 0)
	SWEP.HUD3DScale = 0.015
end

SWEP.VElements = {
	["base"] = { type = "Model", model = "models/healthvial.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(7, 2.11, -2), angle = Angle(0, -90, -97), size = Vector(0.4, 0.4, 0.4), color = Color(135, 20, 245, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

SWEP.Base = "weapon_zs_base"

SWEP.HoldType = "pistol"

SWEP.ViewModel = "models/weapons/cstrike/c_pist_p228.mdl"
SWEP.WorldModel = "models/weapons/w_pist_p228.mdl"
SWEP.UseHands = true
--models/weapons/w_pist_p228.mdl
SWEP.Primary.Sound = Sound("Weapon_P228.Single")
SWEP.Primary.Damage = 12
SWEP.Primary.NumShots = 2
SWEP.Primary.Delay = 0.33
SWEP.Tier = 4
SWEP.Primary.ClipSize = 12
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "chemical"
SWEP.Primary.ClipMultiplier = 12 * 2 -- Battleaxe/Owens have 12 clip size, but this has half ammo usage

SWEP.ConeMax = 4
SWEP.ConeMin = 0.75

GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_CLIP_SIZE, 1)
GAMEMODE:AddNewRemantleBranch(SWEP, 1, translate.Get("wep_toxicshooter_r1"), translate.Get("wep_d_toxicshooter_r1"), function(wept)
	wept.Primary.Delay = 0.243
	wept.Primary.Automatic = true
	wept.Primary.ClipSize = math.floor(wept.Primary.ClipSize * 0.5)

	wept.ConeMin = 2
	
		wept.OnZombieKilled = function(self, zombie, total, dmginfo)
		local killer = self:GetOwner()
		local minushp = (-zombie:Health() or -20)
		if killer:IsValid() and minushp > -20 then
			local pos = zombie:GetPos()

			timer.Simple(0.15, function()
				
				util.BlastDamagePlayer(killer:GetActiveWeapon(), killer, pos, 72, minushp, DMG_ALWAYSGIB, 1)
			end)

			local effectdata = EffectData()
				effectdata:SetOrigin(pos)
			util.Effect("Explosion", effectdata, true, true)
		end
	end
end)

SWEP.IronSightsPos = Vector(-6, -1, 2.25)

function SWEP:SetAltUsage(usage)
	self:SetDTBool(1, usage)
end

function SWEP:GetAltUsage()
	return self:GetDTBool(1)
end

function SWEP:PrimaryAttack()
	if not self:CanPrimaryAttack() then return end
	self:SetNextPrimaryFire(CurTime() + self.Primary.Delay)
	self:EmitFireSound()

	local altuse = self:GetAltUsage()
	if not altuse then
		self:TakeAmmo()
	end
	self:SetAltUsage(not altuse)

	self:ShootBullets(self.Primary.Damage, self.Primary.NumShots, self:GetCone())
	self.IdleAnimation = CurTime() + self:SequenceDuration()
end
function SWEP:HaveAbility() 
	local float = self:GetDTFloat(6)
	if float>610 then
		self:SetDTFloat(6,float-20)
		self.NoAbility = true
		if !self.OldCallBack then
			self.OldCallBack = self.BulletCallback
		end
		self.BulletCallback = function(attacker, tr, dmginfo)
			local ent = tr.Entity
			if ent and ent:IsValidLivingZombie() then
				self:SetDTFloat(6,self:GetDTFloat(6)-50)
				local s = ent:GetStatus("radiation")
				if !s then
					local g = ent:GiveStatus("radiation",6, self:GetOwner())
					g:SetDTInt(1,1)
					g.Damager = self:GetOwner()
				else
					s:SetDTInt(1,s:GetDTInt(1)+2)
					s.DieTime = s.DieTime + 2
					s.Damager = self:GetOwner()
				end
				if self:GetDTFloat(6) < 0 then
					self:SetDTFloat(6,0)
					self.NoAbility = false
					self.BulletCallback = self.OldCallBack
				end
			end
			--self.BaseClass.BulletCallback(self,self:GetOwner(), tr, dmginfo)
		end
	end
end
function SWEP:DealThink(dmginfo) 
	if self.NoAbility then return end
	self:SetDTFloat(6,math.min(620,self:GetDTFloat(6)+math.min(160,dmginfo:GetDamage()*0.3)))
end
if not CLIENT then return end

function SWEP:GetDisplayAmmo(clip, spare, maxclip)
	local minus = self:GetAltUsage() and 0 or 1
	return math.max(0, (clip * 2) - minus), spare * 2, maxclip * 2
end
	local ablicolor =  Color( 43,124,6)
	function SWEP:Draw2DHUD()
		self:Draw2DFeature( self:GetDTFloat(6)/610, nil, nil, "weapon_ability_tx", "ZSHUDFontSmallest", ablicolor, "+menu" )
		self.BaseClass.Draw2DHUD(self)
	end
	
	function SWEP:Draw3DHUD(vm, pos, ang)
	
		cam.Start3D2D( pos, ang, self.HUD3DScale / 6 )
				self:Draw3DFeatureHorizontal( vm, pos+Vector(0,0,1), ang, self:GetDTFloat(6)/610, nil, nil, "weapon_ability_tx", "ZSHUDFont", ablicolor )
		cam.End3D2D()
		self.BaseClass.Draw3DHUD(self,vm, pos, ang)
	end
