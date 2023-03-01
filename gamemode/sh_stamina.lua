

local meta = FindMetaTable("Player")
if not meta then return end
function meta:SetStamina(stamina)
	self:SetDTFloat(DT_PLAYER_FLOAT_STAMINA,stamina)
end
function meta:GetStamina()
	return self:GetDTFloat(DT_PLAYER_FLOAT_STAMINA)
end
function meta:AddStamina(stamina, run)
    if stamina < 0 then
        stamina = stamina * (self.StaminaUse or 1)
    elseif stamina > 0 then
        stamina = stamina * (self.StaminaAdd or 1)
    end
	self:SetStamina(math.Clamp(self:GetStamina() + stamina,1,100))
    if stamina < 0 then
        self.StaminaUsed = CurTime() + 1.1 + (self:GetActiveWeapon() and self:GetActiveWeapon().Primary.Delay or 1) * 1.7
        if run then
            self.StaminaRun = CurTime() + 0.5
        end
    end
end
