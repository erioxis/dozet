include("shared.lua")

CLASS.Icon = "zombiesurvival/killicons/skeletal_walker"
CLASS.IconColor = Color(0, 255, 0)

local matSkin = Material("Models/Barnacle/barnacle_sheet")
function CLASS:PrePlayerDraw(pl)
	render.SetColorModulation(0, 1, 0)
	render.ModelMaterialOverride(matSkin)
end

function CLASS:PostPlayerDraw(pl)
	render.SetColorModulation(1, 1, 1)
	render.ModelMaterialOverride()
end

local math_Rand = math.Rand
local math_random = math.random
local function CreateBoneOffsets(pl)
	pl.m_NightmareBoneOffsetsNext = CurTime() + 0.05

	local offsets = {}
	local angs = {}
	for i=1, pl:GetBoneCount() - 1 do
		if math_random(3) == 3 then
			offsets[i] = VectorRand():GetNormalized() * math.Rand(0.2, 2)*i
		end
		if math_random(5) == 5 then
			angs[i] = Angle(math_Rand(-1, 1)*i, math_Rand(-1, 1)*i, math_Rand(-1, 1)*i)
		end
	end
	pl.m_NightmareBoneOffsets = offsets
	pl.m_NightmareBoneAngles = angs
end

function CLASS:BuildBonePositions(pl)
	if not pl.m_NightmareBoneOffsets or CurTime() >= pl.m_NightmareBoneOffsetsNext then
		CreateBoneOffsets(pl)
	end

	local offsets = pl.m_NightmareBoneOffsets
	local angs = pl.m_NightmareBoneAngles
	for i=1, pl:GetBoneCount() - 1 do
		if offsets[i] then
			pl:ManipulateBonePosition(i, offsets[i])
		end
		if angs[i] then
			pl:ManipulateBoneAngles(i, angs[i])
		end
	end
end
