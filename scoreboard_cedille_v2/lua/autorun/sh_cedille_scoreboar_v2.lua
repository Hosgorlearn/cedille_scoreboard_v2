--[[

-Si vous n'avez pas un minimum de connaissances, je vous déconseille de toucher aux autres fichiers. 
Vous avez normalement tout a disposition dans ce fichier config ! 
-Si vous avez envie de dire que c'est vous qui avait réalisé ce scoreboard, libre à vous de le faire, 
pour ma part j'aurai toujours la conscience tranquille !
- Si vous rencontrez des problèmes ou vous voudriez voir avec moi pour ajouter des choses,
voici mon discord : Hosgor#8892 


]]--

Scoreboard_Cedille_v2 = {}

--[[-------------------------------------------------------------------------
Ajouter ci-dessous les grades qui doivent avoir accès au panel staff
---------------------------------------------------------------------------]]--
Scoreboard_Cedille_v2.staff = {

["superadmin"] = true,

}


--[[-------------------------------------------------------------------------
	Définir les groupes qui seront invisibles sur le Tab
---------------------------------------------------------------------------]]--

-- Lorsque le groupe = true il est alors caché sur le Tab / false on le voit --

Scoreboard_Cedille_v2.staffInvisible = {

["superadmin"] = true,
["admin"] = true,

}

--[[-------------------------------------------------------------------------
	Définir les groupes qui peuvent voir les joueurs connectés
---------------------------------------------------------------------------]]--

-- Lorsque le groupe = true alors il voit le nombre de joueurs / false il ne voit rien--

Scoreboard_Cedille_v2.staffjoueurco = {

["superadmin"] = true,

}

--[[-------------------------------------------------------------------------
Pour mettre ton image  
---------------------------------------------------------------------------]]--

-- Si vous n'arrivez pas à le configurer (https://docs.google.com/document/d/1X4yECK-YIoIuluEaX7OweFJP7p-Y8-yVLhQNwe1gFhM/edit?usp=sharing)--
Scoreboard_Cedille_v2.ressourceimg = "materials/mettresonimage.png" 

	
--[[-------------------------------------------------------------------------
Menu tout en haut avec le nom du serveur, l'ip ...
---------------------------------------------------------------------------]]--


-- Permet de définir le nom qui apparaîtra en Haut à gauche du scoreboard --
Scoreboard_Cedille_v2.nomserveur = "Le nom du serveur"
-- Permet de mettre son Ip au milieu du scoreboard --
Scoreboard_Cedille_v2.ipserveur = "Ip: 192.168.0.28:27015"
-- Permet de changer la phrase qui apparaîtra après le nbr de joueurs --
Scoreboard_Cedille_v2.nbrdejoueurs =  " joueurs connectés"
-- Permet de définir la couleur du menu en Haut 
Scoreboard_Cedille_v2.couleurdumenuH = Color( 255, 115, 0, 255 )


--[[-------------------------------------------------------------------------
Menu qui affiche les joueurs 
---------------------------------------------------------------------------]]--

-- Permet de définir la couleur d'arrière plan ou s'affichent les noms --
Scoreboard_Cedille_v2.couleurprincipal = Color(50,50,50,255)
-- Permet de changer la couleur des petites lignes en dessous des noms --
Scoreboard_Cedille_v2.couleurligne = Color(255,0,0,255)
-- Permet de changer la couleur des Noms -- 
Scoreboard_Cedille_v2.couleurAffNom = Color(255,255,255,255)


--[[-------------------------------------------------------------------------
                         Menu pour le Staff
---------------------------------------------------------------------------]]--

-- Permet de changer la couleur du texte pour les Noms -- 
Scoreboard_Cedille_v2.couleurNomjoueur = Color(255,34,0) 
-- Permet de changer la couleur du texte pour le nombre de kills --  
Scoreboard_Cedille_v2.couleurnbrkill = Color(255,255,255)
-- Permet de changer la couleur du texte pour le nombre de morts -- 
Scoreboard_Cedille_v2.couleurnbrMorts = Color(255,255,255)
-- Permet de changer la couleur du texte pour l'argent -- 
Scoreboard_Cedille_v2.couleurArgent = Color(255,255,255)
-- Permet de changer la couleur du texte pour le métier -- 
Scoreboard_Cedille_v2.couleurMetier = Color(255,255,255)

--[[-------------------------------------------------------------------------
							Bouton page steam
---------------------------------------------------------------------------]]--

-- permet de définir la couleur du texte sur le bouton --
Scoreboard_Cedille_v2.steamcolortext = Color(255,255,255)
-- permet de définir la couleur du bouton --
Scoreboard_Cedille_v2.steamcolorbackground = Color(0,0,0,150)
-- permet de définir la couleur lorsque le curseur de la souris va passe dessus -- 
Scoreboard_Cedille_v2.steamcolorCursorEntered = Color(255,34,0)
-- permet de définir la couleur lorsque le curseur de la souris va sortir du bouton --
Scoreboard_Cedille_v2.steamcolorCursorExited = Color(255,34,0)

--[[-------------------------------------------------------------------------
							Bouton bring
---------------------------------------------------------------------------]]--

-- permet de définir la couleur du texte sur le bouton --
Scoreboard_Cedille_v2.bringcolortext = Color(255,255,255)
-- permet de définir la couleur du bouton --
Scoreboard_Cedille_v2.bringcolorbackground = Color(0,0,0,150)
-- permet de définir la couleur lorsque le curseur de la souris va passe dessus -- 
Scoreboard_Cedille_v2.bringcolorCursorEntered = Color(255,34,0)
-- permet de définir la couleur lorsque le curseur de la souris va sortir du bouton --
Scoreboard_Cedille_v2.bringcolorCursorExited = Color(255,34,0)

--[[-------------------------------------------------------------------------
							Bouton goto
---------------------------------------------------------------------------]]--

-- permet de définir la couleur du texte sur le bouton --
Scoreboard_Cedille_v2.gotocolortext = Color(255,255,255)
-- permet de définir la couleur du bouton --
Scoreboard_Cedille_v2.gotocolorbackground = Color(0,0,0,150)
-- permet de définir la couleur lorsque le curseur de la souris va passe dessus -- 
Scoreboard_Cedille_v2.gotocolorCursorEntered = Color(255,34,0)
-- permet de définir la couleur lorsque le curseur de la souris va sortir du bouton --
Scoreboard_Cedille_v2.gotocolorCursorExited = Color(255,34,0)

--[[-------------------------------------------------------------------------
							Bouton teleport
---------------------------------------------------------------------------]]--

-- permet de définir la couleur du texte sur le bouton --
Scoreboard_Cedille_v2.teleportcolortext = Color(255,255,255)
-- permet de définir la couleur du bouton --
Scoreboard_Cedille_v2.teleportcolorbackground = Color(0,0,0,150)
-- permet de définir la couleur lorsque le curseur de la souris va passe dessus -- 
Scoreboard_Cedille_v2.teleportcolorCursorEntered = Color(255,34,0)
-- permet de définir la couleur lorsque le curseur de la souris va sortir du bouton --
Scoreboard_Cedille_v2.teleportcolorCursorExited = Color(255,34,0)

--[[-------------------------------------------------------------------------
							Bouton spectate 
---------------------------------------------------------------------------]]--

-- permet de définir la couleur du texte sur le bouton --
Scoreboard_Cedille_v2.spectatecolortext = Color(255,255,255)
-- permet de définir la couleur du bouton --
Scoreboard_Cedille_v2.spectatecolorbackground = Color(0,0,0,150)
-- permet de définir la couleur lorsque le curseur de la souris va passe dessus -- 
Scoreboard_Cedille_v2.spectatecolorCursorEntered = Color(255,34,0)
-- permet de définir la couleur lorsque le curseur de la souris va sortir du bouton --
Scoreboard_Cedille_v2.spectatecolorCursorExited = Color(255,34,0)

--[[-------------------------------------------------------------------------
							Bouton kick
---------------------------------------------------------------------------]]--

-- permet de définir la couleur du texte sur le bouton --
Scoreboard_Cedille_v2.kickcolortext = Color(255,255,255)
-- permet de définir la couleur du bouton --
Scoreboard_Cedille_v2.kickcolorbackground = Color(0,0,0,150)
-- permet de définir la couleur lorsque le curseur de la souris va passe dessus -- 
Scoreboard_Cedille_v2.kickcolorCursorEntered = Color(255,34,0)
-- permet de définir la couleur lorsque le curseur de la souris va sortir du bouton --
Scoreboard_Cedille_v2.kickcolorCursorExited = Color(255,34,0)

--[[-------------------------------------------------------------------------
							Bouton jail
---------------------------------------------------------------------------]]--

-- permet de définir la couleur du texte sur le bouton --
Scoreboard_Cedille_v2.jailcolortext = Color(255,255,255)
-- permet de définir la couleur du bouton --
Scoreboard_Cedille_v2.jailcolorbackground = Color(0,0,0,150)
-- permet de définir la couleur lorsque le curseur de la souris va passe dessus -- 
Scoreboard_Cedille_v2.jailcolorCursorEntered = Color(255,34,0)
-- permet de définir la couleur lorsque le curseur de la souris va sortir du bouton --
Scoreboard_Cedille_v2.jailcolorCursorExited = Color(255,34,0)

--[[-------------------------------------------------------------------------
							Bouton unjail
---------------------------------------------------------------------------]]--

-- permet de définir la couleur du texte sur le bouton --
Scoreboard_Cedille_v2.unjailcolortext = Color(255,255,255)
-- permet de définir la couleur du bouton --
Scoreboard_Cedille_v2.unjailcolorbackground = Color(0,0,0,150)
-- permet de définir la couleur lorsque le curseur de la souris va passe dessus -- 
Scoreboard_Cedille_v2.unjailcolorCursorEntered = Color(255,34,0)
-- permet de définir la couleur lorsque le curseur de la souris va sortir du bouton --
Scoreboard_Cedille_v2.unjailcolorCursorExited = Color(255,34,0)

--[[-------------------------------------------------------------------------
							Bouton freeze
---------------------------------------------------------------------------]]--

-- permet de définir la couleur du texte sur le bouton --
Scoreboard_Cedille_v2.freezecolortext = Color(255,255,255)
-- permet de définir la couleur du bouton --
Scoreboard_Cedille_v2.freezecolorbackground = Color(0,0,0,150)
-- permet de définir la couleur lorsque le curseur de la souris va passe dessus -- 
Scoreboard_Cedille_v2.freezecolorCursorEntered = Color(255,34,0)
-- permet de définir la couleur lorsque le curseur de la souris va sortir du bouton --
Scoreboard_Cedille_v2.freezecolorCursorExited = Color(255,34,0)


--[[-------------------------------------------------------------------------
							Bouton unfreeze
---------------------------------------------------------------------------]]--

-- permet de définir la couleur du texte sur le bouton --
Scoreboard_Cedille_v2.unfreezecolortext = Color(255,255,255)
-- permet de définir la couleur du bouton --
Scoreboard_Cedille_v2.unfreezecolorbackground = Color(0,0,0,150)
-- permet de définir la couleur lorsque le curseur de la souris va passe dessus -- 
Scoreboard_Cedille_v2.unfreezecolorCursorEntered = Color(255,34,0)
-- permet de définir la couleur lorsque le curseur de la souris va sortir du bouton --
Scoreboard_Cedille_v2.unfreezecolorCursorExited = Color(255,34,0)



