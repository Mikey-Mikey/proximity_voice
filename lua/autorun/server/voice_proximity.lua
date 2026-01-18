hook.Add( "PlayerCanHearPlayersVoice", "Maximum Range", function( listener, talker )
    if listener:GetPos():DistToSqr( talker:GetPos() ) > 1500^2 then
        return false
    end

    return true, true
end )