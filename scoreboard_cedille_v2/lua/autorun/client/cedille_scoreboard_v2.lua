--[[-------------------------------------------------------------------------
Permet de créer un font pour définir la taille d'écriture
---------------------------------------------------------------------------]]--

surface.CreateFont( "Scoreboard.Config.font1", {
	font = "Roboto-Black", 
	extended = false,
	size = 30,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )


local PanelPrincipal = nil
local scrh,scrw = ScrH(),ScrW()
local ply = LocalPlayer()


local function verifmenustaff()
    if !Scoreboard_Cedille_v2.staff [ LocalPlayer():GetUserGroup() ] then
        return false
    end
    return true
end

hook.Add( "ScoreboardShow", "creationduscoreboardv2", function()

	if not IsValid(PanelPrincipal) then  -- permet de vérifier si le panel n'est pas valid (qu'il n'existe pas) pour délencher la création du DFrame
 		PanelPrincipal = vgui.Create( "DFrame" )
 		PanelPrincipal:SetSize( 1000, 800 ) -- Permet de déterminer la taille 1000 = w (largeur) / 800 = h /hauteur
		PanelPrincipal:Center() -- Permet de placer au milieu le DFrame --
		PanelPrincipal:SetTitle( "" ) -- Permet de déterminer le titre du DFrame --
		PanelPrincipal:SetDraggable( true ) -- Si oui ou non on peut déplacer le menu avec la souris --
		PanelPrincipal:ShowCloseButton(false) -- si oui ou non, on décide de montrer le bouton de base pour le fermer
		PanelPrincipal.Paint = function() -- Permet de créer la fonction pour changer la couleur du DFRame
	 		draw.RoundedBox(5,0,0,PanelPrincipal:GetWide(),PanelPrincipal:GetTall(),Color(0,0,0,200)) 
		end 
	end   

	local Image_fond = vgui.Create( "DImage", PanelPrincipal )
		Image_fond:SetPos( 250, 40 )	
		Image_fond:SetSize( 750, 760)
		Image_fond:SetImage( Scoreboard_Cedille_v2.ressourceimg)

	local DPanel = vgui.Create( "DPanel",PanelPrincipal )
		DPanel:SetPos( 0, 0 ) 
		DPanel:SetSize( 1000, 40 )
		DPanel.Paint = function(s, w, h)
		local cPlayers = player.GetCount()
		draw.RoundedBox(5,0,0,w,40,Scoreboard_Cedille_v2.couleurdumenuH )
		draw.SimpleText(Scoreboard_Cedille_v2.nomserveur,"Scoreboard.Config.font1",10,7,Color(255,255,255,255))
		draw.SimpleText(Scoreboard_Cedille_v2.ipserveur ,"Scoreboard.Config.font1",380,7,Color(255,255,255,255))
		if Scoreboard_Cedille_v2.staffjoueurco [ LocalPlayer():GetUserGroup() ]  then 
			draw.SimpleText( cPlayers == 1 and "1 joueur connecté" or  cPlayers .. Scoreboard_Cedille_v2.nbrdejoueurs, "Scoreboard.Config.font1", 750,7, Color(255,255,255,255))
		end
	end 

	local PanelPlayer = vgui.Create( "DPanel", PanelPrincipal )
		PanelPlayer:SetPos( 0, 40 ) 
		PanelPlayer:SetSize( 350, 800 )
		PanelPlayer.Paint = function(s, w, h)
		end 
 
	local PLayerScrollPanel = vgui.Create("DScrollPanel",PanelPlayer)
		PLayerScrollPanel:SetSize(PanelPlayer:GetWide(),PanelPlayer:GetTall()-20)
		PLayerScrollPanel:SetPos(0,0)
		local sbar = PLayerScrollPanel:GetVBar()

	function sbar:Paint(w,h)
		draw.RoundedBox(0,0,0,w,h,Color(0,0,0,0))
	end

	function sbar.btnUp:Paint( w, h )
		draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0,0) ) 
	end

	function sbar.btnDown:Paint( w, h )
		draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0,0) ) 
	end

	function sbar.btnGrip:Paint( w, h )
		draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0,0 ) )
	end

	PLayerList = vgui.Create("DListLayout",PLayerScrollPanel)
		PLayerList:SetSize(250,PLayerScrollPanel:GetTall())
		PLayerList:SetPos(0,0)

	if IsValid(PanelPrincipal) then
		PLayerList:Clear()
		for k,v in pairs(player.GetAll()) do
			
			local PlayerPanel = vgui.Create("DPanel",PLayerList)
			PlayerPanel:SetSize(PLayerList:GetWide(),60)
			PlayerPanel:SetPos(0,0)
			PlayerPanel.Paint = function(s, w, h)
				draw.RoundedBox(0,0,0, w, h,Scoreboard_Cedille_v2.couleurprincipal)
				draw.RoundedBox(0,0,49,w,1,Scoreboard_Cedille_v2.couleurligne) -- pour gérer la barre orange --
				draw.SimpleText(v:Nick(),"Scoreboard.Config.font1", 0, 10, Scoreboard_Cedille_v2.couleurAffNom )			
			end 

			if  Scoreboard_Cedille_v2.staffInvisible  [ v:GetUserGroup() ] then
				PlayerPanel:Remove()
			end
           
			local boutonmenustaff = vgui.Create( "DLabel", PlayerPanel )
  				boutonmenustaff:SetSize( PlayerPanel:GetWide() - 5, PlayerPanel:GetTall() )
            	boutonmenustaff:SetPos( 0, 0 )
           		boutonmenustaff:SetText( "" )
           		boutonmenustaff:SetMouseInputEnabled( true )
 				boutonmenustaff.DoDoubleClick = function()
            		if not verifmenustaff() then chat.AddText(Color(255,255,255),"Steam ID: ",Color(255,43,0,255),v:SteamID()) return end
                	if IsValid(PanelPrincipal) then PanelPrincipal:Remove() end           
                	Framemenustaff( v )
           		end
		end 
	end 

	PanelPrincipal:Show()
	PanelPrincipal:MakePopup()
	PanelPrincipal:SetKeyBoardInputEnabled(false)
	return true
end)

function Framemenustaff(v) 

	menustaff = vgui.Create( "DFrame" )
	menustaff:SetPos( 100, 100 )
	menustaff:Dock(LEFT)
	menustaff:SetSize( 300, 200 )
	menustaff:SetTitle( "" )
	menustaff:SetDraggable( true )
	menustaff:MakePopup()
	menustaff.Paint = function()
		draw.RoundedBox(0,0,0,menustaff:GetWide(),menustaff:GetTall(),Color(0,0,0,100))
		draw.SimpleText(v:GetName(),"Scoreboard.Config.font1",50,50,Scoreboard_Cedille_v2.couleurNomjoueur)
		draw.SimpleText("Nombre de Kills: "..v:Frags(),"Scoreboard.Config.font1",10,100,Scoreboard_Cedille_v2.couleurnbrkill )
		draw.SimpleText("Nombre de Morts: "..v:Deaths(),"Scoreboard.Config.font1",10,140,Scoreboard_Cedille_v2.couleurnbrMorts )
		draw.SimpleText("Argent: "..v:getDarkRPVar("money"),"Scoreboard.Config.font1",10,180,Scoreboard_Cedille_v2.couleurArgent)
		draw.SimpleText("Métier: "..team.GetName(v:Team()),"Scoreboard.Config.font1",10,220,Scoreboard_Cedille_v2.couleurMetier)
	end 

	local skindujoueur = vgui.Create( "DModelPanel", menustaff )
		skindujoueur:SetSize( 300, 300 )
		skindujoueur:SetPos(5,250)
		skindujoueur:SetModel( v:GetModel() )

	local Imageinfo = vgui.Create( "DImageButton", menustaff )
		Imageinfo:SetPos( 130, 30 )				
		Imageinfo:SetImage( "icon16/information.png" )	
		Imageinfo:SizeToContents()	
		Imageinfo.DoClick = function(s)
		 	 chat.AddText(Color(255,255,255),"Steam ID: ",Color(255,43,0,255),v:SteamID()) 
		end

	local Boutonpagesteam = vgui.Create( "DButton", menustaff ) 
		Boutonpagesteam:SetText( "Page steam" )					
		Boutonpagesteam:SetPos( 25, 270 )					
		Boutonpagesteam:SetSize( 250, 30 )
		Boutonpagesteam:SetTextColor(Scoreboard_Cedille_v2.steamcolortext )
		Boutonpagesteam.OnCursorEntered = function(self)  self.cursor = true end 
		Boutonpagesteam.OnCursorExited = function(self)  self.cursor = false  end 
 		Boutonpagesteam.Slide = 0 					
		Boutonpagesteam.DoClick = function()
	    	LocalPlayer():ShowProfile()
		end

	function Boutonpagesteam:Paint(w,h)
			draw.RoundedBox( 10, 0, 0, w, h,Scoreboard_Cedille_v2.steamcolorbackground)
		if self.cursor then 
				self.Slide = Lerp( 0.05, self.Slide, w )
					draw.RoundedBox(10, 0, 0, self.Slide, h, Scoreboard_Cedille_v2.steamcolorCursorEntered )
			else
				self.Slide = Lerp( 0.05, self.Slide, 0 )
					draw.RoundedBox(10, 0, 0, self.Slide, h, Scoreboard_Cedille_v2.steamcolorCursorExited )
		end 
	end 

	local Boutonbring= vgui.Create( "DButton", menustaff ) 
	Boutonbring:SetText( "bring" )					
			Boutonbring:SetPos( 25, 540 )					
			Boutonbring:SetSize( 250, 30 )
			Boutonbring:SetTextColor(Scoreboard_Cedille_v2.bringcolortext  )
			Boutonbring.OnCursorEntered = function(self)  self.cursor = true end 
			Boutonbring.OnCursorExited = function(self)  self.cursor = false  end 
 	 		Boutonbring.Slide = 0 					
			Boutonbring.DoClick = function()
				net.Start("envoiepourlaprison")
				net.WriteString("bring")
				net.WriteUInt(v:EntIndex(), 8) 
				net.SendToServer()
			end 

	function Boutonbring:Paint(w,h)
			draw.RoundedBox( 10, 0, 0, w, h,Scoreboard_Cedille_v2.bringcolorbackground )
		if self.cursor then 
				self.Slide = Lerp( 0.05, self.Slide, w )
					draw.RoundedBox(10, 0, 0, self.Slide, h,Scoreboard_Cedille_v2.bringcolorCursorEntered )
			else
				self.Slide = Lerp( 0.05, self.Slide, 0 )
					draw.RoundedBox(10, 0, 0, self.Slide, h,Scoreboard_Cedille_v2.bringcolorCursorExited )
		end 
	end

	local Boutongoto= vgui.Create( "DButton", menustaff ) 
			Boutongoto:SetText( "goto" )					
			Boutongoto:SetPos( 25, 580 )					
			Boutongoto:SetSize( 250, 30 )
			Boutongoto:SetTextColor(Scoreboard_Cedille_v2.gotocolortext)
			Boutongoto.OnCursorEntered = function(self)  self.cursor = true end 
			Boutongoto.OnCursorExited = function(self)  self.cursor = false  end 
 	 		Boutongoto.Slide = 0 					
			Boutongoto.DoClick = function()
				net.Start("envoiepourlaprison")
				net.WriteString("goto")
				net.WriteUInt(v:EntIndex(), 8) -- permet de faire correspondre 
				net.SendToServer()
			end 

	function Boutongoto:Paint(w,h)
			draw.RoundedBox( 10, 0, 0, w, h,Scoreboard_Cedille_v2.gotocolorbackground )
		if self.cursor then 
				self.Slide = Lerp( 0.05, self.Slide, w )
					draw.RoundedBox(10, 0, 0, self.Slide, h, Scoreboard_Cedille_v2.gotocolorCursorEntered )
			else
				self.Slide = Lerp( 0.05, self.Slide, 0 )
					draw.RoundedBox(10, 0, 0, self.Slide, h, Scoreboard_Cedille_v2.gotocolorCursorExited  )
		end 
	end

	local Boutonteleport= vgui.Create( "DButton", menustaff ) 
			Boutonteleport:SetText( "teleport" )					
			Boutonteleport:SetPos( 25, 620 )					
			Boutonteleport:SetSize( 250, 30 )
			Boutonteleport:SetTextColor(Scoreboard_Cedille_v2.teleportcolortext )
			Boutonteleport.OnCursorEntered = function(self)  self.cursor = true end 
			Boutonteleport.OnCursorExited = function(self)  self.cursor = false  end 
 	 		Boutonteleport.Slide = 0 					
			Boutonteleport.DoClick = function()
				net.Start("envoiepourlaprison")
				net.WriteString("teleport")
				net.WriteUInt(v:EntIndex(), 8) -- permet de faire correspondre 
				net.SendToServer()
			end 

	function Boutonteleport:Paint(w,h)
			draw.RoundedBox( 10, 0, 0, w, h,Scoreboard_Cedille_v2.teleportcolorbackground)
		if self.cursor then 
				self.Slide = Lerp( 0.05, self.Slide, w )
					draw.RoundedBox(10, 0, 0, self.Slide, h, Scoreboard_Cedille_v2.teleportcolorCursorEntered )
			else
				self.Slide = Lerp( 0.05, self.Slide, 0 )
					draw.RoundedBox(10, 0, 0, self.Slide, h, Scoreboard_Cedille_v2.teleportcolorCursorExited )
		end 
	end

	local Boutonspec= vgui.Create( "DButton", menustaff ) 
			Boutonspec:SetText( "spectate" )					
			Boutonspec:SetPos( 25, 660 )					
			Boutonspec:SetSize( 250, 30 )
			Boutonspec:SetTextColor(Scoreboard_Cedille_v2.spectatecolortext)
			Boutonspec.OnCursorEntered = function(self)  self.cursor = true end 
			Boutonspec.OnCursorExited = function(self)  self.cursor = false  end 
 	 		Boutonspec.Slide = 0 					
			Boutonspec.DoClick = function()
				net.Start("envoiepourlaprison")
				net.WriteString("spectate")
				net.WriteUInt(v:EntIndex(), 8) -- permet de faire correspondre 
				net.SendToServer()
			end 

	function Boutonspec:Paint(w,h)
			draw.RoundedBox( 10, 0, 0, w, h,Scoreboard_Cedille_v2.spectatecolorbackground )
		if self.cursor then 
				self.Slide = Lerp( 0.05, self.Slide, w )
					draw.RoundedBox(10, 0, 0, self.Slide, h, Scoreboard_Cedille_v2.spectatecolorCursorEntered )
			else
				self.Slide = Lerp( 0.05, self.Slide, 0 )
					draw.RoundedBox(10, 0, 0, self.Slide, h, Scoreboard_Cedille_v2.spectatecolorCursorExited )
		end 
	end

	local Boutonkick= vgui.Create( "DButton", menustaff ) 
			Boutonkick:SetText( "kick" )					
			Boutonkick:SetPos( 25, 700 )					
			Boutonkick:SetSize( 250, 30 )
			Boutonkick:SetTextColor(Scoreboard_Cedille_v2.kickcolortext )
			Boutonkick.OnCursorEntered = function(self)  self.cursor = true end 
			Boutonkick.OnCursorExited = function(self)  self.cursor = false  end 
 	 		Boutonkick.Slide = 0 					
			Boutonkick.DoClick = function()
				net.Start("envoiepourlaprison")
				net.WriteString("kick")
				net.WriteUInt(v:EntIndex(), 8) -- permet de faire correspondre 
				net.SendToServer()
			end 

	function Boutonkick:Paint(w,h)
			draw.RoundedBox( 10, 0, 0, w, h,Scoreboard_Cedille_v2.kickcolorbackground )
		if self.cursor then 
				self.Slide = Lerp( 0.05, self.Slide, w )
					draw.RoundedBox(10, 0, 0, self.Slide, h, Scoreboard_Cedille_v2.kickcolorCursorEntered)
			else
				self.Slide = Lerp( 0.05, self.Slide, 0 )
					draw.RoundedBox(10, 0, 0, self.Slide, h, Scoreboard_Cedille_v2.kickcolorCursorExited  )
		end 
	end

	local Boutonjail= vgui.Create( "DButton", menustaff ) 
			Boutonjail:SetText( "jail" )					
			Boutonjail:SetPos( 25, 740 )					
			Boutonjail:SetSize( 125, 30 )
			Boutonjail:SetTextColor(Scoreboard_Cedille_v2.jailcolortext)
			Boutonjail.OnCursorEntered = function(self)  self.cursor = true end 
			Boutonjail.OnCursorExited = function(self)  self.cursor = false  end 
 	 		Boutonjail.Slide = 0 					
			Boutonjail.DoClick = function()
				net.Start("envoiepourlaprison")
				net.WriteString("jail")
				net.WriteUInt(v:EntIndex(), 8)
				net.SendToServer()
			end 

	function Boutonjail:Paint(w,h)
			draw.RoundedBox( 10, 0, 0, w, h,Scoreboard_Cedille_v2.jailcolorbackground  )
		if self.cursor then 
				self.Slide = Lerp( 0.05, self.Slide, w )
					draw.RoundedBox(10, 0, 0, self.Slide, h, Scoreboard_Cedille_v2.jailcolorCursorEntered)
			else
				self.Slide = Lerp( 0.05, self.Slide, 0 )
					draw.RoundedBox(10, 0, 0, self.Slide, h, Scoreboard_Cedille_v2.jailcolorCursorExited  )
		end 
	end

	local Boutonunjail= vgui.Create( "DButton", menustaff ) 
			Boutonunjail:SetText( "unjail" )					
			Boutonunjail:SetPos( 150, 740 )					
			Boutonunjail:SetSize( 125, 30 )
			Boutonunjail:SetTextColor(Scoreboard_Cedille_v2.unjailcolortext)
			Boutonunjail.OnCursorEntered = function(self)  self.cursor = true end 
			Boutonunjail.OnCursorExited = function(self)  self.cursor = false  end 
 	 		Boutonunjail.Slide = 0 					
			Boutonunjail.DoClick = function()
				net.Start("envoiepourlaprison")
				net.WriteString("unjail")
				net.WriteUInt(v:EntIndex(), 8)
				net.SendToServer()
			end 

	function Boutonunjail:Paint(w,h)
			draw.RoundedBox( 10, 0, 0, w, h,Scoreboard_Cedille_v2.unjailcolorbackground  )
		if self.cursor then 
				self.Slide = Lerp( 0.05, self.Slide, w )
					draw.RoundedBox(10, 0, 0, self.Slide, h, Scoreboard_Cedille_v2.unjailcolorCursorEntered )
			else
				self.Slide = Lerp( 0.05, self.Slide, 0 )
					draw.RoundedBox(10, 0, 0, self.Slide, h, Scoreboard_Cedille_v2.unjailcolorCursorExited )
		end 
	end

	local Boutonfreeze= vgui.Create( "DButton", menustaff ) 
			Boutonfreeze:SetText( "freeze" )					
			Boutonfreeze:SetPos( 25, 780 )					
			Boutonfreeze:SetSize( 125, 30 )
			Boutonfreeze:SetTextColor(Scoreboard_Cedille_v2.freezecolortext)
			Boutonfreeze.OnCursorEntered = function(self)  self.cursor = true end 
			Boutonfreeze.OnCursorExited = function(self)  self.cursor = false  end 
 	 		Boutonfreeze.Slide = 0 					
			Boutonfreeze.DoClick = function()
				net.Start("envoiepourlaprison")
				net.WriteString("freeze")
				net.WriteUInt(v:EntIndex(), 8)
				net.SendToServer()
			end 

	function Boutonfreeze:Paint(w,h)
			draw.RoundedBox( 10, 0, 0, w, h,Scoreboard_Cedille_v2.freezecolorbackground )
		if self.cursor then 
				self.Slide = Lerp( 0.05, self.Slide, w )
					draw.RoundedBox(10, 0, 0, self.Slide, h,Scoreboard_Cedille_v2.freezecolorCursorEntered )
			else
				self.Slide = Lerp( 0.05, self.Slide, 0 )
					draw.RoundedBox(10, 0, 0, self.Slide, h,Scoreboard_Cedille_v2.freezecolorCursorExited )
		end 
	end

	local Boutonunfreeze= vgui.Create( "DButton", menustaff ) 
			Boutonunfreeze:SetText( "unfreeze" )					
			Boutonunfreeze:SetPos( 150, 780 )					
			Boutonunfreeze:SetSize( 125, 30 )
			Boutonunfreeze:SetTextColor(Scoreboard_Cedille_v2.unfreezecolortext)
			Boutonunfreeze.OnCursorEntered = function(self)  self.cursor = true end 
			Boutonunfreeze.OnCursorExited = function(self)  self.cursor = false  end 
 	 		Boutonunfreeze.Slide = 0 					
			Boutonunfreeze.DoClick = function()
				net.Start("envoiepourlaprison")
				net.WriteString("unfreeze")
				net.WriteUInt(v:EntIndex(), 8)
				net.SendToServer()
			end 

	function Boutonunfreeze:Paint(w,h)
			draw.RoundedBox( 10, 0, 0, w, h,Scoreboard_Cedille_v2.unfreezecolorbackground )
		if self.cursor then 
				self.Slide = Lerp( 0.05, self.Slide, w )
					draw.RoundedBox(10, 0, 0, self.Slide, h, Scoreboard_Cedille_v2.unfreezecolorCursorEntered )
			else
				self.Slide = Lerp( 0.05, self.Slide, 0 )
					draw.RoundedBox(10, 0, 0, self.Slide, h, Scoreboard_Cedille_v2.unfreezecolorCursorExited  )
		end 
	end
end 

hook.Add( "ScoreboardHide", "enleverlescoreboard", function()

	if IsValid(PanelPrincipal) then 
		PanelPrincipal:Hide()
		return true
	end 
end)
