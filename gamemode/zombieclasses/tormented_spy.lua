CLASS.Base = "wraith"

CLASS.Name = "Corrupted Spy"
CLASS.TranslationName = "class_tormented_spy"
CLASS.Description = "description_tormented_spy"
CLASS.Help = "controls_tormented_spy"

CLASS.Health = 3
CLASS.Points = CLASS.Health/GM.NoHeadboxZombiePointRatio
CLASS.Speed = 450

CLASS.Wave = 5 / 6

CLASS.DynamicHealth = 0

CLASS.SWEP = "weapon_zs_tormentedspy"

function CLASS:Move(pl, move)
	local wep = pl:GetActiveWeapon()
	if not wep.GetTormented then return end

	if CurTime() < wep:GetTormented() + 2 then
		move:SetMaxSpeed(925)
		move:SetMaxClientSpeed(925)
	end

	if pl:KeyDown(IN_SPEED) then
		move:SetMaxSpeed(100)
		move:SetMaxClientSpeed(100)
	end
end
function CLASS:PlayDeathSound(pl)
	for i=1, 4 do
		pl:EmitSound("zombiesurvival/wraithdeath4.ogg", 75, math.random(80, 140), 0.6, CHAN_AUTO + i)
	end

	return true
end

function CLASS:DoAnimationEvent(pl, event, data)
	if event == PLAYERANIMEVENT_ATTACK_PRIMARY then
		pl:AnimRestartGesture(GESTURE_SLOT_ATTACK_AND_RELOAD, ACT_GMOD_GESTURE_RANGE_ZOMBIE_SPECIAL, true)
		return ACT_INVALID
	elseif event == PLAYERANIMEVENT_RELOAD then
		pl:AnimRestartGesture(GESTURE_SLOT_ATTACK_AND_RELOAD, ACT_GMOD_GESTURE_TAUNT_ZOMBIE, true)
		return ACT_INVALID
	end
end

if SERVER then
	function CLASS:ProcessDamage(pl, dmginfo)
		local activ = pl:GetActiveWeapon()
		if not activ.GetTormented then return end

		local attacker, dmg = dmginfo:GetAttacker(), dmginfo:GetDamage()
		if not attacker:IsValidLivingHuman() or CurTime() < activ:GetTormented() + 8 then return end

		if pl:Health() - dmg < 20 then
			for i = 0, 3 do
				timer.Simple(0.04 * i,
					function() if pl:IsValidLivingZombie() then pl:EmitSound("npc/stalker/go_alert2a.wav", 75, 120 + i*12, 0.4, CHAN_WEAPON + i) end
				end)
			end

			activ:SetTormented(CurTime())
		end
		return dmginfo
	end
end

if not CLIENT then return end

CLASS.Icon = "zombiesurvival/killicons/wraithv2"
CLASS.IconColor = Color(90, 0, 200)

function CLASS:PrePlayerDraw(pl)
	local alpha = self:GetAlpha(pl)
	if alpha == 0 then return true end

	render.SetBlend(alpha)
	render.SetColorModulation(0.025, 0.15, 0.065)
	render.SuppressEngineLighting(true)
end



