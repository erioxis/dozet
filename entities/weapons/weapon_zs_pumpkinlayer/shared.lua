--SWEP.PrintName = "'Carrion' Impact Mine Layer"
--SWEP.Description = "A mine layer that shoots out simple tripmines that attach to surfaces."
SWEP.PrintName = translate.Get("wep_player")
SWEP.Description = translate.Get("wep_d_player")

SWEP.Slot = 4
SWEP.SlotPos = 0

SWEP.Base = "weapon_zs_baseproj"

SWEP.HoldType = "shotgun"

SWEP.ViewModel = "models/weapons/c_rpg.mdl"
SWEP.WorldModel = "models/weapons/w_rocket_launcher.mdl"

SWEP.ViewModelFOV = 60

SWEP.Primary.Sound = Sound("npc/roller/mine/rmine_explode_shock1.wav")
SWEP.Primary.Delay = 1

SWEP.Primary.Damage = 195
SWEP.Primary.ClipSize = 1
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "impactmine"
SWEP.Primary.DefaultClip = 20

SWEP.ReloadSound = Sound("weapons/ar2/ar2_reload.wav")

SWEP.ConeMax = 0
SWEP.ConeMin = 0
SWEP.Tier = 5

SWEP.WalkSpeed = SPEED_SLOWEST * 0.9

SWEP.UseHands = true

function SWEP:EmitFireSound()
	self:EmitSound(self.Primary.Sound, 60, math.random(137, 143), 0.5)
end

function SWEP:EmitReloadSound()
	if IsFirstTimePredicted() then
		self:EmitSound(self.ReloadSound, 60, 110, 0.5, CHAN_WEAPON + 21)
	end
end

GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_RELOAD_SPEED, 0.1)
GAMEMODE:AddNewRemantleBranch(SWEP, 1, translate.Get("wep_player_r1"), translate.Get("wep_d_player_r1"), function(wept)
	wept.Primary.ClipSize = 2
	wept.RequiredClip = 2
	wept.ReloadSpeed = 0.5
	wept.Primary.Damage = wept.Primary.Damage * 1.6
	wept.Primary.Projectile = "projectile_pumpkin_aim"

end)

