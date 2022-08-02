AddCSLuaFile()
DEFINE_BASECLASS("weapon_zs_base")

--SWEP.PrintName = "'Eraser' Tactical Pistol"
--SWEP.Description = "Damage increases as remaining bullets decrease."
SWEP.PrintName = translate.Get("wep_marksman")
SWEP.Description = translate.Get("wep_d_marksman")
SWEP.Slot = 1
SWEP.SlotPos = 0

if CLIENT then
	SWEP.ViewModelFOV = 60
	SWEP.ViewModelFlip = false

	SWEP.HUD3DBone = "v_weapon.FIVESEVEN_PARENT"
	SWEP.HUD3DPos = Vector(-1, -2.5, -1)
	SWEP.HUD3DAng = Angle(0, 0, 0)
end

SWEP.Base = "weapon_zs_base"

SWEP.HoldType = "pistol"

SWEP.ViewModel = "models/weapons/cstrike/c_pist_fiveseven.mdl"
SWEP.WorldModel = "models/weapons/w_pist_fiveseven.mdl"
SWEP.UseHands = true

SWEP.Primary.Sound = Sound("weapons/ar2/npc_ar2_altfire.wav")
SWEP.Primary.Damage = 66
SWEP.Primary.NumShots = 1
SWEP.Primary.Delay = 0.15

SWEP.Primary.ClipSize = 12
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "pistol"
GAMEMODE:SetupDefaultClip(SWEP.Primary)

SWEP.ConeMax = 0
SWEP.ConeMin = 0

SWEP.ReloadSpeed = 1
SWEP.HeadshotMulti = 2.4

SWEP.TripleMoney = nil
SWEP.JNumber = 1

SWEP.Tier = 4

SWEP.IronSightsPos = Vector(-5.95, 0, 2.5)
function SWEP:SetCharge(number)
	self:SetDTFloat(11, number)
end
function SWEP:GetCharge()
	return self:GetDTFloat(11)
end

GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_RELOAD_SPEED, 0.1, 1)
GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_HEADSHOT_MULTI, 0.07)
GAMEMODE:AddNewRemantleBranch(SWEP, 1, translate.Get("wep_marksman_r1"), translate.Get("wep_d_marksman_r1"), function(wept)
	wept.ConeMax = wept.ConeMax * 1.7
	wept.ConeMin = wept.ConeMin * 2.1
	wept.Primary.Damage = wept.Primary.Damage * 0.3
	wept.HeadshotMulti = wept.HeadshotMulti * 0.8
	wept.TripleMoney = true
    wept.JNumber = 3
end)


function SWEP:EmitFireSound()
	self:EmitSound("weapons/fiveseven/fiveseven-1.wav", 75, 80 + (1 - (self:Clip1() / self.Primary.ClipSize)) * 30, 0.8, 21)
	self:EmitSound(self.Primary.Sound, 75, 130 + (1 - (self:Clip1() / self.Primary.ClipSize)) * 70, 0.75, 22)
end

function SWEP:ShootBullets(dmg, numbul, cone)
	dmg = dmg + dmg * (1 - self:Clip1() / self.Primary.ClipSize)

	BaseClass.ShootBullets(self, dmg, numbul, cone)
end
function SWEP:EntModify(ent)
end

function SWEP:PhysModify(physobj)
end
function SWEP:SecondaryAttack()
	self:SetNextSecondaryFire(CurTime() + 4)
	self:SetCharge(0)
	timer.Simple(4, function() self:SetCharge(2) end)
	
	if SERVER then

	local owner = self:GetOwner()
 	local ent = ents.Create("projectile_money")
	owner:SetPoints(owner:GetPoints() - 1)
	if ent:IsValid() then
		for i = 1, self.JNumber do
		ent:SetPos(owner:GetShootPos())
		ent:SetAngles(owner:EyeAngles())
		ent:SetOwner(owner)
		ent.ProjDamage = self.Primary.Damage * (owner.ProjectileDamageMul or 1)
		ent.ProjSource = self
		ent.ShotMarker = i
		ent.Team = owner:Team()
		if self.TripleMoney then
			ent.DamageMul = 3
		end
		self:EmitSound("physics/metal/metal_barrel_impact_soft"..math.random(1,4)..".wav")

		self:EntModify(ent)
		ent:Spawn()

		local phys = ent:GetPhysicsObject()
		if phys:IsValid() then
			phys:Wake()
			ent:SetGravity(20000)

			local angle = owner:GetAimVector():Angle()
			angle:RotateAroundAxis(angle:Forward(), ssfw or math.Rand(0, 160))
			angle:RotateAroundAxis(angle:Up(), ssup or math.Rand(0,10))

			ent.PreVel = angle:Forward() * 120 * (owner.ProjectileSpeedMul or 1)
			phys:SetVelocityInstantaneous(ent.PreVel)


			self:PhysModify(phys)
		end
	end
	end
	end
end
if CLIENT then
	local texGradDown = surface.GetTextureID("VGUI/gradient_down")
	function SWEP:DrawHUD()
		local scrW = ScrW()
		local scrH = ScrH()
		local width = 205
		local height = 0
		local x, y = (ScrW()- width)*0.56 , (ScrH() - height)*0.5
			surface.DrawCircle( x, y, 20, 20 / self:GetCharge(), 200 * self:GetCharge(), 120,255 )
		if self.BaseClass.DrawHUD then
			self.BaseClass.DrawHUD(self)
		end
	end
end



