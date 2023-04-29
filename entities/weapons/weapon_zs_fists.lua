AddCSLuaFile()
SWEP.PrintName = "Fists"

SWEP.Base = "weapon_zs_hammer"

SWEP.ViewModel = "models/weapons/c_arms_citizen.mdl"
SWEP.WorldModel	= ""
SWEP.UseHands = true

SWEP.HoldType = "fist"

SWEP.WalkSpeed = SPEED_NORMAL
SWEP.OldWalkSpeed = 0

SWEP.MeleeDamage = 9
SWEP.DamageType = DMG_CLUB
SWEP.UppercutDamageMultiplier = 3
SWEP.HitDistance = 40
SWEP.MeleeKnockBack = 0

SWEP.ViewModelFOV = 52
SWEP.Primary.Ammo = "scrap"
SWEP.Primary.DefaultClip = 5
SWEP.AutoSwitchFrom = true
SWEP.HealStrength = 0.05

SWEP.GoodAttackPerk = 0

SWEP.Unarmed = true

SWEP.Undroppable = true
SWEP.NoPickupNotification = true
SWEP.NoDismantle = true
SWEP.NoGlassWeapons = true

SWEP.Primary.Delay = 0.67

SWEP.Weight = 2 -- This is the second crappiest weapon you could hope for, besides food
SWEP.SlotPos = 100

SWEP.IsFistWeapon = true
SWEP.SwingSound = Sound( "weapons/slam/throw.wav" )
SWEP.HitSound = Sound( "Flesh.ImpactHard" )
SWEP.Direction = Vector(0,0,0)

function SWEP:PreDrawViewModel(vm, wep, pl)
	vm:SetMaterial("engine/occlusionproxy")
end

function SWEP:SetupDataTables()
	self:NetworkVar("Float", 0, "NextMeleeAttack")
	self:NetworkVar("Float", 1, "NextIdle")
	self:NetworkVar("Float", 2, "NextIdleHoldType")
	self:NetworkVar("Int", 2, "Combo")
	--self:NetworkVar("Bool", 0, "HitPrevious")
	self:NetworkVar("Int", 0, "PowerCombo")
	self:NetworkVar("Entity", 2, "HookedEnt")
end

function SWEP:UpdateNextIdle()
	local vm = self:GetOwner():GetViewModel()
	self:SetNextIdle( CurTime() + vm:SequenceDuration() )
end

SWEP.LastSwingHit = 0
SWEP.LastSwingStart = 0
function SWEP:Reload()
end
function SWEP:PrimaryAttack(right)
	local owner = self:GetOwner()
	local time = CurTime()

	self:SetNextIdleHoldType(time + 1.5)
	owner:SetAnimation(PLAYER_ATTACK1)
	self.OldWalkSpeed = math.max(self.OldWalkSpeed, self.WalkSpeed)
	if not owner:IsSkillActive(SKILL_KNUCKLEMASTER) and self.Unarmed then
		self.WalkSpeed = 165
		owner:ResetSpeed()
	end

	local anim = "fists_left"
	if ( right ) then anim = "fists_right" end
	if ( self:GetCombo() >= 2 ) then
		anim = "fists_uppercut"
	end

	local vm = self:GetOwner():GetViewModel()
	vm:SendViewModelMatchingSequence( vm:LookupSequence( anim ) )

	self:EmitSound( self.SwingSound )

	self:UpdateNextIdle()

	local armdelay = owner:GetMeleeSpeedMul()
	local hitdelay = self.Primary.Delay / 3 * (owner.MeleeSwingDelayMul or 1) * armdelay
	owner:GetViewModel():SetPlaybackRate(1 / armdelay)
	if time < self.LastSwingStart + 1 and owner:IsSkillActive(SKILL_COMBOKNUCKLE) then
		if time < self.LastSwingHit + 0.75 then --if self:GetHitPrevious() then
			hitdelay = hitdelay / 2
			owner:GetViewModel():SetPlaybackRate(2 / armdelay)
		else
			hitdelay = hitdelay * 2
			owner:GetViewModel():SetPlaybackRate(0.5 / armdelay)
		end
	end


	self:SetNextMeleeAttack( time + hitdelay )

	self:SetNextPrimaryFire( time + self.Primary.Delay * armdelay )
	self:SetNextSecondaryFire( time + self.Primary.Delay * armdelay )

	self.LastSwingStart = time
end

function SWEP:SecondaryAttack()
	self:PrimaryAttack( true )
end

function SWEP:GenerateDamageInfo(damage, hitpos)
	local dmginfo = DamageInfo()
	dmginfo:SetAttacker(self:GetOwner())
	dmginfo:SetInflictor(self)
	dmginfo:SetDamageType(self.DamageType)
	dmginfo:SetDamagePosition(hitpos)
	dmginfo:SetDamage(damage)
	return dmginfo
end

function SWEP:DealDamage()
	local owner = self:GetOwner()
	local aimvector = owner:GetAimVector()
	local anim = self:GetSequenceName(owner:GetViewModel():GetSequence())
	local time = CurTime()

	local tr = owner:CompensatedMeleeTrace(self.HitDistance * (owner.MeleeRangeMul or 1), 3)

	local hitent = tr.Entity

	-- We need the second part for single player because SWEP:Think is ran shared in SP.
	if tr.Hit and not ( game.SinglePlayer() and CLIENT ) then
		self:EmitSound( self.HitSound, 75, 100, 1, CHAN_WEAPON + 1)
	end

	if self.OnMeleeHit and self:OnMeleeHit(hitent, hitflesh, tr) then
		return
	end

	local armdelay = owner:GetMeleeSpeedMul()
	local delay = self.Primary.Delay * (owner.UnarmedDelayMul or 1) * armdelay
	if tr.Hit then
		self.LastSwingHit = time
		if owner:IsSkillActive(SKILL_COMBOKNUCKLE) then
			delay = delay / 2
		end
	else
		if owner:IsSkillActive(SKILL_COMBOKNUCKLE) then
			delay = delay * 2
		end

		if owner.MeleePowerAttackMul and owner.MeleePowerAttackMul > 1 then
			self:SetPowerCombo(0)
		end
	end
	self:SetNextPrimaryFire( time + delay )
	self:SetNextSecondaryFire( time + delay )

	if hitent:IsValid() then
		local damagemultiplier = owner:GetTotalAdditiveModifier("UnarmedDamageMul", "MeleeDamageMultiplier")
		if owner:IsSkillActive(SKILL_LASTSTAND) then
			if owner:Health() <= owner:GetMaxHealth() * 0.25 then
				damagemultiplier = damagemultiplier * 2
			else
				damagemultiplier = damagemultiplier * 0.85
			end
		end

		if SERVER and hitent:IsPlayer() and not self.NoGlassWeapons and owner:IsSkillActive(SKILL_GLASSWEAPONS) then
			damagemultiplier = damagemultiplier * 3.5
			owner.GlassWeaponShouldBreak = not owner.GlassWeaponShouldBreak
		end

		if anim == "fists_uppercut" then
			damagemultiplier = damagemultiplier * self.UppercutDamageMultiplier
		end
			if owner:IsSkillActive(SKILL_GOODATTACK) then
			    if self.GoodAttackPerk == 3 then
					damagemultiplier = damagemultiplier * 3
					self.GoodAttackPerk = 0
				else
					self.GoodAttackPerk = self.GoodAttackPerk + 1 
				end
			end		

		local damage = self.MeleeDamage * damagemultiplier
		local dmginfo = self:GenerateDamageInfo(damage, tr.HitPos)

		local vel
		if hitent:IsPlayer() then

			self:PlayerHitUtil(owner, damage, hitent, dmginfo)

			if SERVER then
				hitent:SetLastHitGroup(tr.HitGroup)
				if tr.HitGroup == HITGROUP_HEAD then
					hitent:SetWasHitInHead()
				end

				if hitent:WouldDieFrom(dmginfo:GetDamage(), dmginfo:GetDamagePosition()) then
					if anim == "fists_left" then
						dmginfo:SetDamageForce(owner:GetRight() * 4912 + owner:GetForward() * 9998)
					elseif anim == "fists_right" then
						dmginfo:SetDamageForce(owner:GetRight() * -4912 + owner:GetForward() * 9989)
					elseif anim == "fists_uppercut" then
						dmginfo:SetDamageForce(owner:GetUp() * 5158 + owner:GetForward() * 10012)
					end
				else
					if owner:IsSkillActive(SKILL_CRITICALKNUCKLE) then
						hitent:ThrowFromPositionSetZ(tr.StartPos, 240 * (owner.MeleeKnockbackMultiplier or 1), nil, true)
					end

					if owner.BoxingTraining then
						self:SetDTInt(5, self:GetDTInt(5) + 1)

						if self:GetDTInt(5) >= 5 then
							self:SetDTInt(5, 0)

							hitent:AddLegDamage(18)
							hitent:AddArmDamage(18)
							hitent:EmitSound("weapons/crowbar/crowbar_impact1.wav", 75, math.random(60, 65))
						end
					end
				end
			end

			vel = hitent:GetVelocity()
		else
			if owner.MeleePowerAttackMul and owner.MeleePowerAttackMul > 1 then
				self:SetPowerCombo(0)
			end
		end

		if IsFirstTimePredicted() then
			self:PostHitUtil(owner, hitent, dmginfo, tr, vel)
		end

		if SERVER and hitent:GetMoveType() == MOVETYPE_VPHYSICS then
			local phys = hitent:GetPhysicsObject()
			if phys and phys:IsValid() then
				phys:ApplyForceOffset( aimvector * 2000, tr.HitPos )
				hitent:SetPhysicsAttacker(owner)
			end
		end
	end

	if SERVER then
		if hitplayer and anim ~= "fists_uppercut" then
			self:SetCombo( self:GetCombo() + 1 )
		else
			self:SetCombo( 0 )
		end
	end

	if SERVER then
		self:ServerMeleePostHitEntity(tr, hitent, damagemultiplier)
	end
end

function SWEP:OnRemove()
	if CLIENT and self:GetOwner():IsValid() and self:GetOwner():IsPlayer() then
		local vm = self:GetOwner():GetViewModel()
		if IsValid(vm) then vm:SetMaterial("") end
	end
end

function SWEP:Holster(wep)
	if CurTime() >= self:GetNextPrimaryFire() then
		self:OnRemove()
		if CLIENT then
			self:Anim_Holster()
		end

		return true
	end
	self:GetOwner().Hooking = false
	return false
end

function SWEP:Deploy()
	local vm = self:GetOwner():GetViewModel()
	vm:SendViewModelMatchingSequence(vm:LookupSequence("fists_draw"))

	self:UpdateNextIdle()

	if SERVER then
		self:SetCombo(0)
	end
	self:GetOwner():ResetSpeed()
	self:GetOwner().Hooking = false
	return true
end
function SWEP:CheckHook()
	if (self.NextHooking or 1 ) >= CurTime() then return end
	local owner = self:GetOwner()
	owner:LagCompensation(true)
	local trace = owner:GetEyeTrace()
	local ent = trace.Entity
	local p = ent and ent:IsValid() and (ent:IsValidLivingZombie() or ent:GetClass() == "prop_physics" or ent:GetClass() == "projectile_rl" or ent:GetClass() == "projectile_markcoin" )
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
local needtbl = {"func_physbox","prop_physics"}
local sectbl = {"projectile_rl","projectile_markcoin"}
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
			self:SetHookedEnt(self.LastENT)
			self.HookedOn = false
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
			local p = target:IsPlayer() and target:IsValidLivingZombie()
			local need = table.HasValue(needtbl,entclass)
			local secondneed = table.HasValue(sectbl,entclass)
			if (need or target.HumanHoldable and target:HumanHoldable(owner)) and not target:IsNailed() and target:GetMoveType() == MOVETYPE_VPHYSICS and target:GetPhysicsObject():IsValid() and target:GetPhysicsObject():GetMass() <= 1200 and target:GetPhysicsObject():IsMoveable() and target:OBBMins():Length() + target:OBBMaxs():Length() <= 200 or p
			or secondneed
			then
				local aimangles = owner:EyeAngles() 
				local mul = ((owner.SkillSpeedAdd or 1)+225)/225
				local targetpos = target:LocalToWorld(target:OBBCenter()) 
				local direction = (targetpos - owner:GetPos()):GetNormal()  * 2
				if owner:KeyDown(IN_MOVERIGHT) then
					direction = direction  + aimangles:Right()  * mul
				end
				if owner:KeyDown(IN_MOVELEFT) then
					direction = direction  - aimangles:Right()  * mul
				end
					--owner:SetLocalVelocity(direction*300)
					local weight = p and (target:GetZombieClassTable().Weight or 1) or 1
					if target:GetPhysicsObject():GetMass() <= 100 or p and weight < 1 then
						if !p then
							target:GetPhysicsObject():SetVelocityInstantaneous(-direction*600)
							target:SetPhysicsAttacker(owner,2)
						else
							target:SetLocalVelocity(direction*-400/math.max(0.1,weight))
						end
					else
						owner:SetLocalVelocity(direction*300)
					end
				if (self.NextCheck or 2) <= CurTime() then
					self.NextCheck = CurTime() + 0.1
					if !WorldVisible(owner:LocalToWorld(Vector(0,0,40)),target:LocalToWorld(Vector(0,0,40))) then
						owner.Hooking = false 
						self.HookedOn =  false
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
							self.HookedOn =  false
							self:SetHookedEnt(NULL)
						end
					end
				end
			end
		
		end
		self:CheckHook()
		
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
	if !(MySelf:KeyDown(IN_RELOAD) or self:GetHookedEnt() and self:GetHookedEnt():IsValid()) or !MySelf.Sisus then return end
		local owner = self:GetOwner()
	local trg = self:GetHookedEnt()
	
	local trace = owner:GetEyeTraceNoCursor()
	local hitpos = trace.HitPos

	render.SetMaterial(matBeam)
	if owner.Hooking and trg and trg:IsValid() then
	   render.DrawBeam(owner:LocalToWorld(Vector(0,0,20)),  trg:LocalToWorld(trg:OBBCenter()) ,24,42, 42, beamcol)
	else
		render.DrawBeam(owner:LocalToWorld(Vector(0,0,20)), hitpos,34,42, 42, beamcol)
	end
	
	--render.SetMaterial(matBeam)
	--render.DrawSprite(owner:LocalToWorld(Vector(0,0,20)), 32, 32, COLOR_WHITE)
end
