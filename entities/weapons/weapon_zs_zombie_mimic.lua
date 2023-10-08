AddCSLuaFile()

SWEP.PrintName = "Mimic"

SWEP.Base = "weapon_zs_zombie"

SWEP.MeleeDamage = 23
SWEP.MeleeDamageVsProps = 32
SWEP.MeleeDamageType = DMG_DIRECT

SWEP.AlertDelay = 2.75
SWEP.ZombieOnly = false
function SWEP:Reload()
	self:SecondaryAttack()
end
local exlude_m = {"prop_weapon","prop_invitem"}
local exlude = {"prop_obj_sigil"}
function SWEP:SecondaryAttack()
	if self:GetNextSecondaryFire() >= CurTime() then return end
	local own = self:GetOwner()
	local trc = own:GetEyeTrace()
	local ent = trc.Entity
	if ent and ent:IsValid() and !ent:IsValidLivingPlayer() and !table.HasValue(exlude,ent:GetClass()) and SERVER and !self.MissEnt then
		local class = ent:GetClass()
		local g = ents.Create(class)
		if !exlude_m[class] then
			g:SetModel(ent:GetModel())
		end
		if ent.SetWeaponType then
			g:SetWeaponType(ent:GetWeaponType())
		end
		if ent.SetAmmoType then
			g:SetAmmoType(ent:GetAmmoType())
			g:SetAmmo(ent:GetAmmo())
		end
		if ent.SetInventoryItemType then
			g:SetInventoryItemType(ent:GetInventoryItemType())
		end
		local psis = own:GetPos()
		g:SetPos(psis+Vector(0,0,10))
		g:SetOwner(own)
		own:SetDTEntity(12,g)
		g:Spawn()
		timer.Simple(0, function()
			g.SetObjectOwner = nil 
			g.Think = nil
			g.OnTakeDamage = nil
			g.Use = nil
			local phys = g:GetPhysicsObject()
			if phys and phys:IsValid() then
				phys:Wake()
			end
			g.IgnoreUse = true
			g.OnRemoveMimic = g.OnRemove
			g.OnRemove = function()
				g:OnRemoveMimic()
				if own:IsValid() then
					own:SetPos(g:GetPos()+Vector(0,0,20))
					own:SetDTEntity(12,NULL)
					own:SetModelScale(1)
					local sss = own:GetStatus("mimic_q")
					if sss then
						sss:SetStateEndTime(0)
						sss:Remove()
					end
				end
			end
		end)
		own:SetModelScale(0)
		own:GiveStatus("mimic_q",99999):SetStateEndTime(CurTime()+3000)
		self.MissEnt = g
		own.MimicThink = CurTime() +1
	end
	self.BaseClass.SecondaryAttack(self)
end

function SWEP:PlayAttackSound()
	self:EmitSound("npc/zombie/zo_attack"..math.random(2)..".wav", 70, math.random(87, 92))
end

function SWEP:PlayAlertSound()
	self:GetOwner():EmitSound("npc/zombie/zombie_alert"..math.random(3)..".wav", 70, math.random(87, 92))
end

function SWEP:PlayIdleSound()
	self:GetOwner():EmitSound("npc/zombie/zombie_voice_idle"..math.random(14)..".wav", 70, math.random(87, 92))
end
function SWEP:PrimaryAttack()
	if CurTime() < self:GetNextPrimaryFire() or IsValid(self:GetOwner().FeignDeath) then return end

	local owner = self:GetOwner()
	local armdelay = owner:GetMeleeSpeedMul()
	local eda = self.MissEnt 
	if eda and eda:IsValid() then
		eda:Remove()
	end
	local sss = owner:GetStatus("mimic_q")
	if sss and SERVER then
		sss:SetStateEndTime(0)
		sss:Remove()
		owner:SetPos(owner:GetDTEntity(12):GetPos()+Vector(0,0,20))
	end
	owner:SetModelScale(1)
	owner:SetDTEntity(12,nil)
	self.MissEnt = nil

	self:SetNextPrimaryFire(CurTime() + self.Primary.Delay * armdelay)
	self:SetNextSecondaryFire(self:GetNextPrimaryFire() + 0.1)

	self:StartSwinging()
end
function SWEP:MeleeHit(ent, trace, damage, forcescale)
	if not ent:IsPlayer() then
		damage = self.MeleeDamageVsProps
	end

	self.BaseClass.MeleeHit(self, ent, trace, damage, forcescale)
end

if not CLIENT then return end

function SWEP:ViewModelDrawn()
	render.ModelMaterialOverride(0)
end

function SWEP:PreDrawViewModel(vm)
	render.SetColorModulation(0.129, 0.725, 0.906)
end
