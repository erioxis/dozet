AddCSLuaFile()

<<<<<<< Updated upstream
SWEP.PrintName = "Frying Pan"

=======
SWEP.PrintName = translate.Get("wep_fryingpan")
SWEP.Description = translate.Get("wep_d_fryingpan")
>>>>>>> Stashed changes
if CLIENT then
	SWEP.ViewModelFlip = false
	SWEP.ViewModelFOV = 55

	SWEP.ShowViewModel = false
	SWEP.ShowWorldModel = false

	SWEP.VElements = {
		["base"] = { type = "Model", model = "models/props_c17/metalpot002a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(5, 1.368, -9), angle = Angle(-90, 90, -90), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	SWEP.WElements = {
		["base"] = { type = "Model", model = "models/props_c17/metalpot002a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(5, 1.368, -9), angle = Angle(-90, 90, -90), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
end

SWEP.Base = "weapon_zs_basemelee"

SWEP.DamageType = DMG_CLUB

SWEP.ViewModel = "models/weapons/c_stunstick.mdl"
SWEP.WorldModel = "models/props_c17/metalpot002a.mdl"
SWEP.UseHands = true

SWEP.MeleeDamage = 40
SWEP.MeleeRange = 50
SWEP.MeleeSize = 1.15

SWEP.UseMelee1 = true  

SWEP.HitGesture = ACT_HL2MP_GESTURE_RANGE_ATTACK_MELEE
SWEP.MissGesture = SWEP.HitGesture

SWEP.SwingRotation = Angle(30, -30, -30)
SWEP.SwingTime = 0.3
SWEP.SwingHoldType = "grenade"

SWEP.AllowQualityWeapons = true
SWEP.Culinary = true

GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_FIRE_DELAY, -0.1)

function SWEP:PlayHitSound()
	self:EmitSound("weapons/melee/frying_pan/pan_hit-0"..math.random(4)..".ogg")
end
local validity_trace = {
	start = Vector(0, 0, 0), endpos = Vector(0, 0, 0), mins = Vector(-18, -18, 0), maxs = Vector(18, 18, 2), mask = MASK_SOLID_BRUSHONLY
}
function SWEP:OnMeleeHit(hitent, hitflesh, tr)
	if hitent:IsValid() and hitent:IsPlayer() and not self.m_FaceStabbing and math.abs(hitent:GetForward():Angle().yaw - self:GetOwner():GetForward():Angle().yaw) >= 90 and SERVER then
		self.m_FaceStabbing = true
		self.MeleeDamage = self.MeleeDamage * 1.5
		if math.random(1,10) == 1 then
			hitent:GiveStatus("stunned",3)
			self.m_StunSuccess = true 
			self.MeleeDamage = self.MeleeDamage * 3
			local owner = self:GetOwner()
			local pos = hitent:GetPos()-hitent:GetForward()*40
			validity_trace.start:Set(pos)
			validity_trace.start.z = pos.z + 1
			validity_trace.endpos:Set(pos)
			validity_trace.endpos = hitent:GetPos()-hitent:GetForward()*65
			if !util.TraceHull(validity_trace).Hit then
				owner:SetPos(pos)
				owner:SetEyeAngles((hitent:LocalToWorld(hitent:OBBCenter())-owner:LocalToWorld(owner:OBBCenter())):GetNormal():Angle())
			end
			timer.Simple(0, function()
				self:MeleeSwing()
			end)
		end
	end
	
end

function SWEP:PostOnMeleeHit(hitent, hitflesh, tr)
	if self.m_FaceStabbing then
		self.m_FaceStabbing = false
		if self.m_StunSuccess then
			self.m_StunSuccess = false
			self.MeleeDamage = self.MeleeDamage / 3
		end
		self.MeleeDamage = self.MeleeDamage / 1.5
	end
	if hitent and hitent:IsPlayer() and hitent:GetStatus('stunned') then
		self:SetNextPrimaryFire(CurTime() + self.Primary.Delay * 0.3 * self:GetOwner():GetMeleeSpeedMul())
	end
end
