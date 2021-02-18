AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()
    self:SetModel("models/cosmo/gmod/weed/weed_plant_medium02.mdl")
    self:PhysicsInit( SOLID_VPHYSICS )
    self:SetMoveType( MOVETYPE_VPHYSICS )
    self:SetSolid( SOLID_VPHYSICS )
    local phys = self:GetPhysicsObject()
    if (phys:IsValid()) then
     phys:Wake()
    end
    self.isBaking = false
    self.finishBakeTime = 0
   end

function ENT:StartTouch(ent)
    if ent:GetClass() == "seeds" and self.isBaking == false then
        ent:Remove()
        self.isBaking = true 
        self.finishBakeTime = CurTime() + 60
    end
    end

    function ENT:Think()
        if self.isBaking == true then
            
        else
           
        end
           

        if self.isBaking == true then
            if self.finishBakeTime <= CurTime() then
                self.isBaking = false

                local bread = ents.Create("weedbag")
                bread:SetPos(self:GetPos() + Vector(0,0,25))
                bread:Spawn()
            end
        end
    end
-------------------------------------------------------------------------------------------------
ENT.OurHealth = 25; -- Amount of damage that the entity can handle - set to 0 to make it indestructible
 
 function ENT:OnTakeDamage(dmg)
    self:TakePhysicsDamage(dmg); -- React physically when getting shot/blown
 
    if(self.OurHealth <= 0) then return; end -- If the health-variable is already zero or below it - do nothing
 
    self.OurHealth = self.OurHealth - dmg:GetDamage(); -- Reduce the amount of damage took from our health-variable
 
    if(self.OurHealth <= 0) then -- If our health-variable is zero or below it
        self:Remove(); -- Remove our entity
    end
 end