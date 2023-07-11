

local function GetFont()
	return MySelf and MySelf:IsValid() and ( MySelf:Team() == TEAM_ZOMBIE and "ZSHUDFontSmallest" or "ZSHUDFontSmallest" ) or "ZSHUDFontSmallest"
end

local PANEL  = {}
function PANEL:Init()
	self.Align = self:GetParent():GetAlign()
	self:DockPadding( 8, 2, 8, 2 )
	self:DockMargin( 0, 2, 0, 0 )

	self:SetKeyboardInputEnabled( false )
	self:SetMouseInputEnabled( false )
end

local matGrad = Material( "VGUI/gradient-r" )
local surface_SetMaterial = surface.SetMaterial
local surface_SetDrawColor = surface.SetDrawColor
local surface_DrawTexturedRect = surface.DrawTexturedRect
local surface_DrawTexturedRectRotated = surface.DrawTexturedRectRotated

function PANEL:Paint( w, h )
	surface_SetMaterial( matGrad )
	surface_SetDrawColor( 0, 0, 0, 155 )

	local a, b, c, d = self:GetDockPadding()
	local align = self.Align
	if align == RIGHT then
		surface.DrawTexturedRect(self:GetWide() * 0.25, 0, self:GetWide(), self:GetTall())
	elseif align == CENTER then
		surface.DrawTexturedRect(self:GetWide() * 0.25, 0, self:GetWide() * 0.25, self:GetTall())
		surface.DrawTexturedRectRotated(self:GetWide() * 0.625, self:GetTall() / 1.9, self:GetWide() * 0.25, self:GetTall(), 180)
	else
		surface.DrawTexturedRectRotated(self:GetWide() * 0.25, self:GetTall() / 2, self:GetWide() / 2, self:GetTall(), 180)
	end
end

function PANEL:AddLabel( text, col, font, extramargin )
	self.Label = vgui.Create( "DLabel", self )
	self.Label:SetText( text )
	self.Label:SetFont( font or GetFont() )
	self.Label:SetTextColor( col or color_white )
	self.Label:SizeToContents()
	if extramargin then
		self.Label:SetContentAlignment( 7 )
		self.Label:DockMargin( 0, self.Label:GetTall() * 0.2, 0, 0 )
	else
		self.Label:SetContentAlignment( 4 )
	end
	self.Label:Dock( LEFT )
end

function PANEL:AddImage( mat, col )
	self.Image = vgui.Create( "DImage", self )
	self.Image:SetImage( mat )
	if col then
		self.Image:SetImageColor( col )
	end
	self.Image:SizeToContents()
	local height = self.Image:GetTall()
	if height > self:GetTall() then
		self.Image:SetSize( self:GetTall() / height * self.Image:GetWide(), self:GetTall() )
	end
	self.Image:DockMargin( 0, ( self:GetTall() - self.Image:GetTall()) / 2, 0, 0 )
	self.Image:Dock( LEFT )
end

function PANEL:AddAmmo( amount, ammotype )
	local ammotype2 = translate.Get(string.lower(string.Implode("",string.Explode(" ","ammo_"..ammotype)) or ammotype))
	if self.AmmoNotif and self.AmmoNotif.ammotype == ammotype then
		self:AddLabel( translate.Format( "obtained_x_y_ammo",amount + self.AmmoNotif.amount, ammotype2), COLOR_GREEN, "ZSHUDFontSmallest" )
		self.AmmoNotif = { amount = amount + self.AmmoNotif.amount, ammotype = ammotype }
	else
		self:AddLabel( translate.Format( "obtained_x_y_ammo",amount, ammotype2), COLOR_GREEN, "ZSHUDFontSmallest" )
	end
end
function PANEL:AddHeal(pl_h, amount, other)
	if self.HealNotif and self.HealNotif.pl_h == pl_h then
		self:AddLabel((other and translate.Format("healed_x_for_y",pl_h:IsValid() and  pl_h:Name(), amount + self.HealNotif.amount) or translate.Format( "healed_x_by_y", pl_h:IsValid() and  pl_h:Nick(),amount + self.HealNotif.amount)), COLOR_GREEN, "ZSHUDFontSmallest" )
		self.HealNotif = { pl_h = pl_h,amount = amount + self.HealNotif.amount, other = other }
	else
		self:AddLabel((other and translate.Format("healed_x_for_y",(pl_h:IsValid() and pl_h:Name() or "I"), amount) or translate.Format( "healed_x_by_y",(pl_h:IsValid() and pl_h:Nick()  or "I"), amount)), COLOR_GREEN, "ZSHUDFontSmallest" )
	end
end
function PANEL:UpdateBlock( amount )
	if self.BNotif then
		self:AddLabel( translate.Format( "damageblock_x", amount + self.BNotif.amount), COLOR_GREEN, "ZSHUDFontSmallest" )
		self.BNotif = { block = true,amount = amount + self.BNotif.amount}
	else
		self:AddLabel( translate.Get( "damageblock"), COLOR_GREEN, "ZSHUDFontSmallest" )
	end
end
function PANEL:UpdateBuff(pl,weapon, me)
	if self.BuffNotif then
		self:AddLabel( me and translate.Format( "buffed_x_with_y", pl:Nick(), weapon) or translate.Format( "buffed_x_with_a_y", pl:Nick(), weapon), COLOR_GREEN, "ZSHUDFontSmallest" )
		self.BuffNotif = {pl = pl,weapon = weapon, me = me}
	else
		self:AddLabel( me and translate.Format( "buffed_x_with_y", pl:Nick(), weapon) or translate.Format( "buffed_x_with_a_y", pl:Nick(), weapon), COLOR_GREEN, "ZSHUDFontSmallest" )
	end
end

function PANEL:AddKillIcon( class )
	local icondata = killicon.GetIcon( class )

	if icondata then
		self:AddImage(icondata[1], icondata[2])
	else
		local fontdata = killicon.GetFont( class ) or killicon.GetFont( "default" )
		if fontdata then
			self:AddLabel(fontdata[2], fontdata[3], fontdata[1], true )
		end
	end
end

function PANEL:ResetNotification( fade )
	self.Resets = ( self.Resets or 0 ) + 1
	for i, child in pairs( self:GetChildren() ) do
		if child and child:IsValid() then
			child:Remove()
			child = nil
		end
	end

	local FadeTime = fade
	self.DieTime = CurTime() + FadeTime

	self:Stop()
	self:SetAlpha( 190 )
	self:AlphaTo( 255, 0.15 )
	self:AlphaTo( 200, 1, FadeTime - 1 )
	--self:MoveBy(self:GetX() + 10, self:GetY(), 2, FadeTime - 0.6, 0.5)
end

function PANEL:SetNotification( ... )
	local args = { ... }
	local screenscale = BetterScreenScale()

	local defaultcol = color_white
	local defaultfont
	for k, v in ipairs( args ) do
		local vtype = type( v )

		if vtype == "table" then
			if v.r and v.g and v.b then
				defaultcol = v
			elseif v.font then
				if v.font == "" then
					defaultfont = nil
				else
					local th = draw.GetFontHeight( v.font )
					if th then
						defaultfont = v.font
					end
				end
			elseif v.killicon then
				self:AddKillIcon( v.killicon )
				if v.headshot then
					self:AddKillIcon( "headshot" )
				end
			elseif v.image then
				self:AddImage( v.image, v.color )
			elseif v.ammotype then
				self:AddAmmo( v.amount, v.ammotype )
				if !self.AmmoNotif then
					self.AmmoNotif = {amount = v.amount, ammotype = v.ammotype}
				end

			elseif v.pl_h then
				self:AddHeal( v.pl_h, v.amount, v.other )
				if !self.HealNotif then
					self.HealNotif = {pl_h = v.pl_h,amount = v.amount, other = v.other}
				end


			elseif v.block then
				self:UpdateBlock(1)
				if !self.BNotif then
					self.BNotif = {block = true,amount = 1}
				end
			elseif v.weapon then
				self:UpdateBuff(v.pl,v.weapon, v.me)
				if !self.BuffNotif then
					self.BuffNotif = {v.pl,v.weapon, v.me}
				end
			end
		elseif vtype == "Player" then
			local avatar = vgui.Create( "AvatarImage", self )
			local size = self:GetTall() >= 32 and 32 or 16
			avatar:SetSize( size, size )
			if v:IsValid() then
				avatar:SetPlayer( v, size )
			end
			avatar:SetAlpha( 220 )
			avatar:Dock( LEFT )
			avatar:DockMargin( 2 * screenscale, 2 * screenscale, 2 * screenscale, 2 * screenscale )
			if  v:IsValid() and v:IsPlayer() and v:IsBot() then
				avatar:Remove()
			end

			if v:IsValid() then
				local color = team.GetColor( v:Team() )
				if v:GetZombieClassTable().DemiBoss then 
					color = Color(255,233,31)
				elseif v:GetZombieClassTable().Boss then 
					color = Color(216,0,0) 
				end

				self:AddLabel( " " .. v:Name(), color, GetFont() )
			else
				self:AddLabel( " ?", team.GetColor( TEAM_UNASSIGNED ), GetFont() )
			end
		elseif vtype == "Entity" then
			self:AddLabel( "[" .. ( v:IsValid() and v:GetClass() or "?" ) .. "]", COLOR_RED, GetFont() )
		else
			local text = tostring( v )

			self:AddLabel( text, defaultcol, defaultfont )
		end
	end
end

vgui.Register( "DEXNotification", PANEL, "Panel" )

local PANEL  = {}
PANEL.NotifyFadeTime = 4
PANEL.Notifications = {}

AccessorFunc( PANEL, "m_Align", "Align", FORCE_NUMBER )
AccessorFunc( PANEL, "m_MessageHeight", "MessageHeight", FORCE_NUMBER )

function PANEL:Init()
	self:SetAlign( LEFT )
	self:SetMessageHeight( 32 )
	self:ParentToHUD()
	self:InvalidateLayout()
end

function PANEL:PerformLayout()
end

function PANEL:Paint()
end

function PANEL:AddNotification( ... )
	local args = { ... }

	local nocreate, notifi = false

	for i, notif in pairs( self:GetChildren() ) do
		--[[if notif and notif:IsValid() and not notif.AmmoNotif and notif.Args then
			local next, tablecyl = nil, false
			for i, arg in pairs( args ) do
				if istable( arg ) and istable( notif.Args[ i ] ) then
					for ii, iarg in pairs( arg ) do
						if iarg == notif.Args[ i ][ ii ] then
							next = true
						else
							next = false
						end
					end
				end	
			end

			tablecyl = next

			for i, arg in pairs( args ) do
				if not istable( arg ) and not istable( notif.Args[ i ] ) and arg == notif.Args[ i ] then
					next = true
				elseif not istable( arg ) and not istable( notif.Args[ i ] ) then
					next = false
				elseif not tablecyl then
					next = false
				end
			end

			if next then
				nocreate = true
				notifi = notif
			end
		end--]]

		if notif and notif.AmmoNotif and args[ 4 ] and istable( args[ 4 ] ) then
			if notif.AmmoNotif.ammotype and args[ 4 ].ammotype and notif.AmmoNotif.ammotype == args[ 4 ].ammotype then
				nocreate = true
				notifi = notif
			end
		end
		if notif and notif.HealNotif and args[ 4 ] and istable( args[ 4 ] ) then
			if notif.HealNotif.pl_h and args[ 4 ].pl_h and notif.HealNotif.pl_h == args[ 4 ].pl_h then
				nocreate = true
				notifi = notif
			end
		end
		if notif and notif.BNotif and notif.BNotif.block and args[ 1 ] and istable( args[ 1  ] )then
			if notif.BNotif.block and args[ 1 ].block then
				nocreate = true
				notifi = notif
			end
		end
		if notif and notif.BuffNotif and notif.BuffNotif.pl and args[ 4 ] and istable( args[ 4  ] )then
			if notif.BuffNotif.pl and args[ 4 ].pl and notif.BuffNotif.pl == args[ 4 ].pl  then
				nocreate = true
				notifi = notif
			end
		end

		if notif.Args and notif.Args[ 1 ].AlwaysRefresh and args[ 1 ] and args[ 1 ].AlwaysRefresh then
			nocreate = true
			notifi = notif
		end
	end

	if not nocreate then
		notifi = vgui.Create( "DEXNotification", self )
		notifi.Args = {}
		for k, v in pairs( args ) do
			table.insert( notifi.Args, v )
		end
	else
		notifi:ResetNotification( self.NotifyFadeTime )
	end

	notifi:SetTall( BetterScreenScale() * self:GetMessageHeight() )
	notifi:SetNotification(...)
	local w = 0
	for _, p in pairs( notifi:GetChildren() ) do
		if nocreate then
			w = w + p:GetWide() / 2
		else
			w = w + p:GetWide()
		end
	end

	notifi.Wide = w + 40

	if self:GetAlign() == RIGHT then
		notifi:DockPadding( self:GetWide() - w - ( 32 * BetterScreenScale() ), 0, 8, 0 )
	elseif self:GetAlign() == CENTER then
		notifi:DockPadding( ( self:GetWide() - w ) / 2, 0, 0, 0 )
	else
		notifi:DockPadding( 8, 0, 8, 0 )
	end

	notifi:Dock( TOP )

	local args = { ... }

	local FadeTime = self.NotifyFadeTime

	for k, v in pairs( args ) do
		if type( v ) == "table" and v.CustomTime and type( v.CustomTime == "number" ) then
			FadeTime = v.CustomTime
			break
		end
	end

	notifi:SetAlpha( 1 )
	notifi:AlphaTo( 255, 0.15 )
	notifi:AlphaTo( 1, 1, FadeTime - 1 )
	notifi:MoveBy(notifi:GetX() - 650, notifi:GetY(), 2.2, FadeTime - 0.45, 0.5)

	notifi.DieTime = CurTime() + FadeTime


	self.Notifications[ #self.Notifications + 1 ] = notifi

	return notifi
end

function PANEL:Think()
	local time = CurTime()

	for i, pan in pairs( self.Notifications ) do
		if pan.DieTime then
			--[[if time >= pan.DieTime - 2 and !pan.NoMove then
				pan.NoMove = true
				pan:MoveBy(2000, pan:GetY(), 2, 0, 0.2)
			end]]
			if time >= pan.DieTime  then
				pan:Remove()
				local dummy = vgui.Create( "Panel", self )
				dummy:SetTall( 0 )
				dummy:Dock( TOP )
				dummy:Remove()
			end
		end
	end
end

vgui.Register( "DEXNotificationsList", PANEL, "Panel" )
