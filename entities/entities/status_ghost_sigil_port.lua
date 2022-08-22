AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "status_ghost_base"

ENT.GhostModel = Model("models/props_wasteland/medbridge_post01.mdl")
ENT.GhostRotation = Angle(270, 0, 0)
ENT.GhostEntity = "prop_obj_sigil"
ENT.GhostWeapon = "weapon_zs_sigil_port"
ENT.GhostFlatGround = false
ENT.GhostDistance = 16

function ENT:CustomValidate(tr)
	local hitent = tr.Entity
	if hitent and hitent:IsValid() and hitent:GetClass() ~= "func_tracktrain" and hitent:GetClass() ~= "func_movelinear" then
		return false
	end

	return true
end
