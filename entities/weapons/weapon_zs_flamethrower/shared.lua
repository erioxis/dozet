SWEP.Base = "weapon_zs_baseproj"


SWEP.PrintName = translate.Get("wep_flamethrower")
SWEP.Description = translate.Get("wep_d_flamethrower")

SWEP.Primary.Delay = 0.6

SWEP.ViewModel = "models/weapons/c_shotgun.mdl"
SWEP.WorldModel = "models/weapons/w_crowbar.mdl"

SWEP.InnateDamageType = INNATE_TYPE_FIRE
SWEP.InnateDamageMul = 0

SWEP.MaxStock = 1
SWEP.NextPuke = 0
SWEP.PukeLeft = 0
SWEP.Primary.Damage = 187
SWEP.Primary.Ammo = "chemical"
SWEP.NextAmmoTake = 0
SWEP.RequiredClip = 1
SWEP.Tier = 7
SWEP.Deathtrue = nil
function SWEP:Initialize()
	self.BaseClass.Initialize(self)
end
function SWEP:CanPrimaryAttack()
	if self:GetOwner():GetAmmoCount("chemical") < 1 then
		return false
	end
	return self:GetNextPrimaryFire() <= CurTime()
end
function SWEP:PrimaryAttack()
	if !self:GetOwner():KeyDown(IN_ATTACK) and self:CanPrimaryAttack() and self:GetOwner():WaterLevel() < 2 then return end
	local owner = self:GetOwner()
	if self:GetOwner():GetAmmoCount("chemical") >= 1 then
		owner:EmitSound("ambient/fire/gascan_ignite1.wav")
		owner:EmitSound("ambient/fire/ignite.wav")
		owner:EmitSound("ambient/fire/mtov_flame2.wav")
	end
end
function SWEP:Reload()
end
function SWEP:SecondaryAttack()
end
GAMEMODE:AddNewRemantleBranch(SWEP, 1, translate.Get("wep_flamethrower_r1"), translate.Get("wep_d_flamethrower_r1"), function(wept)
	wept.Primary.Damage = wept.Primary.Damage * 3
	wept.Deathtrue = true
	wept.Primary.Delay = wept.Primary.Delay * 3
	

	wept.OnZombieKilled = function(self, zombie, total, dmginfo)
		local killer = self:GetOwner()
		local minushp = -zombie:Health()
		if killer:IsValid() and minushp > 10 then
			local pos = zombie:GetPos()

			timer.Simple(0.15, function()
				util.BlastDamagePlayer(killer:GetActiveWeapon(), killer, pos, 72, minushp*3, DMG_ALWAYSGIB, 0.92)
			end)

			local effectdata = EffectData()
				effectdata:SetOrigin(pos)
			util.Effect("Explosion", effectdata, true, true)
		end
	end
end)