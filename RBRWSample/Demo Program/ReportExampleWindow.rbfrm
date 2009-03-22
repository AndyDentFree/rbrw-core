#tag Window
Begin Window ReportExampleWindow
   BackColor       =   16777215
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   335
   ImplicitInstance=   False
   LiveResize      =   False
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   -1077817908
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   False
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   False
   Title           =   "Sample Reports"
   Visible         =   True
   Width           =   733
   Begin StaticText StaticText1
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   237
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Multiline       =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      Text            =   "Choose different reports from the Preview or Print  menus.\r\rAll these reports are created by methods in the App class, such as:\rReportDemoApp.ReportSimpleFixedHeader"
      TextAlign       =   0
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   12
      Top             =   14
      Underline       =   False
      Visible         =   True
      Width           =   694
   End
End
#tag EndWindow

#tag WindowCode
	#tag MenuHandler
		Function FileClose() As Boolean Handles FileClose.Action
			Quit
			Return True
			
		End Function
	#tag EndMenuHandler


	#tag Note, Name = About
		advice - see ReportDemoApp for the menu handlers and methods doing the reports.
		
		Originally they were all in here but it was annoying having to switch back to this window to run them from menus.
	#tag EndNote


#tag EndWindowCode

