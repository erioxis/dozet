AddCSLuaFile()
DEFINE_BASECLASS( "weapon_zs_basemagic" )

SWEP.Base = "weapon_zs_basemagic"

SWEP.ViewModel = "models/weapons/c_stunstick.mdl"
SWEP.WorldModel = "models/weapons/w_crowbar.mdl"
SWEP.UseHands = true

SWEP.HoldType = "melee2"
SWEP.PrintName = translate.Get("wep_m_milky")
SWEP.Description = translate.Get("wep_d_m_milky")

SWEP.MeleeDamage = 65
SWEP.MeleeRange = 72
SWEP.MeleeSize = 4.5
SWEP.MeleeKnockBack = 184

SWEP.AOEDamage = true

SWEP.MeleeDamageSecondaryMul = 1.4
SWEP.MeleeKnockBackSecondaryMul = 1.5

SWEP.StaminaTake = 8
SWEP.StaminaEffect = 0.3

SWEP.Primary.Delay = 1.2
SWEP.Secondary.Delay = SWEP.Primary.Delay * 0.85

SWEP.WalkSpeed = SPEED_SLOWER

SWEP.DamageType = DMG_ALWAYSGIB

SWEP.HitAnim = ACT_VM_MISSCENTER

SWEP.SwingRotation = Angle( 60, 0, -80 )
SWEP.SwingOffset = Vector( 0, -30, 0 )
SWEP.SwingTime = 0.45
SWEP.SwingHoldType = "melee"

SWEP.SwingTimeSecondary = 0.87
SWEP.Primary.ArmorBleed = 12
SWEP.Tier = 2

SWEP.AllowQualityWeapons = true
SWEP.ShowViewModel = false
SWEP.ShowWorldModel = false

SWEP.ViewModelBoneMods = {
	["ValveBiped.Bip01_Spine4"] = { scale = Vector(1, 1, 1), pos = Vector(0.368, 0, 0), angle = Angle(0, 0, 0) }
}
SWEP.VElements = {
	["1"] = { type = "Model", model = "models/props_trainstation/trainstation_column001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(7.098, 2.592, -27.761), angle = Angle(8.784, 2.973, 176.763), size = Vector(-0.132, -0.132, -0.132), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["1+"] = { type = "Model", model = "models/Combine_Helicopter/helicopter_bomb01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(7.769, 2.604, -30.632), angle = Angle(8.784, 2.973, 176.763), size = Vector(-0.132, -0.132, -0.132), color = Color(25, 14, 250, 255), surpresslightning = false, material = "models/alyx/emptool_glow", skin = 0, bodygroup = {} },
	["1++"] = { type = "Model", model = "models/Combine_Helicopter/helicopter_bomb01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(7.769, 2.604, -30.632), angle = Angle(8.784, 2.973, 176.763), size = Vector(-0.132, -0.132, -0.132), color = Color(25, 14, 250, 255), surpresslightning = false, material = "models/effects/portalrift_sheet", skin = 0, bodygroup = {} },
	["1+++"] = { type = "Model", model = "models/Combine_Helicopter/helicopter_bomb01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(7.769, 2.604, -30.632), angle = Angle(8.784, 2.973, 176.763), size = Vector(-0.132, -0.132, -0.132), color = Color(25, 11, 250, 255), surpresslightning = false, material = "models/props_combine/stasisshield_sheet", skin = 0, bodygroup = {} },
	["1++++"] = { type = "Model", model = "models/mechanics/robotics/stand.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(7.098, 2.592, -27.761), angle = Angle(8.784, 7.625, 176.763), size = Vector(-0.03, 0.048, -0.007), color = Color(61, 46, 46, 255), surpresslightning = true, material = "models/props_pipes/pipesystem01a_skin2", skin = 0, bodygroup = {} },
	["1+++++"] = { type = "Model", model = "models/mechanics/robotics/stand.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(7.098, 2.592, -27.907), angle = Angle(-2.566, 94.497, 176.763), size = Vector(-0.03, 0.048, -0.007), color = Color(74, 54, 54, 255), surpresslightning = true, material = "models/props_pipes/pipesystem01a_skin2", skin = 0, bodygroup = {} },
	["w"] = { type = "Model", model = "models/Combine_Helicopter/helicopter_bomb01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(7.769, 2.604, -30.632), angle = Angle(8.784, 2.973, 176.763), size = Vector(-0.132, -0.132, -0.132), color = Color(25, 14, 250, 255), surpresslightning = false, material = "models/alyx/emptool_glow", skin = 0, bodygroup = {} }
}

SWEP.WElements = {
	["1"] = { type = "Model", model = "models/props_trainstation/trainstation_column001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(7.098, 2.592, -27.761), angle = Angle(8.784, 2.973, 176.763), size = Vector(-0.132, -0.132, -0.132), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["1+"] = { type = "Model", model = "models/Combine_Helicopter/helicopter_bomb01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(7.769, 2.604, -30.632), angle = Angle(8.784, 2.973, 176.763), size = Vector(-0.132, -0.132, -0.132), color = Color(255, 114, 0, 255), surpresslightning = false, material = "models/alyx/emptool_glow", skin = 0, bodygroup = {} },
	["1++"] = { type = "Model", model = "models/Combine_Helicopter/helicopter_bomb01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(7.769, 2.604, -30.632), angle = Angle(8.784, 2.973, 176.763), size = Vector(-0.132, -0.132, -0.132), color = Color(255, 114, 0, 255), surpresslightning = false, material = "models/effects/portalrift_sheet", skin = 0, bodygroup = {} },
	["1+++"] = { type = "Model", model = "models/Combine_Helicopter/helicopter_bomb01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(7.769, 2.604, -30.632), angle = Angle(8.784, 2.973, 176.763), size = Vector(-0.132, -0.132, -0.132), color = Color(255, 114, 0, 255), surpresslightning = false, material = "models/props_combine/stasisshield_sheet", skin = 0, bodygroup = {} },
	["1++++"] = { type = "Model", model = "models/mechanics/robotics/stand.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(7.098, 2.592, -27.761), angle = Angle(8.784, 7.625, 176.763), size = Vector(-0.03, 0.048, -0.007), color = Color(61, 46, 46, 255), surpresslightning = true, material = "models/props_pipes/pipesystem01a_skin2", skin = 0, bodygroup = {} },
	["1+++++"] = { type = "Model", model = "models/mechanics/robotics/stand.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(7.098, 2.592, -27.907), angle = Angle(-2.566, 94.497, 176.763), size = Vector(-0.03, 0.048, -0.007), color = Color(74, 54, 54, 255), surpresslightning = true, material = "models/props_pipes/pipesystem01a_skin2", skin = 0, bodygroup = {} },
	["w"] = { type = "Model", model = "models/Combine_Helicopter/helicopter_bomb01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(7.769, 2.604, -30.632), angle = Angle(8.784, 2.973, 176.763), size = Vector(-0.132, -0.132, -0.132), color = Color(25, 14, 250, 255), surpresslightning = false, material = "models/alyx/emptool_glow", skin = 0, bodygroup = {} }
}

GAMEMODE:AttachWeaponModifier( SWEP, WEAPON_MODIFIER_FIRE_DELAY, -0.06 )




function SWEP:PrimaryAttack()
	local owner = self:GetOwner()
	if not owner:IsValid() then return end
	if not owner:IsSkillActive(SKILL_MAGIC) then return end
	if not self:CanPrimaryAttack() then return end
	if ( SERVER ) and 	owner:GetBloodArmor() > 0 and self.Primary.ArmorBleed <= owner:GetBloodArmor()  then
		local ent = ents.Create("projectile_magicwand")
		local owner = self:GetOwner()
		if ent:IsValid() then
			ent:SetPos( owner:GetShootPos() )

			local angle = owner:GetAimVector():Angle()
			angle:RotateAroundAxis( angle:Up(), 90 )
			ent:SetAngles( angle )


			ent:SetOwner( owner )

			ent.ProjDamage = (self.MeleeDamage  + owner:GetBloodArmor()/10 )* ( owner.ProjectileDamageMul or 1 ) * (owner.MagicDamage or 1) 
			ent.ProjSource = self
			ent.Team = owner:Team()

			ent:Spawn()

			local phys = ent:GetPhysicsObject()
			if phys:IsValid() then
				phys:Wake()

				angle = owner:GetAimVector():Angle()
				phys:SetVelocityInstantaneous( angle:Forward() * 850 * ( owner.ProjectileSpeedMul or 1 ) )
			end
			owner:SetBloodArmor(owner:GetBloodArmor() - self.Primary.ArmorBleed * (owner.MagicDamage or 1))
			owner:EmitSound("npc/vort/attack_shoot.wav", 75, math.random(155,165), 0.4)
			owner:EmitSound("weapons/gauss/fire1.wav", 75, math.random(125,115), 0.4) 
			owner:EmitSound("ambient/machines/combine_terminal_idle2.wav", 75, math.random(65,75), 1.7)
		end
	end
end