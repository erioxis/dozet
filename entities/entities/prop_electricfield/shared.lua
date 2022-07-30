ENT.Type = "anim"

ENT.TotalHurt = 60
ENT.HurtTick = 0.5
ENT.LifeTime = 2.5
ENT.Radius = 700
if CLIENT then return end
ENT.Classes = table.ToAssoc(
	{"prop_ammo", "prop_invitem", "prop_weapon", "prop_physics", "prop_physics_multiplier",
    "projectile_flakbomb",
    "projectile_biorifle",
    "projectile_crymam",
    "projectile_arrow_mini",
    "projectile_disc_razor",
    "projectile_emi",
    "projectile_banana",
    "projectile_melon",
    "projectile_rocket",
    "projectile_grenade_bouncy"}
)
ENT.Force = 500
ENT.ForceDelay = 0.1