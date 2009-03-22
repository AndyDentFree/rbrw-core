#tag Window
Begin Window RBUnitTestRunner
   BackColor       =   16777215
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   508
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   -1133205937
   MenuBarVisible  =   True
   MinHeight       =   300
   MinimizeButton  =   True
   MinWidth        =   400
   Placement       =   0
   Resizeable      =   True
   Title           =   "RBUnit TestRunner"
   Visible         =   True
   Width           =   648
   Begin PushButton pbRunTests
      AutoDeactivate  =   True
      BehaviorIndex   =   0
      Bold            =   False
      Cancel          =   False
      Caption         =   "&Run Tests"
      Default         =   True
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      Top             =   462
      Underline       =   False
      Visible         =   True
      Width           =   85
      BehaviorIndex   =   0
   End
   Begin TabPanel TabPanel1
      AutoDeactivate  =   True
      BehaviorIndex   =   1
      Bold            =   False
      Enabled         =   True
      Height          =   432
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Panels          =   ""
      Scope           =   0
      SmallTabs       =   False
      TabDefinition   =   "Test Hierarchy\rTest Results XML\rStatistics"
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      Top             =   14
      Underline       =   False
      Value           =   1
      Visible         =   True
      Width           =   603
      BehaviorIndex   =   1
      Begin EditField efTestResults
         AcceptTabs      =   False
         Alignment       =   0
         AutoDeactivate  =   True
         BackColor       =   16777215
         BehaviorIndex   =   2
         Bold            =   False
         Border          =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   357
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   False
         Left            =   48
         LimitText       =   0
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Mask            =   ""
         Multiline       =   True
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         ScrollbarHorizontal=   False
         ScrollbarVertical=   True
         Styled          =   False
         TabIndex        =   0
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   ""
         TextColor       =   0
         TextFont        =   "System"
         TextSize        =   0
         Top             =   50
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   552
         BehaviorIndex   =   2
      End
      Begin ListBox TestResultTree
         AutoDeactivate  =   True
         AutoHideScrollbars=   True
         BehaviorIndex   =   3
         Bold            =   False
         Border          =   True
         ColumnCount     =   1
         ColumnsResizable=   False
         ColumnWidths    =   ""
         DataField       =   ""
         DataSource      =   ""
         DefaultRowHeight=   -1
         Enabled         =   True
         EnableDrag      =   False
         EnableDragReorder=   False
         GridLinesHorizontal=   0
         GridLinesVertical=   0
         HasHeading      =   False
         HeadingIndex    =   -1
         Height          =   378
         HelpTag         =   ""
         Hierarchical    =   True
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         InitialValue    =   ""
         Italic          =   False
         Left            =   48
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         RequiresSelection=   ""
         Scope           =   0
         ScrollbarHorizontal=   False
         ScrollBarVertical=   True
         SelectionType   =   0
         TabIndex        =   1
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         Top             =   50
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   552
         _ScrollOffset   =   0
         _ScrollWidth    =   -1
         BehaviorIndex   =   3
      End
      Begin ListBox lbDurationList
         AutoDeactivate  =   True
         AutoHideScrollbars=   True
         BehaviorIndex   =   4
         Bold            =   False
         Border          =   True
         ColumnCount     =   4
         ColumnsResizable=   True
         ColumnWidths    =   "35%,35%,15%,15%"
         DataField       =   ""
         DataSource      =   ""
         DefaultRowHeight=   -1
         Enabled         =   True
         EnableDrag      =   False
         EnableDragReorder=   False
         GridLinesHorizontal=   0
         GridLinesVertical=   0
         HasHeading      =   True
         HeadingIndex    =   -1
         Height          =   218
         HelpTag         =   ""
         Hierarchical    =   False
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         InitialValue    =   "Test Fixture Name	Test Name	Duration	% of Total"
         Italic          =   False
         Left            =   48
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         RequiresSelection=   ""
         Scope           =   0
         ScrollbarHorizontal=   False
         ScrollBarVertical=   True
         SelectionType   =   0
         TabIndex        =   2
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         Top             =   210
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   547
         _ScrollOffset   =   0
         _ScrollWidth    =   -1
         BehaviorIndex   =   4
      End
      Begin GroupBox GroupBox1
         AutoDeactivate  =   True
         BehaviorIndex   =   5
         Bold            =   False
         Caption         =   "Overview"
         Enabled         =   True
         Height          =   152
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   False
         Left            =   48
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   3
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         Top             =   46
         Underline       =   False
         Visible         =   True
         Width           =   547
         BehaviorIndex   =   5
         Begin StaticText StaticText1
            AutoDeactivate  =   True
            BehaviorIndex   =   6
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   20
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "GroupBox1"
            Italic          =   False
            Left            =   64
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Multiline       =   False
            Scope           =   0
            TabIndex        =   0
            TabPanelIndex   =   3
            TabStop         =   True
            Text            =   "Passed:"
            TextAlign       =   0
            TextColor       =   0
            TextFont        =   "System"
            TextSize        =   0
            Top             =   100
            Underline       =   False
            Visible         =   True
            Width           =   100
            BehaviorIndex   =   6
         End
         Begin StaticText StaticText2
            AutoDeactivate  =   True
            BehaviorIndex   =   7
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   20
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "GroupBox1"
            Italic          =   False
            Left            =   64
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Multiline       =   False
            Scope           =   0
            TabIndex        =   1
            TabPanelIndex   =   3
            TabStop         =   True
            Text            =   "Failed:"
            TextAlign       =   0
            TextColor       =   0
            TextFont        =   "System"
            TextSize        =   0
            Top             =   132
            Underline       =   False
            Visible         =   True
            Width           =   100
            BehaviorIndex   =   7
         End
         Begin StaticText StaticText3
            AutoDeactivate  =   True
            BehaviorIndex   =   8
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   20
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "GroupBox1"
            Italic          =   False
            Left            =   64
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Multiline       =   False
            Scope           =   0
            TabIndex        =   2
            TabPanelIndex   =   3
            TabStop         =   True
            Text            =   "Skipped:"
            TextAlign       =   0
            TextColor       =   0
            TextFont        =   "System"
            TextSize        =   0
            Top             =   164
            Underline       =   False
            Visible         =   True
            Width           =   100
            BehaviorIndex   =   8
         End
         Begin StaticText stPassedTests
            AutoDeactivate  =   True
            BehaviorIndex   =   9
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   20
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "GroupBox1"
            Italic          =   False
            Left            =   123
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Multiline       =   False
            Scope           =   0
            TabIndex        =   3
            TabPanelIndex   =   3
            TabStop         =   True
            Text            =   0
            TextAlign       =   0
            TextColor       =   0
            TextFont        =   "System"
            TextSize        =   0
            Top             =   100
            Underline       =   False
            Visible         =   True
            Width           =   100
            BehaviorIndex   =   9
         End
         Begin StaticText stFailedTests
            AutoDeactivate  =   True
            BehaviorIndex   =   10
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   20
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "GroupBox1"
            Italic          =   False
            Left            =   123
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Multiline       =   False
            Scope           =   0
            TabIndex        =   4
            TabPanelIndex   =   3
            TabStop         =   True
            Text            =   0
            TextAlign       =   0
            TextColor       =   0
            TextFont        =   "System"
            TextSize        =   0
            Top             =   132
            Underline       =   False
            Visible         =   True
            Width           =   100
            BehaviorIndex   =   10
         End
         Begin StaticText stSkippedTests
            AutoDeactivate  =   True
            BehaviorIndex   =   11
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   20
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "GroupBox1"
            Italic          =   False
            Left            =   123
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Multiline       =   False
            Scope           =   0
            TabIndex        =   5
            TabPanelIndex   =   3
            TabStop         =   True
            Text            =   0
            TextAlign       =   0
            TextColor       =   0
            TextFont        =   "System"
            TextSize        =   0
            Top             =   164
            Underline       =   False
            Visible         =   True
            Width           =   100
            BehaviorIndex   =   11
         End
         Begin StaticText StaticText7
            AutoDeactivate  =   True
            BehaviorIndex   =   12
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   20
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "GroupBox1"
            Italic          =   False
            Left            =   271
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   False
            Multiline       =   False
            Scope           =   0
            TabIndex        =   6
            TabPanelIndex   =   3
            TabStop         =   True
            Text            =   "Duration:"
            TextAlign       =   0
            TextColor       =   0
            TextFont        =   "System"
            TextSize        =   0
            Top             =   68
            Underline       =   False
            Visible         =   True
            Width           =   100
            BehaviorIndex   =   12
         End
         Begin StaticText StaticText8
            AutoDeactivate  =   True
            BehaviorIndex   =   13
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   20
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "GroupBox1"
            Italic          =   False
            Left            =   271
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   False
            Multiline       =   False
            Scope           =   0
            TabIndex        =   7
            TabPanelIndex   =   3
            TabStop         =   True
            Text            =   "Completion Time:"
            TextAlign       =   0
            TextColor       =   0
            TextFont        =   "System"
            TextSize        =   0
            Top             =   100
            Underline       =   False
            Visible         =   True
            Width           =   122
            BehaviorIndex   =   13
         End
         Begin StaticText stDuration
            AutoDeactivate  =   True
            BehaviorIndex   =   14
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   20
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "GroupBox1"
            Italic          =   False
            Left            =   397
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   False
            Multiline       =   False
            Scope           =   0
            TabIndex        =   8
            TabPanelIndex   =   3
            TabStop         =   True
            Text            =   "0.0 seconds"
            TextAlign       =   0
            TextColor       =   0
            TextFont        =   "System"
            TextSize        =   0
            Top             =   68
            Underline       =   False
            Visible         =   True
            Width           =   172
            BehaviorIndex   =   14
         End
         Begin StaticText stCompletionTime
            AutoDeactivate  =   True
            BehaviorIndex   =   15
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   20
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "GroupBox1"
            Italic          =   False
            Left            =   397
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   False
            Multiline       =   False
            Scope           =   0
            TabIndex        =   9
            TabPanelIndex   =   3
            TabStop         =   True
            Text            =   "0:00 AM"
            TextAlign       =   0
            TextColor       =   0
            TextFont        =   "System"
            TextSize        =   0
            Top             =   100
            Underline       =   False
            Visible         =   True
            Width           =   172
            BehaviorIndex   =   15
         End
         Begin StaticText StaticText4
            AutoDeactivate  =   True
            BehaviorIndex   =   16
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   20
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "GroupBox1"
            Italic          =   False
            Left            =   64
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Multiline       =   False
            Scope           =   0
            TabIndex        =   10
            TabPanelIndex   =   3
            TabStop         =   True
            Text            =   "Total:"
            TextAlign       =   0
            TextColor       =   0
            TextFont        =   "System"
            TextSize        =   0
            Top             =   68
            Underline       =   False
            Visible         =   True
            Width           =   100
            BehaviorIndex   =   16
         End
         Begin StaticText stTotalTests
            AutoDeactivate  =   True
            BehaviorIndex   =   17
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   20
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "GroupBox1"
            Italic          =   False
            Left            =   123
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Multiline       =   False
            Scope           =   0
            TabIndex        =   11
            TabPanelIndex   =   3
            TabStop         =   True
            Text            =   0
            TextAlign       =   0
            TextColor       =   0
            TextFont        =   "System"
            TextSize        =   0
            Top             =   68
            Underline       =   False
            Visible         =   True
            Width           =   100
            BehaviorIndex   =   17
         End
      End
      Begin BevelButton CopyButton
         AcceptFocus     =   False
         AutoDeactivate  =   True
         BehaviorIndex   =   18
         Bevel           =   0
         Bold            =   False
         ButtonType      =   0
         Caption         =   "Copy"
         CaptionAlign    =   3
         CaptionDelta    =   0
         CaptionPlacement=   1
         Enabled         =   True
         HasMenu         =   0
         Height          =   22
         HelpTag         =   ""
         Icon            =   ""
         IconAlign       =   0
         IconDX          =   0
         IconDY          =   0
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   False
         Left            =   48
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   ""
         MenuValue       =   0
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         Top             =   413
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   60
         BehaviorIndex   =   18
      End
   End
   Begin PushButton pbAbout
      AutoDeactivate  =   True
      BehaviorIndex   =   19
      Bold            =   False
      Cancel          =   False
      Caption         =   "About"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   538
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      Top             =   462
      Underline       =   False
      Visible         =   True
      Width           =   85
      BehaviorIndex   =   19
   End
   Begin ProgressWheel RunningProgress
      AutoDeactivate  =   True
      BehaviorIndex   =   20
      Enabled         =   True
      Height          =   16
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   132
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   ""
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   468
      Visible         =   False
      Width           =   16
      BehaviorIndex   =   20
   End
End
#tag EndWindow

#tag WindowCode
	#tag MenuHandler
		Function TestRunAllTests() As Boolean Handles TestRunAllTests.Action
			RunAllTests
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileSaveAs() As Boolean Handles FileSaveAs.Action
			SaveAs
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileSave() As Boolean Handles FileSave.Action
			Dim XmlOutput As TextOutputStream
			
			If mXmlFile = Nil Then
			SaveAs
			Else
			XmlOutput = mXmlFile.CreateTextFile
			XmlOutput.WriteLine(efTestResults.Text)
			XmlOutput.Close
			End if
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileOpen() As Boolean Handles FileOpen.Action
			Dim TestSuite As New RBUnit.TestController
			Dim OpenFile As New OpenDialog
			Dim TestFile As FolderItem
			Dim TestInput As TextInputStream
			Dim Xml As String
			
			OpenFile.Filter = "xml"
			OpenFile.PromptText = "Select a Test Result XML file"
			OpenFile.Title = "Open Test Result File"
			
			TestFile = OpenFile.ShowModalWithin(Self)
			
			If TestFile <> Nil Then
			TestInput = TestFile.OpenAsTextFile
			TestInput.Encoding = Encodings.UTF8
			Xml = TestInput.ReadAll
			#If TargetWin32
			Xml = ReplaceLineEndings(Xml, EndOfLine.Windows)
			#Elseif TargetMacOS
			Xml = ReplaceLineEndings(Xml, EndOfLine.Macintosh)
			#Elseif TargetLinux
			Xml = ReplaceLineEndings(Xml, EndOfLine.UNIX)
			#Endif
			
			TestInput.Close
			
			TestSuite.LoadTestResults = Xml
			
			OutputResults(TestSuite)
			
			End If
			
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function AppleAboutRBUnit() As Boolean Handles AppleAboutRBUnit.Action
			About
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function HelpRBUnitHelp() As Boolean Handles HelpRBUnitHelp.Action
			ShowURL("http://code.google.com/p/rbunit/wiki/Home")
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h21
		Private Sub ParseStartTree(Xml As XmlDocument)
		  ParseNodeId = 0
		  
		  If ParseNodeStorage = Nil Then
		    ParseNodeStorage = New Dictionary
		  Else
		    ParseNodeStorage.Clear
		  End if
		  
		  TestResultTree.DeleteAllRows
		  
		  ParseAddNode(Xml.DocumentElement)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ParseAddNode(Node As XmlNode)
		  Dim ChildCount As Integer
		  Dim i As Integer
		  
		  If Node.ChildCount > 0 Then
		    Select Case Node.Name
		    Case "TestSuite"
		      'Self.Title = "RBUnit Test Results - " + Node.GetAttribute("name")
		      mDuration = Node.GetAttribute("duration")
		      mCompleted = Node.GetAttribute("completed")
		      TestResultTree.AddFolder(Node.GetAttribute("name"))
		      mSuiteRow = TestResultTree.LastIndex
		      TestResultTree.Cell(mSuiteRow, 1) = Str(ParseNodeId)
		      ParseNodeStorage.Value(Str(ParseNodeId)) = Node
		    Case "TestGroup"
		      TestResultTree.AddFolder(Node.GetAttribute("name"))
		      mGroupRow = TestResultTree.LastIndex
		      TestResultTree.RowPicture(mGroupRow) = Circle(&c00ff00)
		      TestResultTree.Cell(mGroupRow, 1) = Str(ParseNodeId)
		      ParseNodeStorage.Value(Str(ParseNodeId)) = Node
		      
		      ' If any child has a fail then set red dot
		      For i = 0 To Node.ChildCount-1
		        If Node.Child(i).FirstChild.Name = "Status" Then
		          If Node.Child(i).FirstChild.FirstChild.Value = "Fail" Then
		            TestResultTree.RowPicture(mGroupRow) = Circle(&cff0000)
		          End If
		        End If
		      Next
		      
		    Case "Test"
		      ChildCount = Node.ChildCount
		      For i = 0 To ChildCount-1
		        If Node.Child(i).Name = "Status" Then
		          If Node.Child(i).FirstChild.Value = "Pass" Then
		            TestResultTree.AddRow(Node.GetAttribute("name"))
		            TestResultTree.RowPicture(TestResultTree.LastIndex) = Circle(&c00ff00) 'GreenSquare
		          Else
		            TestResultTree.AddFolder(Node.GetAttribute("name"))
		            TestResultTree.RowPicture(TestResultTree.LastIndex) = Circle(&cff0000) ' RedSquare
		            mSuiteFailed = True
		          End If
		        End If
		      Next
		      TestResultTree.Cell(TestResultTree.LastIndex, 1) = Str(ParseNodeId)
		      ParseNodeStorage.Value(Str(ParseNodeId)) = Node
		    Case "Message"
		      TestResultTree.AddRow(Node.FirstChild.Value)
		      TestResultTree.RowPicture(TestResultTree.LastIndex) = Circle(&cff0000)
		      TestResultTree.Cell(TestResultTree.LastIndex, 1) = Str(ParseNodeId)
		      ParseNodeStorage.Value(Str(ParseNodeId)) = Node.FirstChild
		    End Select
		  Else
		    'If Node.Type = 3 Then
		    'TestResultTree.AddRow(Node.Value)
		    'Else
		    'TestResultTree.AddRow(Node.Name)
		    'End If
		  End If
		  
		  // this just keeps up with a unique id for each node
		  'TestResultTree.Cell(TestResultTree.LastIndex, 1) = Str(ParseNodeId)
		  
		  // now lets shove that id and node in
		  // the dictionary for later retrieval when
		  // a row expands and we need to display the
		  // children
		  'ParseNodeStorage.Value(Str(ParseNodeId)) = Node
		  ParseNodeId = ParseNodeId + 1
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ParseAddChildren(ParentId As String)
		  Dim Node As XmlNode
		  Dim i As Integer
		  
		  Try
		    Node = XmlNode(ParseNodeStorage.Value(ParentId))
		    
		    For i = 0 To Node.ChildCount-1
		      ParseAddNode(Node.Child(i))
		    Next
		    
		  Catch
		    Return
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RunAllTests()
		  RunningProgress.Visible = true
		  RunningProgress.Refresh  // doesn't animate but at least it shows up
		  Dim myTestSuite As RBUnit.TestController = RBUnitTestRunner.testSuite
		  mSuiteFailed = False
		  
		  myTestSuite.Start
		  
		  OutputResults(myTestSuite)
		  RunningProgress.Visible = false
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SaveAs()
		  Dim SaveDialog As New SaveAsDialog
		  Dim XmlOutput As TextOutputStream
		  
		  SaveDialog.PromptText = "Specify the filename to save the tests as"
		  SaveDialog.SuggestedFileName = "Tests" + App.ExecutableFile.Name + ".xml"
		  SaveDialog.Title = "Save Tests"
		  mXmlFile = SaveDialog.ShowModalWithin(Self)
		  
		  If mXmlFile <> Nil Then
		    XmlOutput = mXmlFile.CreateTextFile
		    XmlOutput.WriteLine(efTestResults.Text)
		    XmlOutput.Close
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub OutputResults(myTestSuite As RBUnit.TestController)
		  Dim Results As XmlDocument
		  Dim i As Integer
		  
		  Results = myTestSuite.Results
		  
		  myTestSuite.FillDurationList(lbDurationList)
		  
		  efTestResults.Text = ReplaceAll(Results.ToString, "><", ">" + EndOfLine + "<")
		  
		  ParseStartTree(Results)
		  
		  If TestResultTree.ListCount <= 0 Then
		    TestResultTree.AddRow("No tests to run")
		    Return
		  End If
		  
		  For i = 0 To TestResultTree.ListCount-1
		    TestResultTree.Expanded(i) = True
		  Next
		  
		  If mSuiteFailed Then
		    TestResultTree.RowPicture(mSuiteRow) = Circle(&cff0000)
		  Else
		    TestResultTree.RowPicture(mSuiteRow) = Circle(&c00ff00)
		  End If
		  
		  stTotalTests.Text = Str(myTestSuite.TotalTests)
		  stPassedTests.Text = Str(myTestSuite.TotalPassedTests)
		  stFailedTests.Text = Str(myTestSuite.TotalTests - myTestSuite.TotalPassedTests)
		  stDuration.Text = mDuration + " seconds"
		  stCompletionTime.Text = mCompleted
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Circle(circleColor As Color) As Picture
		  Dim circle As Picture
		  
		  circle = NewPicture(16, 16, 32)
		  
		  circle.Graphics.ForeColor = circleColor
		  circle.Graphics.FillOval(1, 1, 15, 15)
		  
		  Return circle
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub About()
		  Dim aboutDialog As New MessageDialog
		  Dim button As MessageDialogButton
		  
		  aboutDialog.Message = "RBUnit " + RBUNIT_VERSION + EndOfLine + EndOfLine + "Copyright 2004-2008 LogicalVue Software, Inc."
		  aboutDialog.Title = "About RBUnit " + RBUNIT_VERSION
		  aboutDialog.Icon = 0
		  aboutDialog.CancelButton.Caption = "Visit RBDevZone.com"
		  aboutDialog.CancelButton.Visible = True
		  
		  button = aboutDialog.ShowModalWithin(Self)
		  
		  If button = aboutDialog.CancelButton Then
		    ShowURL("http://www.rbdevzone.com/free-software/rbunit")
		  End If
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private ParseNodeStorage As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ParseNodeId As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDuration As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCompleted As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mXmlFile As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSuiteRow As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSuiteFailed As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mGroupRow As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Shared mUserTestController As RBUnit.TestController
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			if mUserTestController is nil then
			// default to the included original class
			return New RBUnit.StartTests
			end if
			return mUserTestController  // user override pointing to some class they have created elsewhere
			End Get
		#tag EndGetter
		#tag Setter
			Set
			mUserTestController = value
			End Set
		#tag EndSetter
		Shared testSuite As RBUnit.TestController
	#tag EndComputedProperty


	#tag Constant, Name = RBUNIT_VERSION, Type = String, Dynamic = False, Default = \"3.1", Scope = Private
	#tag EndConstant


#tag EndWindowCode

#tag Events pbRunTests
	#tag Event
		Sub Action()
		  RunAllTests
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  #If TargetLinux Then
		    Me.Height = Me.Height + 10
		  #Endif
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events TestResultTree
	#tag Event
		Sub DoubleClick()
		  Me.Expanded(Me.ListIndex) = Not Me.Expanded(Me.ListIndex)
		End Sub
	#tag EndEvent
	#tag Event
		Sub ExpandRow(row As Integer)
		  ParseAddChildren(Me.Cell(row, 1))
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lbDurationList
	#tag Event
		Sub Open()
		  Me.ColumnAlignment(2) = 3
		  Me.ColumnAlignment(3) = 3
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CopyButton
	#tag Event
		Sub Action()
		  Dim c As New Clipboard
		  c.SetText(efTestResults.Text)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pbAbout
	#tag Event
		Sub Open()
		  #If TargetLinux Then
		    Me.Height = Me.Height + 10
		  #Endif
		End Sub
	#tag EndEvent
	#tag Event
		Sub Action()
		  About
		End Sub
	#tag EndEvent
#tag EndEvents
