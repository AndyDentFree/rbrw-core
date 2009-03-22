#tag Window
Begin Window ShowImages
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   663
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   ""
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Untitled"
   Visible         =   True
   Width           =   486
   Begin Canvas ImageDisplay
      AcceptFocus     =   ""
      AcceptTabs      =   ""
      AutoDeactivate  =   True
      Backdrop        =   ""
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   643
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      UseFocusRing    =   True
      Visible         =   True
      Width           =   466
   End
End
#tag EndWindow

#tag WindowCode
	#tag MenuHandler
		Function FileClose() As Boolean Handles FileClose.Action
			Close
			Return True
			
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h0
		Sub Constructor(p as Picture, newTitle as string = "")
		  ImageToDisplay = p
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  if newTitle.LenB > 0 then
		    self.Title = newTitle
		  end if
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private ImageToDisplay As Picture
	#tag EndProperty


#tag EndWindowCode

#tag Events ImageDisplay
	#tag Event
		Sub Paint(g As Graphics)
		  if ImageToDisplay is nil then return
		  g.DrawPicture ImageToDisplay,0,0, g.Width, g.Height, 0, 0, ImageToDisplay.Width, ImageToDisplay.Height
		End Sub
	#tag EndEvent
#tag EndEvents
