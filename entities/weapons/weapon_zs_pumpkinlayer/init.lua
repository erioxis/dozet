INC_SERVER()

SWEP.Primary.Projectile = "projectile_pumpkin"
SWEP.Primary.ProjVelocity = 1600
function SWEP:EntModify(ent)
	ent.Damage = self.Primary.Damage
end
function SWEP:PhysModify(physobj)
	physobj:AddAngleVelocity(VectorRand():GetNormalized() * 290)
end
