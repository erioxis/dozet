SWEP.PrintName = "Admin navmesh tool"

SWEP.ViewModel = "models/weapons/c_pistol.mdl"
SWEP.WorldModel = "models/weapons/w_pistol.mdl"
SWEP.UseHands = true

SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "none"

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"
SWEP.NoMobilized = true

local placers = {
	["STEAM_0:0:1111"] = true,
	["STEAM_0:0:2222"] = true
}
local function CanPlace(pl)
	return pl:IsValid() and (pl:IsSuperAdmin() or pl:IsNavmesher())
end

function SWEP:Initialize()
	local owner = 	self:GetOwner()
	if SERVER  and CanPlace(owner) then
		D3bot.SetMapNavMeshUiSubscription(self:GetOwner(),'edit')
		self:GetOwner():AddFlags(FL_NOTARGET)
	end
end

function SWEP:Deploy()
	local owner = 	self:GetOwner()
	if SERVER and CanPlace(owner) then
		D3bot.SetMapNavMeshUiSubscription(owner,'edit')
		owner:AddFlags(FL_NOTARGET)
	end

	return true
end

function SWEP:Holster()
	local owner = 	self:GetOwner()
	if SERVER  and CanPlace(owner) then
		D3bot.SetMapNavMeshUiSubscription(self:GetOwner(), nil)  self:GetOwner():RemoveFlags(FL_NOTARGET)
	end
	return true
end
function SWEP:OnDropDo(wep)
	local owner = 	self:GetOwner()
	if SERVER  and CanPlace(owner) then
		D3bot.SetMapNavMeshUiSubscription(self:GetOwner(), nil)  self:GetOwner():RemoveFlags(FL_NOTARGET)
	end
	timer.Simple(0, function(arguments)
		wep:Remove()
	end)
	return true
end
function SWEP:PrimaryAttack()
	local owner = self:GetOwner()
	if not CanPlace(owner) then return end
	if CLIENT then return end
end

function SWEP:SecondaryAttack()
	local owner = self:GetOwner()
	if not CanPlace(owner) then return end

	if CLIENT then return end
end

function SWEP:Reload()
	local owner = self:GetOwner()
	if not CanPlace(owner) then return end
	if CLIENT then return end
end

if SERVER then

concommand.Add("zs_admin_path_tool", function(sender)
	if CanPlace(sender) then
		sender:Give("weapon_zs_admin_path_tool")
	end
end)
end
