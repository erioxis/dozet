INC_SERVER()
SWEP.NextEmit = 0
function SWEP:Think()
	local pl = self:GetOwner()

	if self:GetOwner():KeyDown(IN_ATTACK) and self:GetOwner():GetAmmoCount("chemical") >= 1 and self.NextEmit < CurTime() then

		self.PukeLeft = self.PukeLeft - 1
		self.NextEmit = CurTime() + 0.02
		pl.LastRangedAttack = CurTime()
		if CurTime() >= self.NextPuke and self:GetOwner():WaterLevel() < 2  then
		--	pl:EmitSound("ambient/fire/gascan_ignite1.wav")
		--	pl:EmitSound("ambient/fire/ignite.wav")
			pl:EmitSound("ambient/fire/mtov_flame2.wav", 126)
			self.NextPuke = CurTime() + 0.34
		end
		local ent = ents.Create(self.PukeLeft % 6 == 1 and "projectile_puke" or "projectile_puke")
		if ent:IsValid() and self:GetOwner():WaterLevel() < 2 then
			local pos = pl:EyePos()
			pos.z = pl:GetShootPos().z -18
			pos.x = pl:GetShootPos().x - 2
			pos.y = pl:GetShootPos().y - 2
			ent:SetPos(pos)
			ent:SetOwner(pl)
			ent:Spawn()
			ent.ProjDamage = self.Primary.Damage * (pl.ProjectileDamageMul or 1)
			ent.Sas = self.Deathtrue
			if self.NextAmmoTake <= CurTime() then
				self:TakeAmmo()
				self.NextAmmoTake = CurTime() + 0.189
			end

			local phys = ent:GetPhysicsObject()
			if phys:IsValid() then
				ent:SetGravity(20000)
				local ang = pl:EyeAngles()
				ang:RotateAroundAxis(ang:Forward(), math.Rand(-6, 6))
				ang:RotateAroundAxis(ang:Up(), math.Rand(-22, 22))
				timer.Simple((self.Deathtrue and 1.9 or 0), function() 
					if phys:IsValid() then
						phys:SetVelocityInstantaneous(ang:Forward() * math.Rand(625, 1250))
					end
				end)
				
			end
		end
	end

	self:NextThink(CurTime())
	return true
end
