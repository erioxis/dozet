AddCSLuaFile()
DEFINE_BASECLASS( "weapon_zs_basemelee" )
SWEP.Base 			= 	"weapon_zs_basemelee"

SWEP.Hidden = true

SWEP.Secondary.ClipSize 		= 	0
SWEP.Secondary.DefaultClip 		= 	0
SWEP.Secondary.Ammo 			= 	"dummy"
SWEP.Secondary.Automatic 		=	 true

SWEP.Slot 			= 	0
SWEP.SlotPos 		= 	0

SWEP.HUD3DBone = "ValveBiped.Bip01_R_Hand"
SWEP.HUD3DPos = Vector(0, -1, -7)
SWEP.HUD3DAng = Angle(180, -90, 90)
SWEP.HUD3DScale = 0.055

SWEP.ViewModel 		= 	"models/weapons/c_crowbar.mdl"
SWEP.WorldModel 	= 	"models/weapons/w_crowbar.mdl"
SWEP.UseHands 		= 	true

SWEP.HoldType 		= 	"melee2"
SWEP.ViewModelFOV = 71
SWEP.ShowViewModel = false
SWEP.ShowWorldModel = false

SWEP.VElements = {
	["blade1"] = { type = "Model", model = "models/gibs/furniture_gibs/furnituretable001a_chunk04.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "sanity", pos = Vector(10.605, 0, -0.394), angle = Angle(0, 0, 0), size = Vector(1.299, 1.149, 1.036), color = Color(63, 8, 136, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
	["blade2"] = { type = "Model", model = "models/gibs/furniture_gibs/furnituretable001a_chunk04.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "sanity", pos = Vector(-14.16, 1.792, -6.565), angle = Angle(0, 0, -90), size = Vector(1.549, 2.589, 1.873), color = Color(62, 0, 133, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
	["fdsgf"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk04.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "sanity", pos = Vector(10.982, -1.071, -0.514), angle = Angle(90, 0, 0), size = Vector(0.144, 0.144, 0.527), color = Color(39, 0, 82, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["glw"] = { type = "Sprite", sprite = "sprites/glow07", bone = "ValveBiped.Bip01_R_Hand", rel = "sanity", pos = Vector(-8.129, 0, 0), size = { x = 28.488, y = 28.488 }, color = Color(100, 0, 255, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["glw+"] = { type = "Sprite", sprite = "sprites/glow07", bone = "ValveBiped.Bip01_R_Hand", rel = "sanity", pos = Vector(-15.207, 1.304, -0.219), size = { x = 39.986, y = 39.986 }, color = Color(76, 8, 155, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["glw++"] = { type = "Sprite", sprite = "sprites/glow07", bone = "ValveBiped.Bip01_R_Hand", rel = "sanity", pos = Vector(19.152, 0, 0), size = { x = 35.273, y = 35.273 }, color = Color(100, 0, 255, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["glw+++"] = { type = "Sprite", sprite = "sprites/glow07", bone = "ValveBiped.Bip01_R_Hand", rel = "blade1", pos = Vector(22.038, 0, 0), size = { x = 25.401, y = 25.401 }, color = Color(100, 0, 255, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["glw++++"] = { type = "Sprite", sprite = "sprites/glow07", bone = "ValveBiped.Bip01_R_Hand", rel = "sanity", pos = Vector(-11.728, 0, 0), size = { x = 29.563, y = 29.563 }, color = Color(100, 0, 255, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["glw+++++"] = { type = "Sprite", sprite = "sprites/glow07", bone = "ValveBiped.Bip01_R_Hand", rel = "sanity", pos = Vector(-3.014, 0, 0), size = { x = 30.581, y = 30.581 }, color = Color(100, 0, 255, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["glw++++++"] = { type = "Sprite", sprite = "sprites/glow07", bone = "ValveBiped.Bip01_R_Hand", rel = "sanity", pos = Vector(5.443, 0, 0), size = { x = 27.604, y = 27.604 }, color = Color(100, 0, 255, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["glw+++++++"] = { type = "Sprite", sprite = "sprites/glow07", bone = "ValveBiped.Bip01_R_Hand", rel = "blade2", pos = Vector(3.605, 4.047, 0.773), size = { x = 31.601, y = 31.601 }, color = Color(100, 0, 255, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["glw++++++++"] = { type = "Sprite", sprite = "sprites/glow07", bone = "ValveBiped.Bip01_R_Hand", rel = "blade2", pos = Vector(-2.168, 3.704, 0.451), size = { x = 31.601, y = 31.601 }, color = Color(100, 0, 255, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["midaxe"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk04.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "sanity", pos = Vector(-21.404, 0, -1.336), angle = Angle(90, 0, 0), size = Vector(0.25, 0.25, 0.226), color = Color(63, 0, 127, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
	["sanity"] = { type = "Model", model = "models/props_debris/concrete_chunk04a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.74, 1.307, -12.678), angle = Angle(90, 0, 0), size = Vector(1.726, 0.317, 0.4), color = Color(68, 3, 142, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
	["sanityd+"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk01.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "sanity", pos = Vector(-17.275, 0, 0.708), angle = Angle(-66.639, 0, 0), size = Vector(0.052, 0.052, 0.052), color = Color(83, 5, 172, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
	["sanityd+"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk01.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "sanity", pos = Vector(-11.275, -0.5, 0.508), angle = Angle(-96.639, 0, 0), size = Vector(0.022, 0.042, 0.082), color = Color(86, 5, 172, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
	["sanityd++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk01.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "sanity", pos = Vector(-15.025, 1.037, -0.649), angle = Angle(-90, 0, 0), size = Vector(0.103, 0.103, 0.103), color = Color(45, 4, 91, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
	["sanityda"] = { type = "Model", model = "models/props_debris/concrete_chunk04a.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "sanity", pos = Vector(-9.214, 0, 1.098), angle = Angle(90, 0, 0), size = Vector(0.141, 0.141, 0.776), color = Color(68, 4, 142, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
	["sanityda+"] = { type = "Model", model = "models/props_debris/concrete_chunk04a.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "sanity", pos = Vector(-5.362, 0, -0.835), angle = Angle(-90, 0, 0), size = Vector(0.141, 0.171, 1.098), color = Color(52, 2, 110, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
	["sanityda+"] = { type = "Model", model = "models/props_debris/concrete_chunk04a.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "sanity", pos = Vector(-4.362, 0, -0.835), angle = Angle(-90, 0, 0), size = Vector(0.141, 0.371, 2.098), color = Color(52, 2, 110, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
	["singularity"] = { type = "Model", model = "models/effects/combineball.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "sanity", pos = Vector(-14.4, 1.286, -3.839), angle = Angle(0, 90, 0), size = Vector(0.398, 0.398, 0.324), color = Color(156, 77, 246, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

SWEP.WElements = {
	["blade1"] = { type = "Model", model = "models/gibs/furniture_gibs/furnituretable001a_chunk04.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "sanity", pos = Vector(4.932, 0, -0.375), angle = Angle(0, 0, 0), size = Vector(0.86, 1.169, 0.915), color = Color(42, 2, 89, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
	["blade2"] = { type = "Model", model = "models/gibs/furniture_gibs/furnituretable001a_chunk04.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "sanity", pos = Vector(-15.289, 2.079, -6.7), angle = Angle(0, 0, -90), size = Vector(1.146, 3.401, 1.256), color = Color(51, 0, 110, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
	["fdsgf"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk04.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "sanity", pos = Vector(10.982, -1.071, -0.514), angle = Angle(90, 0, 0), size = Vector(0.144, 0.144, 0.527), color = Color(39, 0, 82, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["glw"] = { type = "Sprite", sprite = "sprites/glow07", bone = "ValveBiped.Bip01_R_Hand", rel = "sanity", pos = Vector(-8.129, 0, 0), size = { x = 38.488, y = 38.488 }, color = Color(100, 0, 255, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["glw+"] = { type = "Sprite", sprite = "sprites/glow07", bone = "ValveBiped.Bip01_R_Hand", rel = "sanity", pos = Vector(-15.207, 1.304, -0.219), size = { x = 49.986, y = 49.986 }, color = Color(76, 8, 155, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["glw++"] = { type = "Sprite", sprite = "sprites/glow07", bone = "ValveBiped.Bip01_R_Hand", rel = "sanity", pos = Vector(19.152, 0, 0), size = { x = 25.273, y = 25.273 }, color = Color(100, 0, 255, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["glw+++"] = { type = "Sprite", sprite = "sprites/glow07", bone = "ValveBiped.Bip01_R_Hand", rel = "blade1", pos = Vector(22.038, 0, 0), size = { x = 35.401, y = 35.401 }, color = Color(100, 0, 255, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["glw++++"] = { type = "Sprite", sprite = "sprites/glow07", bone = "ValveBiped.Bip01_R_Hand", rel = "sanity", pos = Vector(-11.728, 0, 0), size = { x = 29.563, y = 29.563 }, color = Color(100, 0, 255, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["glw+++++"] = { type = "Sprite", sprite = "sprites/glow07", bone = "ValveBiped.Bip01_R_Hand", rel = "sanity", pos = Vector(-3.014, 0, 0), size = { x = 30.581, y = 30.581 }, color = Color(100, 0, 255, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["glw++++++"] = { type = "Sprite", sprite = "sprites/glow07", bone = "ValveBiped.Bip01_R_Hand", rel = "sanity", pos = Vector(5.443, 0, 0), size = { x = 27.604, y = 27.604 }, color = Color(100, 0, 255, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["glw+++++++"] = { type = "Sprite", sprite = "sprites/glow07", bone = "ValveBiped.Bip01_R_Hand", rel = "blade2", pos = Vector(1.37, 3.322, 1.281), size = { x = 22.653, y = 22.653 }, color = Color(100, 0, 255, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["midaxe"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk04.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "sanity", pos = Vector(-21.404, 0, -1.336), angle = Angle(90, 0, 0), size = Vector(0.25, 0.25, 0.226), color = Color(63, 0, 127, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
	["sanity"] = { type = "Model", model = "models/props_debris/concrete_chunk04a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4.177, 1.728, -8.789), angle = Angle(99.818, 0, 0), size = Vector(1.726, 0.317, 0.4), color = Color(68, 3, 142, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
	["sanityd+"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "sanity", pos = Vector(-17.275, 0, 0.708), angle = Angle(-66.639, 0, 0), size = Vector(0.052, 0.052, 0.052), color = Color(63, 0, 127, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
	["sanityd++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "sanity", pos = Vector(-15.025, 1.037, -0.649), angle = Angle(-90, 0, 0), size = Vector(0.103, 0.103, 0.103), color = Color(63, 0, 127, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
	["sanityda"] = { type = "Model", model = "models/props_debris/concrete_chunk04a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "sanity", pos = Vector(-9.214, 0, 1.098), angle = Angle(90, 0, 0), size = Vector(0.141, 0.141, 0.776), color = Color(63, 0, 127, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
	["sanityda+"] = { type = "Model", model = "models/props_debris/concrete_chunk04a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "sanity", pos = Vector(-5.362, 0, -0.835), angle = Angle(-90, 0, 0), size = Vector(0.141, 0.171, 1.098), color = Color(63, 0, 127, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} }
}

SWEP.Tier = 7

SWEP.MeleeType = "axe"

SWEP.MeleeDamage 				= 	187
SWEP.MeleeRange 				= 	90
SWEP.MeleeSize 					= 	7

SWEP.StaminaTake 				=	14
SWEP.StaminaEffect 				=	0.3


SWEP.Primary.Delay 				= 	1.12

SWEP.SwingRotation 				= 	Angle( 30, -20, 10 )
SWEP.SwingOffset 				= 	Vector( 0, -30, 0 )
SWEP.SwingTime 					= 	0.1
SWEP.SwingTimeSecondary 		= 	0
SWEP.SwingHoldType 				= 	"melee"

SWEP.MeleeSplash 				=	true

SWEP.WalkSpeed 					= 	SPEED_FAST

SWEP.AllowQualityWeapons 		= 	true

GAMEMODE:AttachWeaponModifier( SWEP, WEAPON_MODIFIER_FIRE_DELAY, -0.05 )
GAMEMODE:AttachWeaponModifier( SWEP, WEAPON_MODIFIER_STAMINA_EFFECTIVE, -0.03 )

function SWEP:SetHitStacks( stacks )
	self:SetDTFloat( 11, stacks )
end

function SWEP:GetHitStacks()
	return self:GetDTFloat( 11 )
end

function SWEP:Initialize()
	self.BaseClass.Initialize(self)

	self.ChargeSound = CreateSound(self, "physics/concrete/boulder_impact_hard3.wav")
	self.ChargeSound2 = CreateSound(self, "physics/concrete/boulder_impact_hard4.wav")
end

function SWEP:PlaySwingSound()
	self:GetOwner():EmitSound( "weapons/iceaxe/iceaxe_swing1.wav", 75, math.random( 135, 145 ) )
	self:GetOwner():EmitSound( "npc/scanner/scanner_nearmiss"..math.random(2)..".wav", 75, math.random( 185, 195 ) )
end

function SWEP:PlayHitSound()
	self:GetOwner():EmitSound( "ambient/machines/slicer" .. math.random( 4 ) .. ".wav", 75, math.random(40,55) )
	self:GetOwner():EmitSound( "weapons/melee/golf club/golf_hit-0" .. math.random( 4 ) .. ".ogg", 100, 50 )
end

function SWEP:PlayHitFleshSound()
	self:EmitSound( "physics/body/body_medium_break" .. math.random( 2, 4 ) .. ".wav", 75, math.random( 235, 245 ) )
	self:EmitSound( "weapons/iceaxe/iceaxe_swing1.wav", 75, math.random( 65, 70 )  )
end

function SWEP:SecondaryAttack()
    local owner = self:GetOwner()
    	if owner:KeyDown(IN_ATTACK2) and self.AllowBlockMelee then
		owner:GiveStatus("meleeblock", 1)
	end
	if owner:KeyDown(IN_ATTACK2) and self.AllowBlockMelee and self:GetHitStacks() >= 1 then
		self.Secondary.Automatic = false
	    owner:EmitSound("npc/metropolice/pain1.wav", 75, 45, 1)
	    owner:EmitSound("npc/manhack/grind1.wav", 75, 45, 1)
	    owner:EmitSound("weapons/gauss/fire1.wav", 75, 45, 1)
	    owner:EmitSound("physics/concrete/boulder_impact_hard"..math.random(1, 4)..".wav", 100, math.random(60, 80))
	    owner:EmitSound("buttons/lever3.wav", 75, 45, 1)
	    owner:EmitSound("ambient/alarms/klaxon1.wav", 75, 45, 1)
		self.ChargeSound:PlayEx( 1, 255 ) 
		self.ChargeSound2:PlayEx( 1, 15, 0.4 )
		self:SetCharge(CurTime())
		self:SetNextAttack(true)
		self:StartSwinging(true)
		self:SetHitStacks( 0 )
		if not self:IsCharging() then
			self.Secondary.Automatic = true
			self:SetCharge(0)
		end
	end
end

function SWEP:MeleeHitEntity(tr, hitent, damagemultiplier)
	if not IsFirstTimePredicted() then return end

	local owner = self:GetOwner()

	if SERVER and hitent:IsPlayer() and self:GetHitStacks() <= 1 then
		self:SetHitStacks( self:GetHitStacks() + self.MeleeDamage * 0.0027 * (owner.AbilityChargeMul or 1) )
	end
	
	local check_angry = owner:GetStatus( "angry" )
	local check_skills_glassweapons = owner:IsSkillActive( "glassweapons" )
	local check_skills_fireblood = owner:IsSkillActive( "fireblood" )

	if self.MeleeSplash then
		if SERVER and hitent:IsPlayer() and check_skills_glassweapons then
			damagemultiplier = damagemultiplier * 3.5
			owner.GlassWeaponShouldBreak = not owner.GlassWeaponShouldBreak
		end

		if SERVER and hitent:IsPlayer() and check_skills_fireblood then
			if hitent and hitent:IsPlayer() then
				hitent:GiveStatus( "burn", self.FireDamage * owner.FireDamageMul, owner )
			end
		end

		damage = self.MeleeDamage * damagemultiplier

		local dmginfo = DamageInfo()
		dmginfo:SetDamagePosition( tr.HitPos )
		dmginfo:SetAttacker( owner )
		dmginfo:SetInflictor( self )
		dmginfo:SetDamageType( self.DamageType )
		dmginfo:SetDamage( damage )
		dmginfo:SetDamageForce( math.min( self.MeleeDamage, 50 ) * 50 * owner:GetAimVector() )

		local vel
		if hitent:IsPlayer() then
			if owner.MeleePowerAttackMul and owner.MeleePowerAttackMul > 1 then
				self:SetPowerCombo( self:GetPowerCombo() + 1 )

				damage = damage + damage * ( owner.MeleePowerAttackMul - 1 ) * ( self:GetPowerCombo() / 4 )
				dmginfo:SetDamage(damage)

				if self:GetPowerCombo() >= 4 then
					self:SetPowerCombo(0)
					if SERVER then
						local pitch = math.Clamp(math.random(90, 110) + 15 * (1 - damage/45), 50 , 200)
						owner:EmitSound("npc/strider/strider_skewer1.wav", 75, pitch)
					end
				end
			end

			hitent:MeleeViewPunch(damage)
			if hitent:IsHeadcrab() then
				damage = damage * 2
				dmginfo:SetDamage(damage)
			end

			if SERVER then
				hitent:SetLastHitGroup(tr.HitGroup)
				if tr.HitGroup == HITGROUP_HEAD then
					hitent:SetWasHitInHead()
				end

				if hitent:WouldDieFrom(damage, tr.HitPos) then
					dmginfo:SetDamageForce(math.min(self.MeleeDamage, 50) * 400 * owner:GetAimVector())
				end
			end

			vel = hitent:GetVelocity()
		else
			if owner.MeleePowerAttackMul and owner.MeleePowerAttackMul > 1 then
				self:SetPowerCombo(0)
			end
		end

	--if not hitent.LastHeld or CurTime() >= hitent.LastHeld + 0.1 then -- Don't allow people to shoot props out of their hands
		if self.PointsMultiplier then
			POINTSMULTIPLIER = self.PointsMultiplier
		end

		hitent:DispatchTraceAttack(dmginfo, tr, owner:GetAimVector())

		if self.PointsMultiplier then
			POINTSMULTIPLIER = nil
		end

		-- Invalidate the engine knockback vs. players
		if vel then
			hitent:SetLocalVelocity(vel)
		end
		--end

		-- Perform our own knockback vs. players
		if hitent:IsPlayer() then
			local knockback = self.MeleeKnockBack * ( owner.MeleeKnockbackMultiplier or 1 ) * ( check_angry and 2.3 or 1 )
			if knockback > 0 then
				hitent:ThrowFromPositionSetZ(tr.StartPos, knockback, nil, true)
			end

			if owner.MeleeLegDamageAdd and owner.MeleeLegDamageAdd > 0 then
				hitent:AddLegDamage(owner.MeleeLegDamageAdd)
			end
		end

		local effectdata = EffectData()
		effectdata:SetOrigin(tr.HitPos)
		effectdata:SetStart(tr.StartPos)
		effectdata:SetNormal(tr.HitNormal)
		util.Effect("RagdollImpact", effectdata)
		if not tr.HitSky then
			effectdata:SetSurfaceProp(tr.SurfaceProps)
			effectdata:SetDamageType(self.DamageType)
			effectdata:SetHitBox(tr.HitBox)
			effectdata:SetEntity(hitent)
			util.Effect("Impact", effectdata)
		end
	else
		if self.MeleeFlagged then self.IsMelee = true end

		if SERVER and hitent:IsPlayer() and not self.NoGlassWeapons and check_skills_glassweapons then
			damagemultiplier = damagemultiplier * 3.4
			owner.GlassWeaponShouldBreak = not owner.GlassWeaponShouldBreak
		end


		if SERVER and hitent:IsPlayer() and check_skills_fireblood then
			if hitent and hitent:IsPlayer() then
				hitent:GiveStatus( "burn", self.FireDamage * owner.FireDamageMul, owner )
			end
		end

		local damage = self.MeleeDamage * damagemultiplier

		local dmginfo = DamageInfo()
		dmginfo:SetDamagePosition(tr.HitPos)
		dmginfo:SetAttacker(owner)
		dmginfo:SetInflictor(self)
		dmginfo:SetDamageType(self.DamageType)
		dmginfo:SetDamage(damage)
		dmginfo:SetDamageForce(math.min(self.MeleeDamage, 50) * 50 * owner:GetAimVector())

		local vel
		if hitent:IsPlayer() then
			self:PlayerHitUtil(owner, damage, hitent, dmginfo)

			if SERVER then
				hitent:SetLastHitGroup(tr.HitGroup)
				if tr.HitGroup == HITGROUP_HEAD then
					hitent:SetWasHitInHead()
				end

				if hitent:WouldDieFrom(damage, tr.HitPos) then
					dmginfo:SetDamageForce(math.min(self.MeleeDamage, 50) * 400 * owner:GetAimVector())
				end
			end

			vel = hitent:GetVelocity()
		else
			if owner.MeleePowerAttackMul and owner.MeleePowerAttackMul > 1 then
				self:SetPowerCombo(0)
			end
		end

		self:PostHitUtil(owner, hitent, dmginfo, tr, vel)
	end
end

function SWEP:MeleeSwing()
	local charg = self:IsCharging()
	local owner = self:GetOwner()
	
	if ( SERVER ) then

		if ( charg ) then
			owner:SetLocalVelocity( Vector( 0, 0, 650 ) )
			owner:GodEnable()

			for i = 1, 10 do
				timer.Simple( ( 0.23 + 0.012 * i ) + ( i > 8 and 0.2 or 0 ), function()
					local ent = ents.Create("projectile_abyssaxe")
					if ent:IsValid() then
						ent:SetPos( owner:GetShootPos() )

						local angle = Angle( 0,  0 + 45 * i, 0 )
						ent:SetAngles( angle )

						ent:SetOwner( owner )

						owner:EmitSound( ")npc/barnacle/barnacle_gulp1.wav", 75, math.random( 145, 155 ) )

						ent.ProjDamage = self.MeleeDamage * 0.075 * ( owner.AbilityDamageMul or 1 ) * ( owner.ProjectileDamageMul or 1 )
						ent.ProjSource = self
						ent.Team = owner:Team()

						ent:Spawn()

						local phys = ent:GetPhysicsObject()
						if phys:IsValid() then
							phys:Wake()

							angle = Angle( 0,  0 + 45 * i, 0 )
							--angle:RotateAroundAxis( angle:Forward(), math.Rand( 0, 360 ) )

							phys:SetVelocityInstantaneous( i > 8 and angle:Forward() * 225 or angle:Forward() * 115 )
						end
					end
				end)
			end
			timer.Simple( 1, function()
				owner:SetLocalVelocity( Vector( 0, 0, -4250 ) )
				timer.Simple( 0.75, function()
					util.BlastDamagePlayer(self, owner, owner:GetPos(), 155, 210, DMG_GENERIC)
					owner:GodDisable()
					owner:EmitSound("physics/concrete/boulder_impact_hard"..math.random(1, 4)..".wav", 100, math.random(40, 60))
				end)
			end)
		end
	end

	if owner:IsValid() and self:GetHitStacks() >= 1 and self.Secondary.Automatic == false then
		self.ChargeSound:PlayEx(0.8, 180)
		self.ChargeSound2:PlayEx(0.8, 180)
	end

	self.BaseClass.MeleeSwing( self )
end

function SWEP:Think()
    local owner = self:GetOwner()
	local ang = owner:EyeAngles()

	if self:IsSwinging() and self:GetSwingEnd() <= CurTime() then
		self:StopSwinging()
		self:MeleeSwing()
		if self:IsCharging() then
			self:SetCharge(0)
		end
	end

	if self:GetHitStacks() >= 1 then
		self.UpperDamage = true
	elseif self:GetHitStacks() <= 0 then
		self.UpperDamage = false
		self.ChargeSound:Stop()
		self.ChargeSound2:Stop()
	end

	if self.IdleAnimation and self.IdleAnimation <= CurTime() then
		self.IdleAnimation = nil
		self:SendWeaponAnim(ACT_VM_IDLE)
	end

	if self:IsSwinging() and self:GetSwingEnd() <= CurTime() then
		self:StopSwinging()
		self:MeleeSwing()
	end
end	

function SWEP:StartSwinging(secondary)
	local owner = self:GetOwner()

	local armdelay = owner:GetMeleeSpeedMul()
	self:SetSwingEnd(CurTime() + (secondary and self.SwingTimeSecondary or self.SwingTime) * (owner.MeleeSwingDelayMul or 1) * armdelay)
	if secondary then self:SetCharge(CurTime()) end
end

function SWEP:IsCharging()
	return self:GetCharge() > 0
end

function SWEP:SetCharge(charge)
	self:SetDTFloat(1, charge)
end

function SWEP:GetCharge()
	return self:GetDTFloat(1)
end

if not CLIENT then return end

function SWEP:DrawWorldModel()
	local time = UnPredictedCurTime()
	for k, v in pairs( self.WElements ) do
		for i = 1,3 do
			local vec_time = time * ( v.size[i] and v.size[i]*5 or 1 )
			v.pos[i] = ( k == "blade1" or k == "sanity" ) and v.pos[i] or v.pos[i] + 0.046 / ( ( v.size[i] and v.size[i]*15 or 1 ) ) * ( i == 2 and math.sin(time * i * 2) or math.cos(time * i) )
			if v.angle then
				v.angle[i] = ( k == "blade1" or k == "sanity" ) and v.angle[i] or v.angle[i] + -0.06 * math.sin(time * i)
			end
		end
	end
	self.BaseClass.DrawWorldModel(self)
end
SWEP.DrawWorldModelTranslucent = SWEP.DrawWorldModel

function SWEP:PostDrawViewModel(vm)
	if self.ShowViewModel == false then
        render.SetBlend(1)
    end
    local time = UnPredictedCurTime()
	for k, v in pairs( self.VElements ) do
		for i = 1,3 do
			local vec_time = time * ( v.size[i] and v.size[i]*2.5 or 1 )
			v.pos[i] = ( k == "blade1" or k == "sanity" ) and v.pos[i] or v.pos[i] + 0.02 * ( i == 2 and math.sin(time * i * 2) or math.cos(time * i) )
			if v.angle then
				v.angle[i] = ( k == "blade1" or k == "sanity" ) and v.angle[i] or v.angle[i] + -0.06 * math.sin(time * i)
			end
		end
	end
	if self.HUD3DPos and GAMEMODE:ShouldDraw3DWeaponHUD() then
        local pos, ang = self:GetHUD3DPos(vm)
        if pos then
            self:Draw3DHUD(vm, pos, ang)
        end
    end
end

function SWEP:GetHUD3DPos(vm)
	local bone = vm:LookupBone(self.HUD3DBone)
	if not bone then return end

	local m = vm:GetBoneMatrix(bone)
	if not m then return end

	local pos, ang = m:GetTranslation(), m:GetAngles()

	if self.ViewModelFlip then
		ang.r = -ang.r
	end

	local offset = self.HUD3DPos
	local aoffset = self.HUD3DAng

	pos = pos + ang:Forward() * offset.x + ang:Right() * offset.y + ang:Up() * offset.z

	if aoffset.yaw ~= 0 then ang:RotateAroundAxis(ang:Up(), aoffset.yaw) end
	if aoffset.pitch ~= 0 then ang:RotateAroundAxis(ang:Right(), aoffset.pitch) end
	if aoffset.roll ~= 0 then ang:RotateAroundAxis(ang:Forward(), aoffset.roll) end

	return pos, ang
end

function SWEP:Draw2DHUD()
	local ablicolor = Color( 75 * math.max(self:GetHitStacks(), 0.1), 15 * math.max(self:GetHitStacks(), 0.5), 255 * math.min(self:GetHitStacks(), 0.65) )
	self:Draw2DFeature( self:GetHitStacks(), nil, nil, "weapon_ability_abyssaxe_2d", "ZSSHUD4Font_20", ablicolor )
end

function SWEP:Draw3DHUD(vm, pos, ang)
	local wid, hei = 120, 200
	local x, y = wid * -0.6, hei * -0.5
	local ablicolor = Color( 75 * math.max(self:GetHitStacks(), 0.1), 15 * math.max(self:GetHitStacks(), 0.5), 255 * math.min(self:GetHitStacks(), 0.65) )

	cam.Start3D2D( pos, ang, self.HUD3DScale / 6 )
			self:Draw3DFeatureHorizontal( vm, pos, ang, self:GetHitStacks(), nil, nil, "weapon_ability_abyssaxe_3d", "ZSSHUD4Font_50", ablicolor )
	cam.End3D2D()
end
