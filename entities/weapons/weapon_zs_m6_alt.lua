AddCSLuaFile()
DEFINE_BASECLASS("weapon_zs_base")

--SWEP.PrintName = "'Amalgama' M6"
--SWEP.Description = "Very Strange weapon,have some souls,upgrade per kill(if you don't kill zombie every 120 sec upgrade has dismantled)..."
SWEP.PrintName = translate.Get("wep_m6_alt")
SWEP.Description = translate.Get("wep_d_m6_alt")
SWEP.Slot = 2
SWEP.SlotPos = 0


if CLIENT then
	SWEP.ViewModelFlip = true
	SWEP.ViewModelFOV = 60

	SWEP.VElements = {
		["01"] = { type = "Model", model = "models/props_c17/canister02a.mdl", bone = "v_weapon.m4_Eject", rel = "", pos = Vector(0.371, 0.287, 12.675), angle = Angle(-179.616, -4.031, 0.769), size = Vector(0.2, 0.2, 0.2), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	SWEP.WElements = {
		["zerotwo"] = { type = "Model", model = "models/props_c17/canister02a.mdl", bone = "ValveBiped.Anim_Attachment_RH", rel = "", pos = Vector(-0.642, -7.402, 22.31), angle = Angle(179.67101, -5.116, 11.197), size = Vector(0.3, 0.3, 0.3), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["zerotwo2"] = { type = "Model", model = "models/props_c17/lampshade001a.mdl", bone = "ValveBiped.Anim_Attachment_RH", rel = "", pos = Vector(-0.579, -9.517, 31.578), angle = Angle(-2.027, 4.705, -19.274), size = Vector(0.2, 0.2, 0.2), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	
	
	SWEP.HUD3DBone = "v_weapon.m4_Parent"

end

SWEP.AllowQualityWeapons = false

SWEP.Base = "weapon_zs_base"


SWEP.ViewModel = "models/weapons/v_rif_m4a1.mdl"
SWEP.WorldModel = "models/weapons/w_rif_m4a1.mdl"
SWEP.Primary.Sound = Sound("Weapon_m4a1.Single")
SWEP.Primary.Damage = 810
SWEP.Primary.NumShots = 1
SWEP.Primary.Delay = 0.16


SWEP.Primary.ClipSize = 13
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "ar2"
GAMEMODE:SetupDefaultClip(SWEP.Primary)
SWEP.HoldType = "ar2"


SWEP.ConeMax = 4
SWEP.ConeMin = 0.9

SWEP.WalkSpeed = SPEED_SLOW

SWEP.Tier = 7
SWEP.MaxStock = 1
function SWEP:OnZombieKilled()
	self.Primary.Damage = self.Primary.Damage - 2
end


SWEP.IronSightsPos = Vector(-3, 0, 2)

function SWEP:SetNextShot(nextshot)
	self:SetDTFloat(5, nextshot)
end

function SWEP:GetNextShot()
	return self:GetDTFloat(5)
end

function SWEP:SetShotsLeft(shotsleft)
	self:SetDTInt(1, shotsleft)
end

function SWEP:GetShotsLeft()
	return self:GetDTInt(1)
end

function SWEP:GetAuraRange()
	return 1028
end
function SWEP:OnDropDo(wep)
	local owner = 	self:GetOwner()
	local drop = "cons_soul_picka" 
	for i=1,3 do
		local pos = self:LocalToWorld(self:OBBCenter())
		local ent = ents.Create("prop_invitem")
		if ent:IsValid() then
			ent:SetPos(pos)
			ent:SetAngles(AngleRand())
			ent:SetInventoryItemType(drop)
			if owner and owner:IsValidLivingHuman() then
				ent:SetOwner(owner)
			end
			ent:Spawn()
			local phys = ent:GetPhysicsObject()
			if phys:IsValid() then
				phys:Wake()
				phys:SetVelocityInstantaneous(VectorRand():GetNormalized() * math.Rand(24, 100))
				phys:AddAngleVelocity(VectorRand() * 200)
			end
		end
	end
	timer.Simple(0, function(arguments)
		wep:Remove()
	end)
	return true
end