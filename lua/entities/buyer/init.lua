AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

function ENT:Initialize()
	self:SetModel("models/gman.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	local phys = self:GetPhysicsObject()
	if phys:IsValid() then
		phys:Wake()
	end
	self:SetUseType(3)
	self:SetMethPrice(450)
	self:SetCokePrice(150)
	self:SetWeedPrice(60000)
	self:SetHeroinPrice(100000)
end

function ENT:Think()

end

function ENT:Use(activator, caller)
	if IsValid(caller) and caller:IsPlayer() then
		caller:ChatPrint("Go away! You never saw me")
		activator:EmitSound( "vo/npc/male01/gethellout.wav", 100, 100 )
	end
end