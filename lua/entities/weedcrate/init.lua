AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

function ENT:Initialize()
	self:SetModel("models/cosmo/gmod/weed/weed_big_bag03.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	local phys = self:GetPhysicsObject()
	if phys:IsValid() then
		phys:Wake()
	end
	self:SetUseType(3)
end

function ENT:Think()

end

function ENT:Use(activator, caller)
	if IsValid(caller) and caller:IsPlayer() then
		for k, v in pairs(ents.FindInSphere(self:GetPos(), 75)) do
			if v:GetClass() == "buyer" then
				caller:addMoney(v:GetMethPrice())
				caller:ChatPrint("You have sold weed for $"..v:GetMethPrice().."")
				self:Remove()
			end
		end
	end
end


ENT.OurHealth = 25; -- Amount of damage that the entity can handle - set to 0 to make it indestructible
 
 function ENT:OnTakeDamage(dmg)
    self:TakePhysicsDamage(dmg); -- React physically when getting shot/blown
 
    if(self.OurHealth <= 0) then return; end -- If the health-variable is already zero or below it - do nothing
 
    self.OurHealth = self.OurHealth - dmg:GetDamage(); -- Reduce the amount of damage took from our health-variable
 
    if(self.OurHealth <= 0) then -- If our health-variable is zero or below it
        self:Remove(); -- Remove our entity
    end
 end