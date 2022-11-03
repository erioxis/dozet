INC_CLIENT()
include("cl_animations.lua")

ENT.ColorModulation = Color(0.15, 0.8, 1)

function ENT:Think()
	local class = self:GetWeaponType()
	if class ~= self.LastWeaponType then
		self.LastWeaponType = class

		self:RemoveModels()

		local weptab = weapons.Get(class)
		if weptab then
			local showmdl = weptab.ShowWorldModel or not self:LookupBone("ValveBiped.Bip01_R_Hand") and not weptab.NoDroppedWorldModel
			self.ShowBaseModel = weptab.ShowWorldModel == nil and true or showmdl

			if weptab.WElements then
				self.WElements = table.FullCopy(weptab.WElements)
				self:CreateModels(self.WElements)
			end

			self.ColorModulation = weptab.DroppedColorModulation or self.ColorModulation
			self.PropWeapon = true
			self.QualityTier = weptab.QualityTier
			self.Branch = weptab.Branch
			self.BranchData = weptab.Branches and weptab.Branches[self.Branch]
		end
	end
end

function ENT:OnRemove()
	self:RemoveModels()
end
--[[function ENT:Draw()

	self:DrawModel()
	
	local ent = self
	
	local mins = ent:OBBMins()
	local maxs = ent:OBBMaxs()
	local startpos = ent:GetPos()
	local dir = ent:GetUp()
	local len = 42

	local tr = util.TraceHull( {
		start = startpos,
		endpos = startpos + dir * len,
		maxs = maxs,
		mins = mins,
		filter = ent
	} )
	
	render.DrawLine( tr.HitPos, startpos + dir * len, color_white, true )
	render.DrawLine( startpos, tr.HitPos, Color( 0, 0, 255 ), true )
	
	local clr = color_white
	if ( tr.Hit ) then
		clr = Color( 255, 0, 0 )
	end

	render.DrawWireframeBox( startpos, Angle( 0, 0, 0 ), mins, maxs, Color( 255, 255, 255 ), true )
	render.DrawWireframeBox( tr.HitPos, Angle( 0, 0, 0 ), mins, maxs, clr, true )

end]]
