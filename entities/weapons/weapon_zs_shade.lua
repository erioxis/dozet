AddCSLuaFile()

SWEP.Base = "weapon_zs_zombie"

SWEP.PrintName = "Shade"

SWEP.ViewModel = Model("models/weapons/v_fza.mdl")
SWEP.WorldModel = Model("models/weapons/w_crowbar.mdl")
SWEP.PhysicsForce = 3500
SWEP.MutationMultiplier = 9000

if CLIENT then
	SWEP.ViewModelFOV = 70
end

SWEP.Primary.Automatic = false
SWEP.Secondary.Automatic = false

SWEP.ShadeControl = "env_shadecontrol"
SWEP.ShadeProjectile = "projectile_shaderock"

function SWEP:Initialize()
	self:HideWorldModel()
end
function SWEP:GetNextShadeTime()
	return self:GetDTFloat(21)
end
function SWEP:SetNextShadeTime(t)
	self:SetDTFloat(21,t)
end
function SWEP:Think()
end

function SWEP:PrimaryAttack()
	local owner = self:GetOwner()
	if CurTime() <= self:GetNextPrimaryFire() or (owner.ShadeShield and owner.ShadeShield:IsValid()) then return end

	for _, ent in pairs(ents.FindByClass(self.ShadeControl)) do
		if ent:IsValid() and ent:GetOwner() == owner then
			local obj = ent:GetParent()
			if obj:IsValid() then
				self:SetNextSecondaryFire(CurTime() + 0.65)

				owner:DoAttackEvent()

				if self.Owner.m_Shade_Force then
					vel = (self.Owner:TraceLine(10240, MASK_SOLID, filt).HitPos - obj:LocalToWorld(obj:OBBCenter())):GetNormalized() * self.MutationMultiplier
				else
					vel = (self.Owner:TraceLine(10240, MASK_SOLID, filt).HitPos - obj:LocalToWorld(obj:OBBCenter())):GetNormalized() * self.PhysicsForce
				end

				if CLIENT then return end

				local vel = owner:GetAimVector() * 1000

				local phys = obj:GetPhysicsObject()
				if phys:IsValid() and phys:IsMoveable() and phys:GetMass() <= 300 then
					phys:Wake()
					phys:SetVelocity(vel)
					obj:SetPhysicsAttacker(owner)
					phys:AddGameFlag(FVPHYSICS_WAS_THROWN)

					obj:EmitSound(")weapons/physcannon/superphys_launch"..math.random(4)..".wav")
					obj.LastShadeLaunch = CurTime()
				end
			end

			ent:Remove()
		end
	end
end



function SWEP:CanGrab()
	local owner = self:GetOwner()
	if CurTime() <= self:GetNextSecondaryFire() or (owner.ShadeShield and owner.ShadeShield:IsValid()) then return end
	self:SetNextSecondaryFire(CurTime() + 0.1)

	if SERVER then
		for _, ent in pairs(ents.FindByClass(self.ShadeControl)) do
			if ent:IsValid() and ent:GetOwner() == owner then
				ent:Remove()
				return
			end
		end
	end

	return true
end

function SWEP:SecondaryAttack()
	if not self:CanGrab() then return end

	local owner = self:GetOwner()
	local ent = owner:CompensatedMeleeTrace(400, 4).Entity
	if ent:IsValid() and (ent:IsPhysicsModel() or ent.IsShadeGrabbable or ent.IsPhysbox) then
		self:SetNextPrimaryFire(CurTime() + 0.25)
		self:SetNextSecondaryFire(CurTime() + 0.4)

		if SERVER then
		local phys = ent:GetPhysicsObject()
		if phys:IsValid() and phys:IsMoveable() and phys:GetMass() <= 300 then
			for _, ent2 in pairs(ents.FindByClass(self.ShadeControl)) do
				if ent2:IsValid() and ent2:GetParent() == ent then
					ent2:Remove()
					return
				end
			end

			for _, status in pairs(ents.FindByClass("status_human_holding")) do
				if status:IsValid() and status:GetObject() == ent then
					status:Remove()
				end
			end

			local con = ents.Create(self.ShadeControl)
			if con:IsValid() then
				con:Spawn()
				con:SetOwner(owner)
				con:AttachTo(ent)

				ent:EmitSound(")weapons/physcannon/physcannon_claws_close.wav")
			end
		end
		end
	end
end

function SWEP:Reload()
	if not self:CanGrab() then return end

	local owner = self:GetOwner()

	local vStart = owner:GetShootPos()
	local vEnd = vStart + owner:GetForward() * 40

	local tr = util.TraceHull({start=vStart, endpos=vEnd, filter=owner, mins=owner:OBBMins()/2, maxs=owner:OBBMaxs()/2})
	self:SetNextPrimaryFire(CurTime() + 0.9)
	self:SetNextSecondaryFire(CurTime() + 0.9)

	if SERVER then
		local rock = ents.Create(self.ShadeProjectile)
		if rock:IsValid() then
			local pos = owner:GetPos() - owner:GetForward() * 5
			if not tr.Hit then
				pos = pos + owner:GetForward() * 30
			end

			rock:SetPos(pos)
			rock:SetOwner(owner)
			rock:Spawn()
			local con = ents.Create(self.ShadeControl)
			if con:IsValid() then
				con:Spawn()
				con:SetOwner(owner)
				con:AttachTo(rock)
				rock.Control = con

				util.ScreenShake(owner:GetPos(), 3, 1, 0.75, 400)

				con:EmitSound("physics/concrete/concrete_break3.wav", 85, 60)
				rock:EmitSound(")weapons/physcannon/physcannon_claws_close.wav")

				owner.LastRangedAttack = CurTime()
			end
		end
	end
end

function SWEP:OnRemove()
end

function SWEP:Holster()
end

if not CLIENT then return end

function SWEP:PreDrawViewModel(vm)
	local owner = self:GetOwner()
	if owner:IsValid() then
		owner:CallZombieFunction1("PreRenderEffects", vm)
	end
end

function SWEP:PostDrawViewModel(vm)
	local owner = self:GetOwner()
	if owner:IsValid() then
		owner:CallZombieFunction1("PostRenderEffects", vm)
	end
end
function SWEP:DrawWeaponSelection(x, y, w, h, alpha)
	self:BaseDrawWeaponSelection(x, y, w, h, alpha)
end

local texGradDown = surface.GetTextureID("VGUI/gradient_down")
function SWEP:DrawHUD()
	local wid, hei = 384, 16
	local x, y = ScrW() - wid - 32, ScrH() - hei - 72
	local texty = y - 4 - draw.GetFontHeight("ZSHUDFontSmall")

	local timeleft = self:GetNextShadeTime() - CurTime()	
	local typeshield = self.Ice and "frostshadeshield" or "shadeshield"
	local theme = self.Ice and Color(42,204,204) or Color(81, 50, 255, 180) 
	
	local shield = self:GetOwner():GetStatus(typeshield):IsValid() and  self:GetOwner():GetStatus(typeshield)
	if shield and shield:IsValid() then
		surface.SetDrawColor(5, 5, 5, 180)
		surface.DrawRect(x, y, wid, hei)

		surface.SetDrawColor(theme.r, theme.g, theme.b, 180)
		surface.SetTexture(texGradDown)
		surface.DrawTexturedRect(x, y, math.min(1,shield:GetObjectHealth()/shield:GetMaxObjectHealth()) * wid, hei)

		surface.SetDrawColor(theme.r, theme.g, theme.b, 180)
		surface.DrawOutlinedRect(x, y, wid, hei)
	end
	if timeleft > 0 then
		draw.SimpleText(translate.Get("ns_shade").. math.Round(timeleft), "ZSHUDFontSmall", x, texty, theme, TEXT_ALIGN_LEFT)
	end
	if shield then
		draw.SimpleText(shield:GetObjectHealth(), "ZSHUDFontSmall", x + wid, texty, theme, TEXT_ALIGN_RIGHT)
	end

	if GetConVar("crosshair"):GetInt() == 1 then
		self:DrawCrosshairDot()
	end
end