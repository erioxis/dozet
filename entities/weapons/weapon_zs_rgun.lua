AddCSLuaFile()

SWEP.Base = "weapon_zs_baseshotgun"

--SWEP.PrintName = "DoomStick"
--SWEP.Description = "Ancient weapon,heaven for boomstickers,can burn zombie but less damage."
SWEP.PrintName = translate.Get("wep_rgun")
SWEP.Description = translate.Get("wep_d_rgun")

if CLIENT then
	SWEP.WElements = {
		["balka1"] = { type = "Model", model = "models/props_phx/misc/iron_beam1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "shotgun", pos = Vector(22.274, -2.357, -2.505), angle = Angle(6, -180, -85.254), size = Vector(0.24, 0.35, 0.31), color = Color(150, 150, 150, 255), surpresslightning = false, material = "models/props_pipes/pipemetal001a", skin = 0, bodygroup = {} },
		["balka1+"] = { type = "Model", model = "models/hunter/tubes/tube1x1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "balka1", pos = Vector(-4.622, -0.052, 1.549), angle = Angle(90, 0, 0), size = Vector(0.037, 0.037, 0.037), color = Color(150, 150, 150, 255), surpresslightning = false, material = "models/props_pipes/pipemetal001a", skin = 0, bodygroup = {} },
		["balka1++"] = { type = "Model", model = "models/hunter/triangles/trapezium3x3x1c.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "balka1", pos = Vector(6.144, 0.051, 1.773), angle = Angle(0, -180, -90), size = Vector(0.02, 0.057, 0.07), color = Color(150, 150, 150, 255), surpresslightning = false, material = "models/props_pipes/pipemetal001a", skin = 0, bodygroup = {} },
		["balka1++++"] = { type = "Model", model = "models/weapons/w_pistol.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "balka1", pos = Vector(1.715, 1.163, 2), angle = Angle(0, 0, -86), size = Vector(1.021, 1.021, 1.021), color = Color(150, 150, 150, 255), surpresslightning = false, material = "models/props_pipes/pipemetal001a", skin = 0, bodygroup = {} },
		["shotgun"] = { type = "Model", model = "models/props_junk/CinderBlock01a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.016, 1.258, 0), angle = Angle(0, 0, 0), size = Vector(0.132, 0.132, 0.132), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	SWEP.VElements = {
		["balka1"] = { type = "Model", model = "models/props_phx/misc/iron_beam1.mdl", bone = "ValveBiped.Pump", rel = "", pos = Vector(-1.654, 3.752, 11.788), angle = Angle(-90, 0, 0), size = Vector(0.303, 0.35, 0.35), color = Color(150, 150, 150, 255), surpresslightning = false, material = "models/props_pipes/pipemetal001a", skin = 0, bodygroup = {} },
		["balka1+"] = { type = "Model", model = "models/hunter/tubes/tube1x1x1.mdl", bone = "ValveBiped.Gun", rel = "balka1", pos = Vector(-7.18994, 0.02802, 1.789), angle = Angle(90, 0, 0), size = Vector(0.054, 0.054, 0.054), color = Color(150, 150, 150, 255), surpresslightning = false, material = "models/props_pipes/pipemetal001a", skin = 0, bodygroup = {} },
		["balka1++"] = { type = "Model", model = "models/hunter/triangles/trapezium3x3x1c.mdl", bone = "ValveBiped.Gun", rel = "balka1", pos = Vector(7.65302, 0.05101, 1.77298), angle = Angle(0, -180, -89.99999), size = Vector(0.02, 0.057, 0.07), color = Color(150, 150, 150, 255), surpresslightning = false, material = "models/props_pipes/pipemetal001a", skin = 0, bodygroup = {} },
		["balka1+++"] = { type = "Model", model = "models/hunter/tubes/circle2x2b.mdl", bone = "ValveBiped.Gun", rel = "balka1", pos = Vector(7.68896, -0.17799, 3.18103), angle = Angle(0, 0, 0), size = Vector(0.009, 0.023, 0.074), color = Color(150, 150, 150, 255), surpresslightning = false, material = "models/props_combine/metal_combinebridge001", skin = 0, bodygroup = {} },
		["balka1++++"] = { type = "Model", model = "models/weapons/w_pistol.mdl", bone = "ValveBiped.Pump", rel = "balka1", pos = Vector(2.915, 1.163, 2), angle = Angle(0, 0, -86), size = Vector(1.021, 1.021, 1.021), color = Color(150, 150, 150, 255), surpresslightning = false, material = "models/props_pipes/pipemetal001a", skin = 0, bodygroup = {} }
	}
	
end

SWEP.ViewModel = "models/weapons/c_shotgun.mdl"
SWEP.WorldModel = "models/weapons/w_shotgun.mdl"
SWEP.UseHands = true

SWEP.InnateDamageType = INNATE_TYPE_PULSE
SWEP.InnateDamageMul = 0.35


SWEP.CSMuzzleFlashes = false

SWEP.ReloadDelay = 0.81

SWEP.Primary.Sound = Sound("weapons/shotgun/shotgun_dbl_fire.wav")
SWEP.Primary.Damage = 300
SWEP.Primary.NumShots = 1
SWEP.Primary.Delay = 1

SWEP.Recoil = 7.5

SWEP.Primary.ClipSize = 1
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "none"
SWEP.Primary.DefaultClip = 1

SWEP.ConeMax = 3
SWEP.ConeMin = 1

SWEP.Tier = 4
SWEP.MaxStock = 2

SWEP.WalkSpeed = SPEED_SLOWER
SWEP.FireAnimSpeed = 0.6
SWEP.Knockback = 200

SWEP.PumpActivity = ACT_SHOTGUN_PUMP
SWEP.PumpSound = Sound("Weapon_Shotgun.Special1")
SWEP.ReloadSound = Sound("Weapon_Shotgun.Reload")



GAMEMODE:SetPrimaryWeaponModifier(SWEP, WEAPON_MODIFIER_FIRE_DELAY, -0.09)
function SWEP:CanPrimaryAttack()
	return self:GetOwner():GetNW2Float(8,1)<= CurTime()
end
function SWEP:PrimaryAttack()

    if not self:CanPrimaryAttack() then
        return
    end
    
    local ply = self:GetOwner()

    ply:LagCompensation( true )

    self:EmitSound(Sound("ambient/energy/zap6.wav"))

    local TraceD = {}
    local rest = {}
    TraceD.start = ply:GetShootPos() + ply:GetAimVector() * 5
    TraceD.endpos = ply:GetShootPos() + ply:GetAimVector() * 99999
    TraceD.maxs = Vector(15,15,15)
    TraceD.mins = Vector(-15,-15,-15)
    if SERVER then
        TraceD.filter = function(e) 
            if not e:IsWorld() then  
                if e:IsNextBot() or e:IsPlayer() and e != ply or e:IsNPC() or e.Coin == true or e.Core == true then
                    dmg = DamageInfo()
                    dmg:SetAttacker(ply)
                    dmg:SetInflictor(self)
                    dmg:SetReportedPosition(ply:GetShootPos())
                    dmg:SetDamage(self.Primary.Damage*(ply.BulletMul or 1))
                    dmg:SetDamageForce(ply:GetAimVector() * 30000)
                    dmg:SetDamagePosition(ply:GetShootPos())
                    dmg:SetDamageType(DMG_BULLET)
                    e:TakeDamageInfo(dmg)
                    e:TakePhysicsDamage(dmg)
                    if e.Coin == true then
                        e.ERail = true
                        return true
                    end
                    return false
                elseif e:IsPlayer() and e == ply then
                    return false
                else
                    return true
                end
            else 
                return true 
            end
        end
    end
    if CLIENT and not game.SinglePlayer then
        TraceD.filter = function(e) 
            if not e:IsWorld() then  
                return false
            else 
                return true 
            end
        end
    end
    TraceD.output = rest
    util.TraceHull(TraceD)
    if rest.Entity.Coin == true then
        rest.Entity.ERail = true
    end
    timer.Simple(0.1,function() util.TraceHull(TraceD) end)
    timer.Simple(0.2,function() util.TraceHull(TraceD) end)
    self:ShootEffects()
    local gd = EffectData()
    gd:SetOrigin(rest.HitPos)
    gd:SetStart(ply:GetShootPos() + ply:GetAimVector() * 10)
    gd:SetFlags(0)

    util.Effect("HL1GaussBeamReflect",gd)
    gd:SetStart(ply:GetShootPos() + Vector(0,0,3) + ply:GetAimVector() * 10)
    util.Effect("HL1GaussBeamReflect",gd)
    gd:SetStart(ply:GetShootPos() + Vector(0,3,0) + ply:GetAimVector() * 10)
    util.Effect("HL1GaussBeamReflect",gd)
    gd:SetStart(ply:GetShootPos() + Vector(0,-3,0) + ply:GetAimVector() * 10)
    util.Effect("HL1GaussBeamReflect",gd)
    gd:SetStart(ply:GetShootPos() + Vector(0,0,-3) + ply:GetAimVector() * 10)
    util.Effect("HL1GaussBeamReflect",gd)


    ply:LagCompensation( false )
	ply:SetNW2Float(8,CurTime()+(15* self.Primary.Delay))

end

function SWEP:Reload()
end
function SWEP:SecondaryAttack()
end
if SERVER then return end
local texDownEdge = surface.GetTextureID("gui/gradient_down")
local col1 =  Color(133,172,255)
function SWEP:Draw2DHUD()
	local screenscale = BetterScreenScale()

	local wid, hei = 180 * screenscale, 64 * screenscale
	local x, y = ScrW() - wid - screenscale * 128, ScrH() - hei - screenscale * 72
	local spare = math.Clamp(math.Round((self:GetOwner():GetNW2Float(8,1)-CurTime())*100) / 15, 0.01,1000)
	surface.SetTexture(texDownEdge )
	surface.SetDrawColor(255, 255, 255, 255*spare/100)
	surface.DrawTexturedRect(x + wid, y + hei * 0.5, wid*spare, hei * 2)

	draw.SimpleTextBlurry(math.Round(100-spare),"ZSHUDFontBig", x + wid * (displayspare and 0.25 or 0.5), y + hei * 0.5, col1, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
end