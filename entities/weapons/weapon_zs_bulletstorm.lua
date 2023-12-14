AddCSLuaFile()
DEFINE_BASECLASS("weapon_zs_base")

SWEP.PrintName = "'Bullet Storm' SMG"
SWEP.Description = "Hold right click to use the Storm firing mode: fire rate is reduced to 60% but two bullets are fired at once."
SWEP.PrintName = translate.Get("wep_bulletstorm")
SWEP.Description = translate.Get("wep_d_gale")
SWEP.Slot = 2
SWEP.SlotPos = 0

if CLIENT then
	SWEP.ViewModelFlip = false
	SWEP.ViewModelFOV = 50

	SWEP.HUD3DBone = "v_weapon.p90_Release"
	SWEP.HUD3DPos = Vector(-1.35, -0.5, -6.5)
	SWEP.HUD3DAng = Angle(0, 0, 0)
end

SWEP.Base = "weapon_zs_base"

SWEP.HoldType = "smg"

SWEP.ViewModel = "models/weapons/cstrike/c_smg_p90.mdl"
SWEP.WorldModel = "models/weapons/w_smg_p90.mdl"
SWEP.UseHands = true

SWEP.Primary.Sound = Sound("Weapon_p90.Single")
SWEP.Primary.Damage = 17.5
SWEP.Primary.NumShots = 1
SWEP.Primary.Delay = 0.07

SWEP.Primary.ClipSize = 50
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "smg1"
GAMEMODE:SetupDefaultClip(SWEP.Primary)

SWEP.ConeMax = 5.5
SWEP.ConeMin = 3

SWEP.Primary.Gesture = ACT_HL2MP_GESTURE_RANGE_ATTACK_SMG1
SWEP.ReloadGesture = ACT_HL2MP_GESTURE_RELOAD_SMG1

SWEP.WalkSpeed = SPEED_SLOW

SWEP.Tier = 4
SWEP.MaxStock = 3

SWEP.IronSightsPos = Vector(-2, 6, 3)
SWEP.IronSightsAng = Vector(0, 2, 0)

GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_RELOAD_SPEED, 0.1)
GAMEMODE:AddNewRemantleBranch(SWEP, 1, translate.Get("wep_bulletstorm_r1"), translate.Get("wep_d_bulletstorm_r1"), function(wept)
	wept.Primary.Damage = wept.Primary.Damage * 0.8
	wept.ReloadSpeed = wept.ReloadSpeed * 1.3
	wept.Primary.Delay = wept.Primary.Delay * 0.77
	wept.Phantom = true
end)
function SWEP:CanPrimaryAttack()
	if self:GetOwner():IsHolding() or self:GetOwner():GetBarricadeGhosting() or self:GetReloadFinish() > 0 then return false end
	if (self:Clip1() < self.RequiredClip and (self:GetDTInt(12) < self.RequiredClip or !self:GetDTBool(12))) and not self:GetOwner():HasTrinket("ultra_mag") or  self:GetOwner():HasTrinket("ultra_mag") and self:GetOwner():GetAmmoCount(self.Primary.Ammo) < self.RequiredClip then
		self:EmitSound(self.DryFireSound)
		self:SetNextPrimaryFire(CurTime() + math.max(0.25, self.Primary.Delay))
		return false
	end
	return self:GetNextPrimaryFire() <= CurTime()
end
function SWEP:PrimaryAttack()
	if not self:CanPrimaryAttack() then return end
	local ironsights = self:GetIronsights()

	self:SetNextPrimaryFire(CurTime() + self:GetFireDelay() * (ironsights and 1.3333 or 1))

	self:EmitFireSound()
	if !self:GetDTBool(12) then
		self:TakeAmmo()
	else
		if self:GetDTInt(12) > 0 then
			self:SetDTInt(12,self:GetDTInt(12)-1)
		else
			self:TakeAmmo()
			self:TakeAmmo()
		end
	end
		self:ShootBullets(self.Primary.Damage * (ironsights and 0.6666 or 1), self.Primary.NumShots * (ironsights and 2 or 1), self:GetCone())

	self.IdleAnimation = CurTime() + self:SequenceDuration()
end

function SWEP:SetIronsights(b)
	if self:GetIronsights() ~= b then
		if b then
			self:EmitSound("npc/scanner/scanner_scan4.wav", 40)
		else
			self:EmitSound("npc/scanner/scanner_scan2.wav", 40)
		end
	end

	BaseClass.SetIronsights(self, b)
end
function SWEP:HaveAbility()
	self:SetDTBool(12,!self:GetDTBool(12))
end
function SWEP.BulletCallback(attacker, tr, dmginfo)
	local wep = attacker:GetActiveWeapon()
	if !wep.Phantom then return end
	if wep:GetDTBool(12) and wep:GetDTInt(12) >= 0 then
		local effectdata = EffectData()
			effectdata:SetOrigin(tr.HitPos)
			effectdata:SetNormal(tr.HitNormal)
		util.Effect("hit_hunter", effectdata)
		dmginfo:ScaleDamage(2)
		return
	end
	if tr.Entity and tr.Entity:IsValidLivingZombie() then
		wep:SetDTInt(12,math.min(90,wep:GetDTInt(12)+1))
	end
	attacker:GetActiveWeapon().BaseClass.BulletCallback(attacker, tr, dmginfo)
end


function SWEP:SecondaryAttack()
	if self:GetNextSecondaryFire() <= CurTime() and not self:GetOwner():IsHolding() and self:GetReloadFinish() == 0 then
		self:SetIronsights(true)
	end
end

util.PrecacheSound("npc/scanner/scanner_scan4.wav")
util.PrecacheSound("npc/scanner/scanner_scan2.wav")
if CLIENT then 
	local das = Color(36,22,163)
	function SWEP:Draw2DHUD()
		self.BaseClass.Draw2DHUD(self)
		if !self.Phantom then return end
		local screenscale = BetterScreenScale()
		local da = self:GetDTBool(12)
		local ablicolor = Color( 75  * (da and 0.5 or 1), 115  * (da and 0.5 or 1), 25 * (da and 0.5 or 1) )
		self:Draw2DFeature((da and 1 or 0), nil, nil, "weapon_ability_p_bull", "ZSHUDFont", ablicolor )
		local wid, hei = 180 * screenscale, 764 * screenscale
		local x, y = ScrW() - wid - screenscale * 128, ScrH() - hei - screenscale * 72
		draw.SimpleTextBlurry(self:GetDTInt(12), "ZSHUDFontBig", x + wid, 2 + hei, das, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end
	
	function SWEP:Draw3DHUD(vm, pos, ang)
		self.BaseClass.Draw3DHUD(self,vm, pos, ang)
		if !self.Phantom then return end
		local wid, hei = 120, 200
		local x, y = wid * -0.6, hei * -0.5
		local da = self:GetDTBool(12)
		local ablicolor = Color( 75  * (da and 0.5 or 1), 151  * (da and 0.5 or 1), 25  * (da and 0.5 or 1)) 
	
		cam.Start3D2D( pos, ang, self.HUD3DScale / 4)
				self:Draw3DFeatureHorizontal( vm, pos, ang, (da and 1 or 0), nil, nil, "weapon_ability_p_bull", "ZSHUDFont", ablicolor )
		cam.End3D2D()
	end
	
end
