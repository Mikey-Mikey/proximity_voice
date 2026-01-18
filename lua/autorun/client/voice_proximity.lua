local voiceFalloff = 200

hook.Add( "Think", "Voice_Proximity_Think", function()

        for _, ply in ipairs( player.GetHumans() ) do
            if ply == LocalPlayer() then continue end
            ply:SetVoiceVolumeScale( 1 / ( 1 + ( ply:GetShootPos() + ply:GetVelocity() * FrameTime() * 90 ):Distance( LocalPlayer():GetShootPos() + LocalPlayer():GetVelocity() * FrameTime() * 90 )^2 / voiceFalloff^2 ) )
        end
	
end )

hook.Add( "PlayerStartVoice", "Voice_Proximity_PlayerStartVoice", function( ply )
	if LocalPlayer():GetShootPos():DistToSqr( ply:GetShootPos() ) > 1500^2 then
		return false
	end
end )