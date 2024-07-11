INC_SERVER()
SWEP.NextEmit = 0
function SWEP:Think()
	local pl = self:GetOwner()

	if pl:KeyDown(IN_ATTACK) and pl:GetAmmoCount("chemical") >= 1 and self.NextEmit < CurTime() then

		self.NextEmit = CurTime() + self.Primary.Delay
		pl.LastRangedAttack = CurTime()
		if CurTime() >= self.NextPuke and pl:WaterLevel() < 2  then
		--	pl:EmitSound("ambient/fire/gascan_ignite1.wav")
		--	pl:EmitSound("ambient/fire/ignite.wav")
			pl:EmitSound("ambient/fire/mtov_flame2.wav", 126)
			self.NextPuke = CurTime() + 0.22
		end
		if pl:WaterLevel() < 2 then
			if self.NextAmmoTake <= CurTime() then
				self:TakeAmmo()
				self.NextAmmoTake = CurTime() + 0.189
			end
			local size = 300
			local dir = pl:GetAimVector()
			local angle = math.cos( math.rad( 30 ) ) -- 30 degrees
			local startPos = pl:EyePos()

			local entities = ents.FindInCone( startPos, dir, size, angle )
			for id, ent in ipairs( entities ) do
				if ent:IsValidLivingZombie() then
					ent:TakeDamage(self.Primary.Damage,pl,self)
					ent:AttachmentDamage(self.Primary.Damage*0.7,pl,self,SLOWTYPE_FLAME)
				end
			end
			pl:GiveStatus('flamefix',self.Primary.Delay)

		end
	end

	self:NextThink(CurTime())
	return true
end
