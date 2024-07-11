AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "status__base"

ENT.Ephemeral = true

AccessorFuncDT( ENT, "Duration", "Float", 0 )
AccessorFuncDT( ENT, "StartTime", "Float", 4 )

function ENT:Initialize()
	self.BaseClass.Initialize(self)

	if SERVER then
		hook.Add("EntityTakeDamage", self, self.EntityTakeDamage)

		self:SetDTInt(1, 0)
	end

	if CLIENT then
		hook.Add( "PrePlayerDraw", self, self.PrePlayerDraw )
		hook.Add( "PostPlayerDraw", self, self.PostPlayerDraw )
		hook.Add( "Draw", self, self.Draw )

		self:DrawShadow( false )

		self.AmbientSound = CreateSound( self, ")weapons/physcannon/superphys_hold_loop.wav" )
		self.AmbientSound:PlayEx( 0.55, 245 )
	end
end

function ENT:PlayerSet()
	self:SetStartTime( CurTime() )
	local owner = self:GetOwner()
	self.Foving = owner:GetFOV()

	owner:SetFOV( 115, 1 )
	owner:SetDSP( 55, true )
end

function ENT:OnRemove()
	self.BaseClass.OnRemove( self )
	local owner = self:GetOwner()

	owner:SetFOV( 0, .2 )
	owner:SetDSP( 1, true )

	local effectdata = EffectData()
		effectdata:SetOrigin( owner:WorldSpaceCenter() )
		effectdata:SetNormal( owner:GetUp() )
		effectdata:SetEntity( owner )
	util.Effect( "death_moonshade", effectdata, nil, true )

	local wep = owner:GetActiveWeapon()

	if wep.Astral then
		wep.Astral = false
		wep:EndAstral()
	end

	if CLIENT then
		self.AmbientSound:Stop()
	end
end
