resource.AddSingleFile(Scoreboard_Cedille_v2.ressourceimg) 


util.AddNetworkString("envoiepourlaprison")

net.Receive("envoiepourlaprison", function(len, ply)
	local act     = net.ReadString() 
	local userid  = net.ReadUInt(8)
	local entUser = Entity(userid)

	if not IsValid(entUser) and not !Scoreboard_Cedille_v2.staff [ LocalPlayer():GetUserGroup() ] then
		print("L'utilisateur n'existe pas")
		return
	end
	

	if act == "bring" then
		ply:ConCommand("say /bring " .. entUser:UserID())
		return
	end

	if act == "goto" then
		ply:ConCommand("say /goto " .. entUser:UserID())
		return
	end

	if act == "teleport" then
		ply:ConCommand( "say /teleport " .. entUser:UserID())
		return
	end

	if act == "spectate" then
		ply:ConCommand( "say /spectate " .. entUser:UserID())
		return
	end

	if act == "kick" then
		ply:ConCommand( "say /kick " .. entUser:UserID())
		return
	end

	if act == "jail" then
		ply:ConCommand("say /jail " .. entUser:UserID() .. " 1 ")
		return
	end


if act == "unjail" then
		ply:ConCommand( "say /unjail " .. entUser:UserID())
		return
	end

	if act == "freeze" then
		ply:ConCommand("say /freeze " .. entUser:UserID() .. "")
		return
	end


	if act == "unfreeze" then
		ply:ConCommand( "say /unfreeze " .. entUser:UserID())
		return
	end



end)