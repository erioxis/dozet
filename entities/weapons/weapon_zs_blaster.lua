AddCSLuaFile()

SWEP.Base = "weapon_zs_baseshotgun"

--SWEP.PrintName = "'Blaster' Shotgun"
--SWEP.Description = "A basic shotgun that can deal significant amounts of damage at close range."
SWEP.PrintName = translate.Get("wep_blaster")
SWEP.Description = translate.Get("wep_d_blaster")

if CLIENT then
	SWEP.ViewModelFlip = false

	SWEP.HUD3DPos = Vector(4, -3.5, -1.2)
	SWEP.HUD3DAng = Angle(90, 0, -30)
	SWEP.HUD3DScale = 0.02
	SWEP.HUD3DBone = "SS.Grip.Dummy"
end
SWEP.IsChangeWeapon = 1
SWEP.ChangeMode = 0

SWEP.HoldType = "shotgun"

SWEP.ViewModel = "models/weapons/v_supershorty/v_supershorty.mdl"
SWEP.WorldModel = "models/weapons/w_supershorty.mdl"
SWEP.UseHands = false

SWEP.ReloadDelay = 0.67

SWEP.Primary.Sound = Sound("Weapon_Shotgun.NPC_Single")
SWEP.Primary.Damage = 5.6
SWEP.Primary.NumShots = 5
SWEP.Primary.Delay = 0.6

SWEP.Primary.ClipSize = 6
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "buckshot"
GAMEMODE:SetupDefaultClip(SWEP.Primary)

SWEP.ConeMax = 5
SWEP.ConeMin = 2.3

SWEP.WalkSpeed = SPEED_SLOWER

SWEP.PumpSound = Sound("Weapon_M3.Pump")
SWEP.ReloadSound = Sound("Weapon_Shotgun.Reload")

SWEP.PumpActivity = ACT_SHOTGUN_PUMP


GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_CLIP_SIZE, 1)
GAMEMODE:AddNewRemantleBranch(SWEP, 1, translate.Get("wep_blaster_r1"), translate.Get("wep_d_blaster_r1"), function(wept)
	wept.Primary.Damage = wept.Primary.Damage * 4
	wept.Primary.NumShots = 1
	wept.ConeMin = wept.ConeMin * 0.45
	wept.ConeMax = wept.ConeMax * 0.2

end)
	
function SWEP:PrimaryAttack()
	if not self:CanPrimaryAttack() then return end

	self:SetNextPrimaryFire(CurTime() + self:GetFireDelay())

	self:EmitFireSound()
	self:TakeAmmo()
	self:ShootBullets(self.Primary.Damage, self.Primary.NumShots, self:GetCone())
	self.IdleAnimation = CurTime() + self:SequenceDuration()
end
function SWEP:DealThink(dmginfo) 
	if self.NoAbility then return end
	self:SetDTFloat(6,self:GetDTFloat(6)+math.min(50,dmginfo:GetDamage()*0.4))
end
function SWEP:HaveAbility() 
	if self:GetDTFloat(6)> 150 then
		self:SetDTFloat(6,0)
		self:SetNextPrimaryFire(CurTime() + self:GetFireDelay())

		self:EmitFireSound()
		self.NoAbility = true
		self:ShootBullets(self.Primary.Damage* 4, self.Primary.NumShots, self:GetCone())
		self.NoAbility = false
		self.IdleAnimation = CurTime() + self:SequenceDuration()
	end
end



function SWEP:SendWeaponAnimation()
	self:SendWeaponAnim(ACT_VM_PRIMARYATTACK)
	self:GetOwner():GetViewModel():SetPlaybackRate(self.FireAnimSpeed)

	timer.Simple(0.15, function()
		if IsValid(self) then
			self:SendWeaponAnim(ACT_SHOTGUN_PUMP)
			self:GetOwner():GetViewModel():SetPlaybackRate(self.FireAnimSpeed)

			if CLIENT and self:GetOwner() == MySelf then
				self:EmitSound("weapons/m3/m3_pump.wav", 65, 100, 0.4, CHAN_AUTO)
			end
		end
	end)
end
function SWEP:DealThink(dmginfo) 
	if self.NoAbility then return end
	self:SetDTFloat(6,self:GetDTFloat(6)+math.min(50,dmginfo:GetDamage()*0.4))
end
function SWEP:HaveAbility() 
	if self:GetDTFloat(6)> 150 then
		self:SetDTFloat(6,0)
		self:SetNextPrimaryFire(CurTime() + self:GetFireDelay())

		self:EmitFireSound()
		self.NoAbility = true
		self:ShootBullets(self.Primary.Damage* 4, self.Primary.NumShots, self:GetCone())
		self.NoAbility = false
		self.IdleAnimation = CurTime() + self:SequenceDuration()
	end
end
if !CLIENT then return end
	local ablicolor =  Color( 174,19,19)
	function SWEP:Draw2DHUD()
		self:Draw2DFeature( self:GetDTFloat(6)/150, nil, nil, "weapon_ability_blaster", "ZSHUDFontSmallest", ablicolor, "+menu" )
		self.BaseClass.Draw2DHUD(self)
	end
	
	function SWEP:Draw3DHUD(vm, pos, ang)
	
		cam.Start3D2D( pos, ang, self.HUD3DScale / 6 )
				self:Draw3DFeatureHorizontal( vm, pos+Vector(0,0,1), ang, self:GetDTFloat(6)/150, nil, nil, "weapon_ability_blaster", "ZSHUDFont", ablicolor )
		cam.End3D2D()
		self.BaseClass.Draw3DHUD(self,vm, pos, ang)
	end
	


