ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "buyer"
ENT.Category = "Cosmos weed"

ENT.Spawnable = true

function ENT:SetupDataTables()
	self:NetworkVar("Int", 0, "MethPrice")
	self:NetworkVar("Int", 1, "CokePrice")
	self:NetworkVar("Int", 2, "WeedPrice")
	self:NetworkVar("Int", 3, "HeroinPrice")
end