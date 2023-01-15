AddCSLuaFile()

--SWEP.PrintName = "'Reaper' UMP"
--SWEP.Description = "A hard hitting SMG that provides a short duration stacking damage buff if you earn a kill."
SWEP.PrintName = translate.Get("wep_balance")
SWEP.Description = translate.Get("wep_d_balance")

SWEP.Slot = 2
SWEP.SlotPos = 0

if CLIENT then
	SWEP.ViewModelFlip = false
	SWEP.ViewModelFOV = 60

	SWEP.HUD3DBone = "v_weapon.ump45_Release"
	SWEP.HUD3DPos = Vector(-1.5, -3, 2)
	SWEP.HUD3DAng = Angle(0, 0, 0)
	SWEP.HUD3DScale = 0.02
end

SWEP.Base = "weapon_zs_base"

SWEP.HoldType = "ar2"

SWEP.ViewModel = "models/weapons/cstrike/c_smg_ump45.mdl"
SWEP.WorldModel = "models/weapons/w_smg_ump45.mdl"
SWEP.UseHands = true

SWEP.Primary.Sound = Sound("Weapon_UMP45.Single")
SWEP.Primary.Damage = 77
SWEP.Primary.NumShots = 1
SWEP.Primary.Delay = 0.16

SWEP.Primary.ClipSize = 100
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "smg1"
GAMEMODE:SetupDefaultClip(SWEP.Primary)

SWEP.Primary.Gesture = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2
SWEP.ReloadGesture = ACT_HL2MP_GESTURE_RELOAD_AR2

SWEP.ConeMax = 4
SWEP.ConeMin = 2.1

SWEP.WalkSpeed = SPEED_NORMAL

SWEP.ReloadSpeed = 1.05

SWEP.Tier = 6
SWEP.MaxStock = 2
SWEP.AllDamage = false

SWEP.IronSightsPos = Vector(-5.3, -3, 4.4)
SWEP.IronSightsAng = Vector(-1, 0.2, 2.55)

GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_FIRE_DELAY, -0.015)

function SWEP:FinishReload()
	if self.AllDamage then 	BaseClass.FinishReload(self) return end
	self:SendWeaponAnim(ACT_VM_IDLE)
	self:SetNextReload(0)
	self:SetReloadStart(0)
	self:SetReloadFinish(0)
	self:EmitReloadFinishSound()

	local owner = self:GetOwner()
	if not owner:IsValid() then return end

	local max1 = self:GetPrimaryClipSize()
	local max2 = self:GetMaxClip2()

	if max1 > 0 then
		local ammotype = self:GetPrimaryAmmoType()
		local current = self:Clip1()

		self:SetClip1(math.min(100,current + 25))
		if SERVER then
			owner:RemoveAmmo(25, ammotype)
		end
	end
end
GAMEMODE:AddNewRemantleBranch(SWEP, 1, translate.Get("wep_balance_r1"), translate.Get("wep_d_balance_r1"), function(wept)
	wept.Primary.Damage = wept.Primary.Damage * 0.8
	wept.Primary.Delay = wept.Primary.Delay * 1.2
	wept.Primary.ClipSize = 25
	wept.AllDamage = true
end)
function SWEP.BulletCallback(attacker, tr, dmginfo)
	local wep = dmginfo:GetInflictor()
	local hitent = tr.Entity
	if hitent:IsValidLivingZombie() then
		if !wep.AllDamage then
			hitent:AttachmentDamage(dmginfo:GetDamage()*0.25, attacker,wep,(wep:Clip1() <= 100 and wep:Clip1() > 75 and 1 or wep:Clip1() <= 75 and wep:Clip1() > 50 and 2 or wep:Clip1() <= 50 and wep:Clip1() > 25 and 3 or 4))
		else
			for i=1,4 do
				hitent:AttachmentDamage(dmginfo:GetDamage()*0.05, attacker,wep,i)
			end
		end
	end
end
if not CLIENT then return end

function SWEP:Draw3DHUD(vm, pos, ang)
	self.BaseClass.Draw3DHUD(self, vm, pos, ang)
	if self.AllDamage then return end
	local wid, hei = 180, 200
	local x, y = wid * -0.6, hei * -0.5
	local col = Color(218,216,104)
	type2 = translate.Get("wep_chamomile")

	local d = (self:Clip1() <= 100 and self:Clip1() > 75 and 1 or self:Clip1() <= 75 and self:Clip1() > 50 and 2 or self:Clip1() <= 50 and self:Clip1() > 25 and 3 or 4)
	if d == 1 then
		col =  Color(45,63,218)
		type2 = translate.Get("wep_pulse")
	elseif d == 2 then
		col =  Color(45,183,218)
		type2 =  translate.Get("wep_ice")
	elseif d == 3 then
		col =  Color(196,157,31)
		type2 =  translate.Get("wep_fire")
	end

	cam.Start3D2D(pos, ang, self.HUD3DScale)
		draw.SimpleTextBlurry(translate.Get("wep_dmgtype")..type2, "ZS3D2DFontSmall", x + wid/6, y + hei * -0.25, col, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	cam.End3D2D()
end
function SWEP:Draw2DHUD(vm, pos, ang)
	self.BaseClass.Draw2DHUD(self, vm, pos, ang)
	if self.AllDamage then return end
	local screenscale = BetterScreenScale()

	local wid, hei = 180 * screenscale, 64 * screenscale
	local x, y = ScrW() - wid - screenscale * 128, ScrH() - hei - screenscale * 72
	local col = Color(218,216,104)
	type2 =  translate.Get("wep_chamomile")

	local d = (self:Clip1() <= 100 and self:Clip1() > 75 and 1 or self:Clip1() <= 75 and self:Clip1() > 50 and 2 or self:Clip1() <= 50 and self:Clip1() > 25 and 3 or 4)
	if d == 1 then
		col =  Color(45,63,218)
		type2 = translate.Get("wep_pulse")
	elseif d == 2 then
		col =  Color(45,183,218)
		type2 = translate.Get("wep_ice")
	elseif d == 3 then
		col =  Color(196,157,31)
		type2 = translate.Get("wep_fire")
	end
	draw.SimpleTextBlurry( translate.Get("wep_dmgtype")..type2, "ZS3D2DFontSmall", x + wid * 0.30, y + hei * -0.56, col, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
end

