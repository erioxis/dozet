AddCSLuaFile()

--SWEP.PrintName = "'Classic' Rifle"
--SWEP.Description = "Хаха классика."
SWEP.PrintName = translate.Get("wep_ricosic")
SWEP.Description = translate.Get("wep_d_ricosic")
SWEP.Slot = 3
SWEP.SlotPos = 0

if CLIENT then
	SWEP.ViewModelFlip = false
	SWEP.ViewModelFOV = 60

	SWEP.HUD3DBone = "v_weapon.awm_parent"
	SWEP.HUD3DPos = Vector(-1.25, -3.5, -16)
	SWEP.HUD3DAng = Angle(0, 0, 0)
	SWEP.HUD3DScale = 0.02
end

sound.Add(
{
	name = "Weapon_Hunter.Single",
	channel = CHAN_WEAPON,
	volume = 1.0,
	soundlevel = 100,
	pitchstart = 134,
	pitchend = 10,
	sound = "weapons/awp/awp1.wav"
})

SWEP.Base = "weapon_zs_base"

SWEP.HoldType = "ar2"

SWEP.ViewModel = "models/weapons/cstrike/c_snip_awp.mdl"
SWEP.WorldModel = "models/weapons/w_snip_awp.mdl"
SWEP.UseHands = true

SWEP.ReloadSound = Sound("Weapon_AWP.ClipOut")
SWEP.Primary.Sound = Sound("Weapon_Hunter.Single")
SWEP.Primary.Damage = 65
SWEP.Primary.NumShots = 1
SWEP.Primary.Delay = 0.9
SWEP.ReloadSpeed = 1
SWEP.ReloadDelay = SWEP.Primary.Delay

SWEP.Primary.ClipSize = 4
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "357"
SWEP.Primary.DefaultClip = 30

SWEP.Primary.Gesture = ACT_HL2MP_GESTURE_RANGE_ATTACK_CROSSBOW
SWEP.ReloadGesture = ACT_HL2MP_GESTURE_RELOAD_SHOTGUN

SWEP.ConeMax = 1
SWEP.ConeMin = 1

SWEP.IronSightsPos = Vector(5.015, -8, 2.52)
SWEP.IronSightsAng = Vector(0, 0, 0)

SWEP.WalkSpeed = SPEED_SLOWER

SWEP.Tier = 5

SWEP.TracerName = "AR2Tracer"

GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_RELOAD_SPEED, 0.3)
GAMEMODE:AddNewRemantleBranch(SWEP, 1, translate.Get("wep_ricosic_r1"), translate.Get("wep_d_ricosic_r1"), function(wept)
	wept.Primary.ClipSize = 4
	wept.Primary.NumShots = 1
	wept.Primary.Damage = wept.Primary.Damage * 2.5
	wept.HeadshotMulti = 4
	wept.RequiredClip = 4
	wept.ReloadSpeed = 0.6

	wept.BulletCallback = function(attacker, tr, dmginfo)
		wept.BaseClass.BulletCallback(attacker, tr, dmginfo)
		local effectdata = EffectData()
			effectdata:SetOrigin(tr.HitPos)
			effectdata:SetNormal(tr.HitNormal)
		util.Effect("hit_hunter", effectdata)
		if CLIENT or tr.HitSky then return end
		local me = wept
		for i=1,7 do
			timer.Simple(0.1, function() me:FireBulletsLua(tr.HitPos+Vector(0,0,5), (tr.StartPos - tr.HitPos):GetNormal(), 10*i, 1, me.Primary.Damage*0.6, attacker, 1, "tracer_rico", nil, nil, nil, 1028, nil) end)
		end
	end
end)

function SWEP:IsScoped()
	return self:GetIronsights() and self.fIronTime and self.fIronTime + 0.25 <= CurTime()
end

function SWEP:SendWeaponAnimation()
	self:SendWeaponAnim(ACT_VM_PRIMARYATTACK)

	local owner = self:GetOwner()
	local vm = owner:GetViewModel()
	local speed = self.ReloadSpeed * self:GetReloadSpeedMultiplier()

	if vm:IsValid() then
		vm:SetPlaybackRate(0.5 * speed)
	end

	self:SetReloadFinish(CurTime() + 2.5 / speed)
end

function SWEP:MockReload()
	local speed = self.ReloadSpeed * self:GetReloadSpeedMultiplier()
	self:SetReloadFinish(CurTime() + 2.5 / speed)
end

function SWEP:Reload()
	local owner = self:GetOwner()
	if owner:IsHolding() then return end

	if self:GetIronsights() then
		self:SetIronsights(false)
	end

	if self:CanReload() then
		self:MockReload()
	end
end

function SWEP:Deploy()
	self.BaseClass.Deploy(self)

	if self:Clip1() <= 0 then
		self:MockReload()
	end

	return true
end

function SWEP:Think()
	self.BaseClass.Think(self)

	if self:Clip1() <= 0 and self:GetPrimaryAmmoCount() <= 0 then
		self:MockReload()
	end
end

function SWEP.BulletCallback(attacker, tr, dmginfo)
	local inflictor = dmginfo:GetInflictor()
	inflictor.BaseClass.BulletCallback(attacker, tr, dmginfo)
	local effectdata = EffectData()
		effectdata:SetOrigin(tr.HitPos)
		effectdata:SetNormal(tr.HitNormal)
	util.Effect("hit_hunter", effectdata)
	if CLIENT or tr.HitSky then return end
	for i=1,5 do
		local zombie = team.GetPlayers(TEAM_UNDEAD)[math.random(1,#team.GetPlayers(TEAM_UNDEAD))]
		timer.Simple(0.09*i, function() inflictor:FireBulletsLua(tr.HitPos+zombie:GetForward()*12, (zombie:LocalToWorld(zombie:OBBCenter()) - tr.HitPos):GetNormal(), 10*i, 1, (inflictor.Primary.Damage or 200)*1.4, attacker, 1, "tracer_rico", nil, nil, nil, 1028, nil) end)
	end
end

--[[[ Рикошееты - рандом
	function SWEP.BulletCallback(attacker, tr, dmginfo)
	local effectdata = EffectData()
		effectdata:SetOrigin(tr.HitPos)
		effectdata:SetNormal(tr.HitNormal)
	util.Effect("hit_hunter", effectdata)
	if CLIENT then return end
	local ent = ents.Create("projectile_placeholder")
	ent:Spawn()
	ent:SetPos(tr.HitPos+Vector(0,0,10))
	for i=1,9 do
		timer.Simple(0.05*i, function() ent:FireBulletsLua(ent:GetPos(), VectorRand(-1000,5000), 0, 1, dmginfo:GetDamage(), attacker, 1, "AR2Tracer", nil, 1, nil, 1028, nil, attacker:GetActiveWeapon()) end)
	end
end
]]
if CLIENT then
	SWEP.IronsightsMultiplier = 0.25

	function SWEP:GetViewModelPosition(pos, ang)
		if GAMEMODE.DisableScopes then return end

		if self:IsScoped() then
			return pos + ang:Up() * 256, ang
		end

		return self.BaseClass.GetViewModelPosition(self, pos, ang)
	end

	function SWEP:DrawHUDBackground()
		if GAMEMODE.DisableScopes then return end

		if self:IsScoped() then
			self:DrawRegularScope()
		end
	end
end
