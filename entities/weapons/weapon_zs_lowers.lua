AddCSLuaFile()

if CLIENT then
	SWEP.ViewModelFlip = false
	SWEP.ViewModelFOV = 70

	SWEP.ShowViewModel = false
	SWEP.ShowWorldModel = false

	SWEP.VElements = {
		["e1"] = { type = "Model", model = "models/hunter/tubes/tube4x4x8.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "", pos = Vector(3.178, 1.879, -3.355), angle = Angle(-1.627, -21.438, -8.121), size = Vector(0.011, 0.004, 0.038), color = Color(53, 53, 53, 255), surpresslightning = false, material = "phoenix_storms/trains/track_plateside", skin = 0, bodygroup = {} },
		["e1+"] = { type = "Model", model = "models/props_phx2/garbage_metalcan001a.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "e1", pos = Vector(6e-05, 0, 7.24599), angle = Angle(0, 0, 0), size = Vector(0.45, 0.137, 0.001), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/pack2/chrome", skin = 0, bodygroup = {} },
		["e1+++"] = { type = "Model", model = "models/hunter/tubes/circle2x2.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "e1", pos = Vector(0, 0, 7.057), angle = Angle(0, 0, 0), size = Vector(0.023, 0.009, 0.109), color = Color(255, 255, 127, 255), surpresslightning = false, material = "phoenix_storms/grey_chrome", skin = 0, bodygroup = {} },
		["e1++++"] = { type = "Model", model = "models/props_phx/construct/metal_wire_angle360x1.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "e1", pos = Vector(0, 0, -7.22), angle = Angle(0, 0, 0), size = Vector(0.023, 0.009, 0.038), color = Color(255, 255, 127, 255), surpresslightning = false, material = "phoenix_storms/grey_chrome", skin = 0, bodygroup = {} },
		["e1+++++"] = { type = "Model", model = "models/hunter/tubes/tube2x2x025.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "e1", pos = Vector(0, 0, -1.683), angle = Angle(0, 0, 0), size = Vector(0.023, 0.009, 0.009), color = Color(255, 255, 127, 255), surpresslightning = false, material = "phoenix_storms/grey_chrome", skin = 0, bodygroup = {} },
		["e1++++++"] = { type = "Model", model = "models/hunter/tubes/tube2x2x025c.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "e1", pos = Vector(0, 0, -1.516), angle = Angle(-90, 90, 0), size = Vector(0.014, 0.005, 0.066), color = Color(255, 255, 127, 255), surpresslightning = false, material = "phoenix_storms/grey_chrome", skin = 0, bodygroup = {} },
		["e1+++++++"] = { type = "Model", model = "models/hunter/tubes/circle2x2.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "e1", pos = Vector(0, 0, -1.439), angle = Angle(-90, 90, 0), size = Vector(0.004, 0.004, 0.268), color = Color(255, 255, 127, 255), surpresslightning = false, material = "phoenix_storms/grey_chrome", skin = 0, bodygroup = {} },
		["e2"] = { type = "Model", model = "models/hunter/tubes/tube4x4x4.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.999, 0.755, 0.105), angle = Angle(-4.651, 62.873, -6.059), size = Vector(0.004, 0.007, 0.04), color = Color(51, 51, 51, 255), surpresslightning = false, material = "phoenix_storms/middle", skin = 0, bodygroup = {} },
		["e2+"] = { type = "Model", model = "models/hunter/tubes/circle2x2.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e2", pos = Vector(-2e-05, 0.00012, 3.96008), angle = Angle(0, 0, -5e-05), size = Vector(0.008, 0.014, 0.11), color = Color(255, 255, 127, 255), surpresslightning = false, material = "phoenix_storms/grey_chrome", skin = 0, bodygroup = {} },
		["e2++"] = { type = "Model", model = "models/hunter/tubes/circle2x2.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e2", pos = Vector(-1e-05, 0, -3.85095), angle = Angle(0, 0, -2e-05), size = Vector(0.008, 0.014, 0.037), color = Color(255, 255, 150, 255), surpresslightning = false, material = "phoenix_storms/gear", skin = 0, bodygroup = {} },
		["e2+++"] = { type = "Model", model = "models/gibs/manhack_gib06.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e2", pos = Vector(0, -1.118, -10.944), angle = Angle(-1, -90, -90), size = Vector(0.43, 1.331, 0.7), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/gear", skin = 0, bodygroup = {} },
		["e2++++"] = { type = "Model", model = "models/gibs/manhack_gib05.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e2", pos = Vector(-0.268, -0.092, -3.906), angle = Angle(0, -90, 0), size = Vector(0.177, 0.131, 0.647), color = Color(53, 53, 53, 255), surpresslightning = false, material = "phoenix_storms/gear", skin = 0, bodygroup = {} },
		["e2+++++"] = { type = "Model", model = "models/gibs/manhack_gib05.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e2", pos = Vector(0.268, 0, -3.906), angle = Angle(0, 90, 0), size = Vector(0.175, 0.131, 0.647), color = Color(53, 53, 53, 255), surpresslightning = false, material = "phoenix_storms/gear", skin = 0, bodygroup = {} },
		["e2++++++"] = { type = "Model", model = "models/gibs/manhack_gib06.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e2", pos = Vector(0, -1.174, -10.865), angle = Angle(-1, -90, -90), size = Vector(0.43, 1.311, 0.7), color = Color(172, 172, 172, 255), surpresslightning = false, material = "phoenix_storms/gear", skin = 0, bodygroup = {} }
	}
	SWEP.WElements = {
		["e1"] = { type = "Model", model = "models/hunter/tubes/tube4x4x8.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "", pos = Vector(3.636, 1.178, 0), angle = Angle(0, -8.359, -12.937), size = Vector(0.011, 0.004, 0.038), color = Color(53, 53, 53, 255), surpresslightning = false, material = "phoenix_storms/trains/track_plateside", skin = 0, bodygroup = {} },
		["e1+"] = { type = "Model", model = "models/props_phx2/garbage_metalcan001a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(0, 0, 7.246), angle = Angle(0, 0, 0), size = Vector(0.45, 0.137, 0.001), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/pack2/chrome", skin = 0, bodygroup = {} },
		["e1+++"] = { type = "Model", model = "models/hunter/tubes/circle2x2.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(0, 0, 7.057), angle = Angle(0, 0, 0), size = Vector(0.023, 0.009, 0.109), color = Color(255, 255, 127, 255), surpresslightning = false, material = "phoenix_storms/grey_chrome", skin = 0, bodygroup = {} },
		["e1++++"] = { type = "Model", model = "models/props_phx/construct/metal_wire_angle360x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(0, 0, -7.22), angle = Angle(0, 0, 0), size = Vector(0.023, 0.009, 0.038), color = Color(255, 255, 127, 255), surpresslightning = false, material = "phoenix_storms/grey_chrome", skin = 0, bodygroup = {} },
		["e1+++++"] = { type = "Model", model = "models/hunter/tubes/tube2x2x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(0, 0, -1.683), angle = Angle(0, 0, 0), size = Vector(0.023, 0.009, 0.009), color = Color(255, 255, 127, 255), surpresslightning = false, material = "phoenix_storms/grey_chrome", skin = 0, bodygroup = {} },
		["e1++++++"] = { type = "Model", model = "models/hunter/tubes/tube2x2x025c.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(0, 0, -1.516), angle = Angle(-90, 90, 0), size = Vector(0.014, 0.005, 0.066), color = Color(255, 255, 127, 255), surpresslightning = false, material = "phoenix_storms/grey_chrome", skin = 0, bodygroup = {} },
		["e1+++++++"] = { type = "Model", model = "models/hunter/tubes/circle2x2.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(0, 0, -1.439), angle = Angle(-90, 90, 0), size = Vector(0.004, 0.004, 0.268), color = Color(255, 255, 127, 255), surpresslightning = false, material = "phoenix_storms/grey_chrome", skin = 0, bodygroup = {} },
		["e2"] = { type = "Model", model = "models/hunter/tubes/tube4x4x4.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.773, 1.482, 0), angle = Angle(8.754, 57.05, -19.487), size = Vector(0.004, 0.007, 0.04), color = Color(51, 51, 51, 255), surpresslightning = false, material = "phoenix_storms/middle", skin = 0, bodygroup = {} },
		["e2+"] = { type = "Model", model = "models/hunter/tubes/circle2x2.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e2", pos = Vector(0, 0, 3.96), angle = Angle(0, 0, 0), size = Vector(0.008, 0.014, 0.11), color = Color(255, 255, 127, 255), surpresslightning = false, material = "phoenix_storms/grey_chrome", skin = 0, bodygroup = {} },
		["e2++"] = { type = "Model", model = "models/hunter/tubes/circle2x2.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e2", pos = Vector(0, 0, -3.851), angle = Angle(0, 0, 0), size = Vector(0.008, 0.014, 0.037), color = Color(255, 255, 150, 255), surpresslightning = false, material = "phoenix_storms/gear", skin = 0, bodygroup = {} },
		["e2+++"] = { type = "Model", model = "models/gibs/manhack_gib06.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e2", pos = Vector(0, -1.118, -10.944), angle = Angle(-1, -90, -90), size = Vector(0.43, 1.331, 0.7), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/gear", skin = 0, bodygroup = {} },
		["e2++++"] = { type = "Model", model = "models/gibs/manhack_gib05.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e2", pos = Vector(-0.268, -0.092, -3.906), angle = Angle(0, -90, 0), size = Vector(0.177, 0.131, 0.647), color = Color(53, 53, 53, 255), surpresslightning = false, material = "phoenix_storms/gear", skin = 0, bodygroup = {} },
		["e2+++++"] = { type = "Model", model = "models/gibs/manhack_gib05.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e2", pos = Vector(0.268, 0, -3.906), angle = Angle(0, 90, 0), size = Vector(0.175, 0.131, 0.647), color = Color(53, 53, 53, 255), surpresslightning = false, material = "phoenix_storms/gear", skin = 0, bodygroup = {} },
		["e2++++++"] = { type = "Model", model = "models/gibs/manhack_gib06.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e2", pos = Vector(0, -1.174, -10.865), angle = Angle(-1, -90, -90), size = Vector(0.43, 1.311, 0.7), color = Color(172, 172, 172, 255), surpresslightning = false, material = "phoenix_storms/gear", skin = 0, bodygroup = {} }
	}
	function SWEP:PostDrawViewModel(vm, pl, wep)
		local veles = self.VElements
		local tbl = {}
		for k,v in pairs(self.VElements) do
			local b = string.Explode("",k)
			if b[1] == "e" and b[2] == "1" then
				local clr = Color(veles[k].color.r,veles[k].color.g,veles[k].color.b,0)
				veles[k].color = clr
			end
		end
		if self:GetClip() - 1 <= CurTime() then
			for k,v in pairs(self.VElements) do
				local b = string.Explode("",k)
				if b[1] == "e" and b[2] == "1" then
					local clr = Color(veles[k].color.r,veles[k].color.g,veles[k].color.b,255)
					veles[k].color = clr
				end
			end
		end
	end
	
	
end
SWEP.PrintName = translate.Get("wep_lowers")
SWEP.Description = translate.Get("wep_d_lowers")
function SWEP:PlayHitSound()
	self:EmitSound("weapons/melee/golf club/golf_hit-0"..math.random(4)..".ogg", 11255, 222)
end

function SWEP:PlayHitFleshSound()
	self:EmitSound("physics/body/body_medium_break"..math.random(2, 4)..".wav", 11255, 222)
end

SWEP.Base = "weapon_zs_basemelee"

SWEP.HoldType = "knife"
SWEP.ViewModel = "models/weapons/cstrike/c_knife_t.mdl"
SWEP.ShowWorldModel = false
SWEP.WorldModel = "models/weapons/w_pistol.mdl"
SWEP.UseHands = true
SWEP.HitDecal = "Manhackcut"

SWEP.MeleeDamage = 92
SWEP.MeleeRange = 66
SWEP.MeleeSize = 2
SWEP.Tier = 3


SWEP.AllowQualityWeapons = true

SWEP.WalkSpeed = SPEED_NORMAL

SWEP.Eater = nil
SWEP.HaloAmmo = true
SWEP.AmmoUse = 1
SWEP.NextKick = 5

SWEP.Primary.Delay = 0.5
SWEP.Secondary.Delay = 10
SWEP.HitAnim = ACT_VM_MISSCENTER
SWEP.ChargeSpeed = 1000

function SWEP:GetClip()
	return self:GetNWFloat(3)
end
function SWEP:SetClip(d)
	self:SetNWFloat(3, d)
end
function SWEP:OnMeleeHit(hitent, hitflesh, tr)
	local ent = tr.Entity
	local own = self:GetOwner()
	local tbl = hitent:GetZombieClassTable()
	if self.HealthSteal and hitent and hitent:IsPlayer() and SERVER and tbl and !tbl.Boss and !tbl.DemiBoss then
		local d = ents.Create("prop_hp")
		if d:IsValid() then
			d:SetPos(hitent:GetPos() + Vector(0,0,80))
			d:SetAngles(hitent:GetAngles())
			d:Spawn()
			d:SetOwner(own)
			d:SetHP(hitent:Health()*0.03)
			d:SetTime(CurTime()+4)
			d.DieTime = CurTime() + 3.5
			timer.Simple(0.1, function() d:GetPhysicsObject():SetVelocity(VectorRand(-300,300)) end )
			hitent:SetHealth(hitent:Health()*0.94)
		end
	end
	if ent:IsPlayer() and SERVER and tbl and !tbl.Boss and !tbl.DemiBoss then
		ent:AddBleedDamage(self.MeleeDamage * 0.12, own)
		own:SetHealth(math.min(own:Health() + self.MeleeDamage *0.05 * (self.HealthSteal and 0.3 or 1),own:GetMaxHealth()))
	end
end
function SWEP:SecondaryAttack()
	if self.NextKick <= CurTime() then
		self:SetClip(CurTime() + 4)
		self:PrimaryAttack()
		self.NextKick = CurTime() + 4
		local tr = self:GetOwner():CompensatedMeleeTrace(1222, 1)
		if tr.Entity then
			local ent =tr.Entity 
			if ent:IsPlayer() and ent:IsValidLivingZombie() then
				if SERVER then
					ent:AddBleedDamage(self.MeleeDamage * 0.24, self:GetOwner())
					ent:TakeDamage(self.MeleeDamage*1.2,self:GetOwner(),self)
				else
					self:PlayHitFleshSound()
				end
			end
		end
	end
end
GAMEMODE:AddNewRemantleBranch(SWEP, 1, translate.Get("wep_lowers_r1"), translate.Get("wep_d_lowers_r1"), function(wept)
	wept.MeleeDamage = wept.MeleeDamage * 0.5
	wept.Primary.Delay = wept.Primary.Delay * 0.9

	wept.HealthSteal = true
end)