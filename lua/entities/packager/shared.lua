ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "weed processer"
ENT.Spawnable = true
ENT.Category  = "Cosmos weed"

function ENT:SetupDataTables()
	self:NetworkVar("Bool", 0, "HasChloride")
	self:NetworkVar("Bool", 1, "HasSodium")
end