AddCSLuaFile()
DEFINE_BASECLASS("weapon_zs_base")

--SWEP.PrintName = "'Ricochete' Magnum"
--SWEP.Description = "This gun's bullets will bounce off of walls which will then deal extra damage."
SWEP.PrintName = translate.Get("wep_overmagnum")
SWEP.Description = translate.Get("wep_d_overmagnum")
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
SWEP.Primary.Damage = 77
SWEP.Primary.NumShots = 1

SWEP.Primary.ClipSize = 6
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "pistol"
SWEP.Primary.Gesture = ACT_HL2MP_GESTURE_RANGE_ATTACK_PISTOL
GAMEMODE:SetupDefaultClip(SWEP.Primary)

SWEP.Tier = 2
SWEP.RemnantDamage = 0

SWEP.ConeMax = 0
SWEP.ConeMin = 0
SWEP.BounceMulti = 2

SWEP.IronSightsPos = Vector(-4.65, 4, 0.25)
SWEP.IronSightsAng = Vector(0, 0, 1)
GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_MAX_SPREAD, -0.7, 1)
GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_MIN_SPREAD, -0.35, 1)
GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_FIRE_DELAY, -0.07, 1)

function SWEP.BulletCallback(attacker, tr, dmginfo)
	local infl = dmginfo:GetInflictor()
	if infl then
		local dmg = math.Clamp(infl:GetDTInt(9)/3,0,2000)
		dmginfo:SetDamage(dmginfo:GetDamage() + dmg)
		infl:SetDTInt(9,dmg)
	end
	if !CLIENT then return end
	local pos = tr.HitPos
	local emitter = ParticleEmitter( pos )
	local ent = not tr.Entity:IsValidLivingZombie()
	for i=1,13 do
		emitter:SetNearClip(24, 32)
		local particle = emitter:Add("effects/blood2", pos + VectorRand():GetNormalized() * math.random(1,16) )
		if particle then
			particle:SetDieTime( 2 )
			particle:SetStartSize( math.Rand(2,7) )
			particle:SetEndSize(0)
			particle:SetColor( 255 * (ent and 0.2 or 1), 12 * (ent and 2 or 1), 25 * (ent and 4 or 1) )
			particle:SetStartAlpha( 255  )
			particle:SetEndAlpha( 12 )
			particle:SetRoll( math.random( 0, 360 ) )
			particle:SetVelocity(attacker:LocalToWorld(attacker:OBBCenter())-tr.HitPos)
			timer.Simple(0, function()
				if tr.Entity:IsValid() and tr.Entity:Alive() then
					particle:SetPos(Vector(0,0,0))
				end
			end)
		end
	end
end
function SWEP:OnZombieKilled(pl, totaldamage, dmginfo)
	local killer = self:GetOwner()
	local minushp = -pl:Health()
	if minushp > 0 then
		self:SetDTInt(9,self:GetDTInt(9) + minushp*2)
	end
end



if not CLIENT then return end

function SWEP:DrawWeaponSelection(x, y, w, h, alpha)
	self:BaseDrawWeaponSelection(x, y, w, h, alpha)
end
function SWEP:DrawHUD()
	self:Draw2DHUD()
end
local texGradDown = surface.GetTextureID("VGUI/gradient_down")
function SWEP:Draw2DHUD()
	local owner = self:GetOwner()
		local wid, hei = 384, 16
		local x, y = ScrW() - wid - 32, ScrH() - hei - 72
		local texty = y - 4 - draw.GetFontHeight("ZSHUDFontSmall")

	
		draw.SimpleText("Остаточный урон: "..self:GetDTInt(9), "ZSHUDFontSmall", x + wid -120, texty, COLOR_GREEN, TEXT_ALIGN_RIGHT)
	self:DrawCrosshairDot()
end


