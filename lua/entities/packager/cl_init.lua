include("shared.lua")

function ENT:Draw()
	self:DrawModel()
	end
	
	
	local function Draw3DText( pos, ang, scale, text, flipView )
	if ( flipView ) then
		-- Flip the angle 180 degrees around the UP axis
		ang:RotateAroundAxis( Vector( 0, 0, 1 ), 180 )
	end

	cam.Start3D2D( pos, ang, scale )
		-- Actually draw the text. Customize this to your liking.
		draw.DrawText( text, "Default", 0, 0, Color( 0, 0, 0, 255 ), TEXT_ALIGN_CENTER )
	cam.End3D2D()
end

function ENT:Draw()
	-- Draw the model
	self:DrawModel()

	-- The text to display
	local text = "weed processer"

	-- The position. We use model bounds to make the text appear just above the model. Customize this to your liking.
	local mins, maxs = self:GetModelBounds()
	local pos = self:GetPos() + Vector( 0, 0, maxs.z + 3 )

	-- The angle
	local ang = Angle( 0, SysTime() * 100 % 360, 90 )

	-- Draw front
	Draw3DText( pos, ang, 0.2, text, false )
	-- DrawDraw3DTextback
	Draw3DText( pos, ang, 0.2, text, true )
end