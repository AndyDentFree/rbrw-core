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
   Begin Label StaticText1
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   67
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
      TabStop         =   True
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
   Begin Label StaticText2
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   20
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Multiline       =   ""
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Help is available online at the "
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      Top             =   93
      Underline       =   ""
      Visible         =   True
      Width           =   193
   End
   Begin Label LaunchWikiHelpText
      AutoDeactivate  =   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   209
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Multiline       =   True
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "rbrw-core wiki"
      TextAlign       =   0
      TextColor       =   &h000099
      TextFont        =   "System"
      TextSize        =   0
      Top             =   94
      Underline       =   True
      Visible         =   True
      Width           =   116
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

#tag Events LaunchWikiHelpText
	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  App.LaunchWikiHelp
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  return true
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  App.MouseCursor = System.Cursors.FingerPointer
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  App.MouseCursor = System.Cursors.StandardPointer
		End Sub
	#tag EndEvent
#tag EndEvents
