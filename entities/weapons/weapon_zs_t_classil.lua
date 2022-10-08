AddCSLuaFile()

SWEP.Base = "weapon_zs_basefood"

SWEP.PrintName = "Fried baracat"

if CLIENT then
	SWEP.VElements = {
		["base"] = { type = "Model", model = "models/props_junk/garbage_takeoutcarton001a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.75, 2.5, -2), angle = Angle(180, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}

	SWEP.WElements = {
		["base"] = { type = "Model", model = "models/props_junk/garbage_takeoutcarton001a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.75, 2.5, -2), angle = Angle(180, 0, -25), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
end

SWEP.ViewModel = "models/weapons/c_grenade.mdl"
SWEP.WorldModel = "models/props_junk/garbage_takeoutcarton001a.mdl"

SWEP.Primary.Ammo = "foodtakeout"

SWEP.FoodHealth = 234342
SWEP.FoodEatTime = 1
function SWEP:Eat()
	owner = self:GetOwner()
	if !owner:IsSkillActive(SKILL_BARA_CURSED) then 
			timer.Simple(15, function() 
				lastpos = owner:GetPos()
						owner:Kill()
					timer.Simple(0.05, function() 
								owner:KillSilent()
								owner:SetZombieClass(GAMEMODE.ZombieClasses["Baracat"].Index)
								timer.Simple(0.1, function() 
								owner:SetPos(lastpos)
								owner:Respawn()
								owner:DoHulls(GAMEMODE.ZombieClasses["Baracat"].Index, TEAM_UNDEAD)

								end)
				end)
			end)
		end
				self:TakePrimaryAmmo(1)
	if self:GetPrimaryAmmoCount() <= 0 then
		owner:StripWeapon(self:GetClass())
	end
	owner:SetHealth(owner:GetMaxHealth())
end

function SWEP:SecondaryAttack()
	if not self:CanPrimaryAttack() then return end
	self:SetNextPrimaryFire(CurTime() + self.Primary.Delay)

	local owner = self:GetOwner()

	if owner:HasTrinket("processor") then
		owner:EmitSound("weapons/bugbait/bugbait_squeeze1.wav", 65, 150)

		if SERVER then
           owner:Kill()
		end
	end
end