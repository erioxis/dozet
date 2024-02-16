AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "status_ghost_base"

ENT.GhostModel = Model("models/props_wasteland/medbridge_post01.mdl")
ENT.GhostRotation = Angle(270, 0, 0)
ENT.GhostEntity = "prop_obj_sigil"
ENT.GhostWeapon = "weapon_zs_sigil_port"
ENT.GhostFlatGround = true
ENT.GhostDistance = 16
ENT.GhostLimitedNormal = 1
local validity_trace = {
	start = Vector(0, 0, 0), endpos = Vector(0, 0, 0), mins = Vector(-18, -18, 0), maxs = Vector(18, 18, 2), mask = MASK_SOLID_BRUSHONLY
}
function ENT:CustomValidate()
    local owner = self:GetOwner()
    local shootpos = owner:GetShootPos()
    local pos = shootpos +owner:GetAimVector() * 48
    validity_trace.start:Set(pos)
    validity_trace.start.z = pos.z + 1
    validity_trace.endpos:Set(pos)
    validity_trace.endpos.z = pos.z + 64
    if util.TraceHull(validity_trace).Hit then
       return false
    end
    return true
end
