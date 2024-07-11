AddCSLuaFile()

SWEP.Base = "weapon_zs_fists"

SWEP.PrintName = "Brass Knuckles"
SWEP.Description = "A pair of brass knuckles used to concentrate strikes from one's fists, increasing the damage done, while keeping their movement speed up."

<<<<<<< Updated upstream
=======
--SWEP.PrintName = "Brass Knuckles"
--SWEP.Description = "A pair of brass knuckles used to concentrate strikes from one's fists, increasing the damage done, while keeping their movement speed up."
SWEP.PrintName = translate.Get("wep_bknuck")
SWEP.Description = translate.Get("wep_d_bknuck")
>>>>>>> Stashed changes
if CLIENT then
	SWEP.ViewModelFOV = 52
	SWEP.ViewModelFlip = false

	SWEP.ShowViewModel = false
	SWEP.ShowWorldModel = false

	SWEP.VElements = {
		["base"] = { type = "Model", model = "models/props_c17/utilityconnecter005.mdl", bone = "ValveBiped.Bip01_R_Finger2", rel = "", pos = Vector(1.129, -0.087, 0.4), angle = Angle(0, 15.421, 94.749), size = Vector(0.458, 0.349, 0.395), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["base+"] = { type = "Model", model = "models/props_c17/utilityconnecter005.mdl", bone = "ValveBiped.Bip01_L_Finger2", rel = "", pos = Vector(1.238, 0.136, -0.399), angle = Angle(2.473, 1.322, 83.697), size = Vector(0.458, 0.349, 0.395), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}

	SWEP.WElements = {
		["base"] = { type = "Model", model = "models/props_c17/utilityconnecter005.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4.021, 1.006, 0), angle = Angle(0, -93.675, 100), size = Vector(0.458, 0.349, 0.395), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["base+"] = { type = "Model", model = "models/props_c17/utilityconnecter005.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "", pos = Vector(4.085, 0.674, 0), angle = Angle(0, -99.708, 82.794), size = Vector(0.458, 0.349, 0.395), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
end

<<<<<<< Updated upstream
=======
a = math.random(20,40)
SWEP.InnateDamageType = INNATE_TYPE_BOUNTY
SWEP.InnateDamageMul = 0.3

>>>>>>> Stashed changes
SWEP.WalkSpeed = SPEED_FASTEST

SWEP.ViewModel = "models/weapons/c_arms_citizen.mdl"
SWEP.WorldModel	= "models/weapons/w_grenade.mdl"

SWEP.Weight = 4

SWEP.MeleeDamage = 22.5

SWEP.Unarmed = false

SWEP.Undroppable = false
SWEP.NoPickupNotification = false
SWEP.NoDismantle = false

SWEP.NoGlassWeapons = false

SWEP.AllowQualityWeapons = true

<<<<<<< Updated upstream
GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_FIRE_DELAY, -0.06)
=======

GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_FIRE_DELAY, -0.0136)
function SWEP:SetupDataTables()
	self:NetworkVar("Float", 0, "NextMeleeAttack")
	self:NetworkVar("Float", 1, "NextIdle")
	self:NetworkVar("Float", 2, "NextIdleHoldType")
	self:NetworkVar("Int", 2, "Combo")
	--self:NetworkVar("Bool", 0, "HitPrevious")
	self:NetworkVar("Int", 0, "PowerCombo")
	self:NetworkVar("Entity", 2, "HookedEnt")
end
function SWEP:Think()
	local idletime = self:GetNextIdle()
	local idle_holdtype_time = self:GetNextIdleHoldType()
	local owner = self:GetOwner()

	if idle_holdtype_time > 0 and CurTime() >= idle_holdtype_time then
		--self:SetWeaponHoldType("normal")
		self:SetNextIdleHoldType(0)
		self.WalkSpeed = self.OldWalkSpeed
		owner:ResetSpeed()
	end

	if idletime > 0 and CurTime() >= idletime then
		local vm = owner:GetViewModel()
		vm:SendViewModelMatchingSequence( vm:LookupSequence("fists_idle_0"..math.random(2)))

		self:UpdateNextIdle()
	end

	local meleetime = self:GetNextMeleeAttack()

	if meleetime > 0 and CurTime() >= meleetime then
		self:DealDamage()
		self:SetNextMeleeAttack( 0 )
	end

	if SERVER and CurTime() >= self:GetNextPrimaryFire() + 0.1 then
		self:SetCombo( 0 )
	end
	if !owner.Sisus then return end
		if  owner:KeyDown(IN_SPEED) then
			owner.Hooking = false
		end
		if self.HookedOn and !owner:KeyDown(IN_RELOAD) and self.LastENT then
			self:EmitSound("npc/barnacle/barnacle_bark"..math.random(2)..".wav",100,150)
			self:SetHookedEnt(self.LastENT)
			self.LastENT = NULL
			self.HookedOn = false
			self.NextHooking = CurTime()+0.78
			owner.Hooking = true
		end

		if owner.Hooking and SERVER then
			local target = self:GetHookedEnt()
			if !target or target and !target:IsValid() then
				self:GetHookedEnt(NULL)
				owner.Hooking = false
				self.HookedOn = false
				return
			end
			local entclass = target:GetClass()
			local targetpos = target:LocalToWorld(target:OBBCenter()) 
			local direction = (targetpos - owner:GetPos()):GetNormal() * 2
			local aimangles = owner:EyeAngles() 
			local p = target:IsPlayer() and target:IsValidLivingZombie()
			local mul = ((owner.SkillSpeedAdd or 1)+225)/225
			if owner:KeyDown(IN_MOVERIGHT) then
				direction = direction  + aimangles:Right()  * mul
			end
			if owner:KeyDown(IN_MOVELEFT) then
				direction = direction  - aimangles:Right()  * mul
			end
			self.Direction = direction
			if (entclass == "prop_physics" or entclass == "func_physbox" or target.HumanHoldable and target:HumanHoldable(pl)) and not target:IsNailed() and target:GetMoveType() == MOVETYPE_VPHYSICS and target:GetPhysicsObject():IsValid() and target:GetPhysicsObject():GetMass() <= 1200 and target:GetPhysicsObject():IsMoveable() and target:OBBMins():Length() + target:OBBMaxs():Length() <= 200 or p
			or entclass == "projectile_rl" or  entclass == "projectile_markcoin"
			then
					--owner:SetLocalVelocity(direction*300)
					if target:GetPhysicsObject():GetMass() <= 100 or p and (target:GetZombieClassTable().Weight or 1) < 1 then
						if !p then
							target:GetPhysicsObject():SetVelocityInstantaneous(-direction*600)
							target:SetPhysicsAttacker(owner,2)
						else
							target:SetLocalVelocity(direction*-800)
						end
					else
						owner:SetLocalVelocity(direction*300)
					end
				if (self.NextCheck or 2) <= CurTime() then
					self.NextCheck = CurTime() + 0.1
					if !WorldVisible(owner:LocalToWorld(Vector(0,0,40)),target:LocalToWorld(Vector(0,0,40))) then
						owner.Hooking = false 
						self:SetHookedEnt(NULL)
					end
					for k,v in pairs(ents.FindInSphere(owner:GetPos(),100)) do
						if v == self:GetHookedEnt() then
							if  entclass == "projectile_markcoin" then
								target:GetPhysicsObject():SetVelocityInstantaneous(Vector(0,0,500))
							elseif  entclass == "projectile_rl"  then
								target:GetPhysicsObject():SetVelocityInstantaneous(Vector(0,0,10))
							end
							owner.Hooking = false 
							self:SetHookedEnt(NULL)
						end
					end
				end
			end
		end
		if (self.NextHooking or 1 ) >= CurTime() then return end
		owner:LagCompensation(true)
		local trace = owner:GetEyeTrace()
		local ent = trace.Entity
		local p = ent and ent:IsValid() and (ent:IsPlayer() or ent:GetClass() == "prop_physics" or ent:GetClass() == "projectile_rl" or ent:GetClass() == "projectile_markcoin" )
		if ent and ent ~= owner and owner:KeyDown(IN_RELOAD) and p then
			self.HookedOn = true
			self.LastENT = ent
			self.NextHooking = CurTime()+0.3
			self:EmitSound("npc/barnacle/barnacle_bark"..math.random(2)..".wav",100,50)
		elseif !p then
			self.LastENT = NULL
			self.HookedOn = false
		end
		owner:LagCompensation(false)

end

function SWEP:TranslateActivity( act )
	return self.ActivityTranslate and self.ActivityTranslate[act] or -1
end

if not CLIENT then return end

function SWEP:DrawWeaponSelection(x, y, w, h, alpha)
	self:BaseDrawWeaponSelection(x, y, w, h, alpha)
end

function SWEP:DrawHUD()
	self:DrawCrosshairDot()
end

function SWEP:GetViewModelPosition(pos, ang)
	pos = pos - ang:Up() * 3

	return pos, ang
end
local beamcol, matBeam = Color(0, 0, 0), Material("effects/bloodstream")
function SWEP:PostDrawViewModel(vm, pl, wep)
	local owner = self:GetOwner()
	if !(MySelf:KeyDown(IN_RELOAD) or self:GetHookedEnt() and self:GetHookedEnt():IsValid()) or !MySelf.Sisus then return end
	local trg = self:GetHookedEnt()
	
	local trace = owner:GetEyeTraceNoCursor()
	local hitpos = trace.HitPos

	render.SetMaterial(matBeam)
	if owner.Hooking and trg and trg:IsValid() then
	   render.DrawBeam(owner:LocalToWorld(Vector(0,0,20)), trg:WorldSpaceCenter(),24,42, 42, beamcol)
	else
		render.DrawBeam(owner:LocalToWorld(Vector(0,0,20)), hitpos,34,42, 42, beamcol)
	end
	
	--render.SetMaterial(matBeam)
	--render.DrawSprite(owner:LocalToWorld(Vector(0,0,20)), 32, 32, COLOR_WHITE)
end
>>>>>>> Stashed changes
