AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

function ENT:Initialize()


    self:SetCollisionGroup(COLLISION_GROUP_DEBRIS_TRIGGER)
    self:SetModel("models/props_trainstation/trainstation_clock001.mdl")
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    self:GetPhysicsObject():EnableDrag( false )
    self:SetModelScale(1.3)
    self:PhysicsInitSphere(0.01)
    util.SpriteTrail(self,1,Color(255,238,0),false,2,0,0.05,0.5,"phoenix_storms/cube")
    self.Coin = true
    self.Chain = 1
    self.ShineTimeS = CurTime() + 0.6
    self.ShineTimeE = CurTime() + 0.7
    self.SingTime = CurTime() + 1.4
    self.OnDamage = false
    self.SingSound = Sound("ambient/energy/electric_loop.wav")
    self.ShineSound = Sound('resource/warning.wav')
    self.MRail = false
    self.ERail = false
    self.CIN = false
    self.MarksM = false
    self.Buffer = CurTime() + 0.15
    self.Piercer = false
    self.Parried = false
    self.dmg = DamageInfo()
    self.DCoin = 1
    self.PCoin = 1
end

function ENT:OnTakeDamage( dmg )

    self.DCoin = (self.DCoin or 1) + 1

    if (self.Buffer or 0) < CurTime() and dmg:IsBulletDamage() or (self.Buffer or 0) < CurTime() and dmg:GetDamageType() == 51492 then

        self:EmitSound(Sound("weapons/crossbow/bolt_fly4.wav"))

        self:StopSound("ambient/energy/electric_loop.wav")
        self:StopSound("ambient/energy/electric_loop.wav")
        self:StopSound("ambient/energy/electric_loop.wav")
        self:StopSound("ambient/energy/electric_loop.wav")
        self:StopSound("ambient/energy/electric_loop.wav")
        self:StopSound("ambient/energy/electric_loop.wav")
        self:StopSound("ambient/energy/electric_loop.wav")
        self:StopSound("ambient/energy/electric_loop.wav")
        self:StopSound("ambient/energy/electric_loop.wav")
        self:StopSound("ambient/energy/electric_loop.wav")
        self:StopSound("ambient/energy/electric_loop.wav")
        self:StopSound("ambient/energy/electric_loop.wav")
        self:StopSound("ambient/energy/electric_loop.wav")
        self:StopSound("ambient/energy/electric_loop.wav")
        self:StopSound("ambient/energy/electric_loop.wav")
        self:StopSound("ambient/energy/electric_loop.wav")
        
        self.OnDamage = true

        if self.Parried and self.PCoin < 5 then
            self.PCoin = self.PCoin + 1
        end

        self.dmg = DamageInfo()

        local WP = nil
        
        if dmg:GetAttacker():IsValid() and dmg:GetAttacker():IsPlayer() and dmg:GetAttacker():GetActiveWeapon():IsValid() then
            local WP = dmg:GetAttacker():GetActiveWeapon():GetPrintName()
        elseif dmg:GetInflictor().Coin == true and dmg:GetInflictor().MarksM == true then
            local WP = "Coin"
        end
        if WP == "Marksman" or WP == "Pierceshot" and self.Piercer == false or WP == "Coin" and dmg:GetAttacker().MarksM == true then
            self.MarksM = true
        end

        self.dmg:SetAttacker(dmg:GetAttacker())
        self.dmg:SetDamage(dmg:GetDamage())
        self.dmg:SetDamageType(dmg:GetDamageType())
        self.dmg:GetInflictor(dmg:GetInflictor())

        timer.Simple(0.02,function() if self:IsValid() then self:Remove() end end)

    elseif not dmg:GetDamageType() == DMG_BULLET then
        self:TakePhysicsDamage(dmg)
    end

end

function ENT:OnRemove()

    if 0 <= 1 then

        if self.OnDamage == true then

            local damagedealt = self.dmg:GetDamage()

            if self.ShineTimeS <= CurTime() and self.ShineTimeE > CurTime() and self.dmg:IsBulletDamage() or self.SingTime <= CurTime() and self.dmg:IsBulletDamage() then

                local ply = self.dmg:GetAttacker()

                local Vec = Vector(0,0,0)

                local Vec1 = Vector(0,0,0)

                local e1 = nil 

                local e2 = nil

                local SortedDef = {}
                local SortedCore = {}
                local SortedCoin = {}

                local function RandCoinVec(TheV)

                    local Dir1 = Vector(math.random(-1,1),math.random(-1,1),math.random(-1,1)):GetNormalized()
                    local Trace = {}
                    Trace.start = self:GetPos()
                    Trace.endpos = self:GetPos() + Dir1 * 100000
                    Trace.filter = {self}
                    local TR = util.TraceLine(Trace)
                    TheV = TR.HitPos - self:GetPos()
                    return (TR.HitPos - self:GetPos())

                end

                local function mySort1(a,b)
                    if  a[1] < b[1] then
                        return true
                    elseif a[1] > b[1] then
                        return false 
                    elseif a[1] == b[1] and a[3]:EntIndex() > b[3]:EntIndex() then
                        return true
                    elseif a[1] == b[1] and a[3]:EntIndex() < b[3]:EntIndex() then
                        return false
                    end
                end

                for i, e in pairs( table.Add(ents.GetAll(),player.GetAll()) ) do

                    if e.Coin == true and e != self and e:GetOwner() == self:GetOwner() then-- and e:GetOwner() == self:GetOwner()

                        local Dird = e:GetPos() - self:GetPos()

                        local dist = Dird:Length()

                        if self.MRail == true then
                            e.MRail = true
                        end
                        if self.ERail == true then
                            e.ERail = true
                        end

                        local td = {}
                        local res = {}
                        td.start = self:GetPos()
                        td.endpos = e:GetPos()
                        td.filter = {self}
                        td.ignoreworld = false
                        td.output = res
    
                        util.TraceLine(td)

                        if not res.HitWorld then
                            SortedCoin[#SortedCoin + 1] = {dist,Dird,e}
                        end
                    
                    elseif e.Core == true and e != self then

                        local Dird = e:GetPos() - self:GetPos()

                        local dist = Dird:Length()

                        if self.MRail == true then
                            e.MRail = true
                        end
                        if self.ERail == true then
                            e.ERail = true
                        end

                        local td = {}
                        local res = {}
                        td.start = self:GetPos()
                        td.endpos = e:GetPos()
                        td.filter = {self}
                        td.ignoreworld = false
                        td.output = res
    
                        util.TraceLine(td)

                        if not res.HitWorld then
                            SortedCore[#SortedCore + 1] = {dist,Dird,e}
                        end

                    elseif e:IsPlayer() and e != ply and e:IsValidLivingZombie() then

                        local Dird = e:HeadTarget( self:GetPos() ) - self:GetPos()

                        local dist = Dird:Length()

                        local td = {}
                        local res = {}
                        td.start = self:GetPos()
                        td.endpos = e:HeadTarget( self:GetPos() )
                        td.filter = {self}
                        td.ignoreworld = false
                        td.output = res
    
                        local res = util.TraceLine(td)

                        if e:Health() > 0 and not res.HitWorld then
                            SortedDef[#SortedDef + 1] = {dist,Dird,e}
                        end
                    end
                end

                table.sort(SortedCoin, mySort1)
                table.sort(SortedCore,mySort1)
                table.sort(SortedDef, mySort1)

                if #SortedCoin > 0 then
                    Vec = SortedCoin[1][2]
                    e1 = SortedCoin[1][3]
                    self.CIN = true
                    if e1:IsValid() then
                        e1.Chain = self.Chain + 1
                    end
                    if #SortedCore > 0 then
                        Vec1 = SortedCore[1][2]
                        e2 = SortedCore[1][3]
                    elseif #SortedDef > 0 then
                        Vec1 = SortedDef[1][2]
                        e2 = SortedDef[1][3]
                    else
                        Vec1 = RandCoinVec(Vec1)
                    end
                elseif #SortedCore > 0 then
                    Vec = SortedCore[1][2]
                    e1 = SortedCore[1][3]
                    if #SortedCore > 1 then
                        Vec1 = SortedCore[2][2]
                        e2 = SortedCore[2][3]
                    elseif #SortedDef > 0 then
                        Vec1 = SortedDef[1][2]
                        e2 = SortedDef[1][3]
                    else
                        Vec1 = RandCoinVec(Vec1)
                    end
                elseif #SortedDef > 0 then
                    Vec = SortedDef[1][2]
                    e1 = SortedDef[1][3]
                    if #SortedDef > 1 then
                        Vec1 = SortedDef[2][2]
                        e2 = SortedDef[2][3]
                    else
                        Vec1 = RandCoinVec(Vec1)
                    end
                else
                    Vec = RandCoinVec(Vec)
                    Vec1 = RandCoinVec(Vec1)
                end

                if self.MRail == true then
                    
                    if SERVER then

                        if self.CIN == false then

                            util.BlastDamage(self,self:GetOwner(),e1:GetPos(),250,150 * (self.Chain / 2 + 1))
                            local Eff = EffectData()
                            Eff:SetOrigin(e1:GetPos())
                            Eff:SetScale(10000000000000)
                            Eff:SetMagnitude(10000000000000)
                            Eff:SetFlags(0)
                            util.Effect("Explosion",Eff)

                        else

                            local dmg = DamageInfo()
                            dmg:SetAttacker(ply)
                            dmg:SetInflictor(self)
                            dmg:SetDamage(2)
                            dmg:SetDamageType(DMG_BULLET)

                            e1.MRail = true 
                            e1:SetOwner(self:GetOwner())

                            e1:TakeDamageInfo(dmg)

                        end

                        local gd = EffectData()
                        gd:SetOrigin(Vec + self:GetPos())
                        gd:SetStart(self:GetPos())
                        gd:SetFlags(1)

                        util.Effect("HL1GaussBeamReflect",gd)
                        gd:SetStart(self:GetPos() + Vector(0,0,5))
                        util.Effect("HL1GaussBeamReflect",gd)
                        gd:SetStart(self:GetPos() + Vector(0,0,-5))
                        util.Effect("HL1GaussBeamReflect",gd)
                        gd:SetStart(self:GetPos() + Vector(0,5,0))
                        util.Effect("HL1GaussBeamReflect",gd)
                        gd:SetStart(self:GetPos() + Vector(0,-5,0))
                        util.Effect("HL1GaussBeamReflect",gd)
                        
                    end

                elseif self.ERail == true then
                    
                    local TraceD = {}
                    local rest = {}
                    local dmg = DamageInfo()
                    dmg:SetAttacker(ply)
                    dmg:SetInflictor(self)
                    dmg:SetReportedPosition(ply:GetShootPos())
                    dmg:SetDamage(33 + damagedealt / 9)
                    dmg:SetDamageForce(ply:GetAimVector() * 30000)
                    dmg:SetDamagePosition(ply:GetShootPos())
                    dmg:SetDamageType(DMG_BULLET)
                    TraceD.start = self:GetPos()
                    TraceD.endpos = Vec:GetNormalized() * 99999 + self:GetPos()
                    TraceD.maxs = Vector(15,15,15)
                    TraceD.mins = Vector(-15,-15,-15)
                    TraceD.filter = function(e) 
                        if not e:IsWorld() then  
                            if e:IsPlayer() and e != ply or e:IsNPC() or e.Coin == true or e.Core == true then
                                if e.Coin == true then
                                    e.ERail = true
                                    e:SetOwner(ply)
                                    return true
                                end
                                e:TakeDamageInfo(dmg)
                                --e:TakePhysicsDamage(dmg)
                            end
                            return false
                        else 
                            return true 
                        end
                    end
                    TraceD.output = rest
                    util.TraceHull(TraceD)
                    timer.Simple(0.1,function() util.TraceHull(TraceD) end)
                    timer.Simple(0.2,function() util.TraceHull(TraceD) end)

                    local gd = EffectData()
                    gd:SetOrigin(rest.HitPos)
                    gd:SetStart(self:GetPos())
                    gd:SetFlags(0)

                    util.Effect("HL1GaussBeamReflect",gd)
                    gd:SetStart(self:GetPos() + Vector(0,0,5))
                    util.Effect("HL1GaussBeamReflect",gd)
                    gd:SetStart(self:GetPos() + Vector(0,0,-5))
                    util.Effect("HL1GaussBeamReflect",gd)
                    gd:SetStart(self:GetPos() + Vector(0,5,0))
                    util.Effect("HL1GaussBeamReflect",gd)
                    gd:SetStart(self:GetPos() + Vector(0,-5,0))
                    util.Effect("HL1GaussBeamReflect",gd)

                elseif self.Piercer == true then

                    local TraceD = {}
                    local rest = {}
                    local dmg = DamageInfo()
                    dmg:SetAttacker(ply)
                    dmg:SetInflictor(self)
                    dmg:SetReportedPosition(self:GetPos())
                    dmg:SetDamage(60 + damagedealt / 2)
                    dmg:SetDamageForce(ply:GetAimVector() * 30000)
                    dmg:SetDamagePosition(self:GetPos())
                    dmg:SetDamageType(DMG_BULLET)
                    TraceD.start = self:GetPos()
                    TraceD.endpos = self:GetPos() + Vec:GetNormalized() * 99999
                    TraceD.maxs = Vector(15,15,15)
                    TraceD.mins = Vector(-15,-15,-15)
                    if SERVER then
                        local val = 5
                        TraceD.filter = function(e) 
                            if not e:IsWorld() and val > 0 then  
                                if e:IsPlayer() and e != ply or e:IsNPC() or e.Coin == true or e.Core == true then
                                    if e.Coin == true then
                                        e.Piercer = true
                                        e:SetOwner(self:GetOwner())
                                        return true
                                    end
                                    e:TakeDamageInfo(dmg)
                                    e:TakePhysicsDamage(dmg)
                                end
                                val = val - 1
                                return false
                            else 
                                return true 
                            end
                        end
                    end
                    TraceD.output = rest
                    ply:LagCompensation( true )
                    util.TraceHull(TraceD)
                    TraceD.endpos = rest.HitPos
                    timer.Simple(0.05,function() util.TraceHull(TraceD) end)
                    ply:LagCompensation( false )
                    local gd = EffectData()
                    gd:SetOrigin(rest.HitPos)
                    gd:SetStart(self:GetPos())
                    gd:SetFlags(0)

                    util.Effect("HL1GaussBeamReflect",gd)

                elseif self.MarksM == true then

                    local Bullet = {}
                    Bullet.AmmoType = "357"
                    Bullet.Attacker = ply
                    Bullet.Damage = self.dmg:GetDamage() * 2
                    Bullet.Dir = Vec
                    Bullet.Distance = Vec:Length()
                    Bullet.Force = 20
                    Bullet.HullSize = 1
                    Bullet.IgnoreEntity = self.dmg:GetAttacker()
                    Bullet.Num = 1
                    Bullet.Spread = Vector(0,0,0)
                    Bullet.Src = self:GetPos()
                    Bullet.Tracer = 1
                    Bullet.TracerName = "GaussTracer"
                    if e1 != nil and e1.MarksM == true then
                        e1.MarksM = true
                        e1:SetOwner(self:GetOwner())
                    end

                    local gd = EffectData()
                    gd:SetOrigin(Vec + self:GetPos())
                    gd:SetStart(self:GetPos())
                    gd:SetFlags(1)

                    util.Effect("HL1GaussBeamReflect",gd)

                    self:FireBullets( Bullet )

                    Bullet.AmmoType = "357"
                    Bullet.Attacker = ply
                    Bullet.Damage = self.dmg:GetDamage() * 2
                    Bullet.Dir = Vec1
                    Bullet.Distance = Vec1:Length()
                    Bullet.Force = 20
                    Bullet.HullSize = 1
                    Bullet.IgnoreEntity = self.dmg:GetAttacker()
                    Bullet.Num = 1
                    Bullet.Spread = Vector(0,0,0)
                    Bullet.Src = self:GetPos()
                    Bullet.Tracer = 1
                    Bullet.TracerName = "GaussTracer"
                    if e2 != nil and e2.MarksM == true then
                        e2.MarksM = true
                        e2:SetOwner(self:GetOwner())
                    end

                    local gd = EffectData()
                    gd:SetOrigin(Vec1 + self:GetPos())
                    gd:SetStart(self:GetPos())
                    gd:SetFlags(1)

                    util.Effect("HL1GaussBeamReflect",gd)

                    self:FireBullets( Bullet )

                else


                    if e1 != nil and e1.MarksM == true then
                        e1:SetOwner(self:GetOwner())
                        e1.MarksM = true
                    end

                    local gd = EffectData()
                    gd:SetOrigin(Vec + self:GetPos())
                    gd:SetStart(self:GetPos())
                    gd:SetFlags(1)

                    util.Effect("HL1GaussBeamReflect",gd)

          
                        if self.dmg:GetDamage() * 3 <= 300 then
                          net.Start("zs_update_style") net.WriteTable({time = CurTime()+4+(math.random(10,20)*0.2),text = "RICOSHOT",score = 50,color = Color(70,181,255)}) net.Send(ply) 
                       else
                           net.Start("zs_update_style") net.WriteTable({time = CurTime()+4+(math.random(10,20)*0.2),text = "ULTRARICOSHOT",score = 150,color = Color(51,122,168)}) net.Send(ply) 
                       end
                    self:FireBulletsLua(self:GetPos(),Vec,0,1,self.dmg:GetDamage() * 2,ply,20,"GaussTracer",nil,1 )
                    
                end

            elseif self.dmg:IsBulletDamage() or self.dmg:GetDamageType() == 51492 then

                local ply = self.dmg:GetAttacker()

                local Vec = Vector(0,0,0)

                local Vec1 = Vector(0,0,0)

                local e1 = nil 

                local SortedDef = {}
                local SortedCoin = {}

                local function mySort1(a,b)
                    if  a[1] < b[1] then
                        return true
                    elseif a[1] > b[1] then
                        return false 
                    elseif a[1] == b[1] and a[3]:EntIndex() > b[3]:EntIndex() then
                        return true
                    elseif a[1] == b[1] and a[3]:EntIndex() < b[3]:EntIndex() then
                        return false
                    end
                end

                for i, e in pairs( table.Add(ents.GetAll(),player.GetAll()) ) do

                    if e.Coin == true and e != self and e:GetOwner() == self:GetOwner()  or e.Core == true and e != self then

                        local Dird = e:GetPos() - self:GetPos()

                        local dist = Dird:Length()

                        if self.MRail == true then
                            e.MRail = true
                        end
                        if self.ERail == true then
                            e.ERail = true
                        end

                        local td = {}
                        local res = {}
                        td.start = self:GetPos()
                        td.endpos = e:GetPos()
                        td.filter = {self}
                        td.ignoreworld = false
                        td.output = res

                        util.TraceLine(td)

                        if not res.HitWorld then
                            SortedCoin[#SortedCoin + 1] = {dist,Dird,e}
                        end

                    elseif e:IsPlayer() and e != ply and e:IsValidLivingZombie() then

                        local Dird = e:HeadTarget( self:GetPos() ) - self:GetPos()

                        local dist = Dird:Length()

                        local td = {}
                        local res = {}
                        td.start = self:GetPos()
                        td.endpos = e:HeadTarget( self:GetPos() )
                        td.filter = {self}
                        td.ignoreworld = false
                        td.output = res
    
                        util.TraceLine(td)

                        if e:Health() > 0 and not res.HitWorld then
                            SortedDef[#SortedDef + 1] = {dist,Dird,e}
                        end
                    elseif string.sub(e:GetClass(),1,10) == "projectile" and (e:GetOwner() == self:GetOwner() or e:GetOwner():IsValidLivingZombie()) then

                        local Dird = e:GetPos() - self:GetPos()

                        local dist = Dird:Length()
                        
                        local td = {}
                        local res = {}
                        td.start = self:GetPos()
                        td.endpos = e:GetPos()
                        td.filter = {self}
                        td.ignoreworld = false
                        td.output = res
                        util.TraceLine(td)
                        e.Proj = true
                        if not res.HitWorld then
                            SortedDef[#SortedDef + 1] = {dist,Dird,e}
                        end
                    end
                end

                table.sort(SortedCoin, mySort1)
                table.sort(SortedDef, mySort1)

                if #SortedCoin > 0 then
                    Vec = SortedCoin[1][2]
                    e1 = SortedCoin[1][3]
                    if e1:IsValid() then
                        e1.Chain = self.Chain + 1
                    end
                    self.CIN = true
                elseif #SortedDef > 0 then
                    Vec = SortedDef[1][2]
                    e1 = SortedDef[1][3]
                else
                    local Dir1 = Vector(math.random(-1,1),math.random(-1,1),math.random(-1,1)):GetNormalized()
                    local Trace = {}
                    Trace.start = self:GetPos()
                    Trace.endpos = self:GetPos() + Dir1 * 100000
                    Trace.filter = {self}
                    local TR = util.TraceLine(Trace)
                    Vec = TR.HitPos - self:GetPos()
                    self.CIN = true
                end

                if self.MRail == true then
                        if self.CIN == false then
                            
                            util.BlastDamage(self,self:GetOwner(),e1:GetPos(),250,150 * (self.Chain / 2 + 1))
                            local Eff = EffectData()
                            Eff:SetOrigin(e1:GetPos())
                            Eff:SetScale(10000000000000)
                            Eff:SetMagnitude(10000000000000)
                            Eff:SetFlags(0)
                            util.Effect("Explosion",Eff)

                        else

                            if e1 != nil then

                                local dmg = DamageInfo()
                                dmg:SetDamageType(DMG_BULLET)
                                dmg:SetInflictor(self)
                                dmg:SetAttacker(ply)
                                dmg:SetDamage(2)

                                e1.MRail = true
                                e1:SetOwner(self:GetOwner())
                                
                                e1:TakeDamageInfo(dmg)

                            end

                        end

                        local gd = EffectData()
                        gd:SetOrigin(Vec + self:GetPos())
                        gd:SetStart(self:GetPos())
                        gd:SetFlags(1)

                        util.Effect("HL1GaussBeamReflect",gd)
                        gd:SetStart(self:GetPos() + Vector(0,0,5))
                        util.Effect("HL1GaussBeamReflect",gd)
                        gd:SetStart(self:GetPos() + Vector(0,0,-5))
                        util.Effect("HL1GaussBeamReflect",gd)
                        gd:SetStart(self:GetPos() + Vector(0,5,0))
                        util.Effect("HL1GaussBeamReflect",gd)
                        gd:SetStart(self:GetPos() + Vector(0,-5,0))
                        util.Effect("HL1GaussBeamReflect",gd)
    
                elseif e1 and e1.Proj and e1:IsValid() then
                    
                    local gd = EffectData()
                    gd:SetOrigin(Vec + self:GetPos())
                    gd:SetStart(self:GetPos())
                    gd:SetFlags(1)

                    util.Effect("HL1GaussBeamReflect",gd)
                    if self.dmg:GetDamage() * 3 <= 300 then
                     net.Start("zs_update_style") net.WriteTable({time = CurTime()+4+(math.random(10,20)*0.2),text = "PROJECTILE BOOM!",score = 35,color = Color(255,70,70)}) net.Send(ply) 
                    else
                        net.Start("zs_update_style") net.WriteTable({time = CurTime()+4+(math.random(10,20)*0.2),text = "ULTRA-BOOM!!!",score = 250,color = Color(168,51,152)}) net.Send(ply) 
                    end
                    self:FireBulletsLua(self:GetPos(),Vec,0,1,self.dmg:GetDamage() * 3,ply,20,"GaussTracer",nil,1 )
                    util.BlastDamage(self,self:GetOwner(),e1:GetPos(),250,(e1.ProjectileDamage or e1.Damage or e1.ProjDamage or 300) * (self.Chain / 2 + 1))
                    local Eff = EffectData()
                    Eff:SetOrigin(e1:GetPos())
                    Eff:SetScale(10000000000000)
                    Eff:SetMagnitude(10000000000000)
                    Eff:SetFlags(0)
                    util.Effect("Explosion",Eff)
                    e1:Remove()
                else

                    local gd = EffectData()
                    gd:SetOrigin(Vec + self:GetPos())
                    gd:SetStart(self:GetPos())
                    gd:SetFlags(1)

                    util.Effect("HL1GaussBeamReflect",gd)
                    if self.dmg:GetDamage() * 3 <= 300 then
                     net.Start("zs_update_style") net.WriteTable({time = CurTime()+4+(math.random(10,20)*0.2),text = "RICOSHOT",score = 50,color = Color(70,181,255)}) net.Send(ply) 
                    else
                        net.Start("zs_update_style") net.WriteTable({time = CurTime()+4+(math.random(10,20)*0.2),text = "ULTRARICOSHOT",score = 150,color = Color(51,122,168)}) net.Send(ply) 
                    end
                    self:FireBulletsLua(self:GetPos(),Vec,0,1,self.dmg:GetDamage() * 3,ply,20,"GaussTracer",nil,1 )

                end

            end

        end

    end

end

function ENT:Think()

    if self.SingTime <= CurTime() then
        self:EmitSound(self.SingSound)
    end
    if self.ShineTimeS - 0.15 <= CurTime() and self.ShineTimeE - 0.1 > CurTime() then
        self:EmitSound(self.ShineSound)
        effects.BeamRingPoint(self:GetPos(),0.4,0,20,1,0,Color(251,255,0))
    end

end

function ENT:PhysicsCollide( cld, c)

    self:Remove()

    self:StopSound("ambient/energy/electric_loop.wav")
    self:StopSound("ambient/energy/electric_loop.wav")
    self:StopSound("ambient/energy/electric_loop.wav")
    self:StopSound("ambient/energy/electric_loop.wav")
    self:StopSound("ambient/energy/electric_loop.wav")
    self:StopSound("ambient/energy/electric_loop.wav")
    self:StopSound("ambient/energy/electric_loop.wav")
    self:StopSound("ambient/energy/electric_loop.wav")
    self:StopSound("ambient/energy/electric_loop.wav")
    self:StopSound("ambient/energy/electric_loop.wav")
    self:StopSound("ambient/energy/electric_loop.wav")
    self:StopSound("ambient/energy/electric_loop.wav")
    self:StopSound("ambient/energy/electric_loop.wav")
    self:StopSound("ambient/energy/electric_loop.wav")
    self:StopSound("ambient/energy/electric_loop.wav")

    self.OnDamage = false

end



