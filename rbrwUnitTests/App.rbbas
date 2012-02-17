#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  #If TargetWin32
		    FileQuit.Text = "E&xit"
		    FileQuit.CommandKey = ""
		    
		    HelpRBUnitHelp.CommandKey = "F1"
		  #Endif
		  
		  RBUnitTestRunner.Show // added this line to work around very longstanding bug 4633 losing external default window property
		  RBUnitTestRunner.testSuite = new rbrwTestSuite
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		PageSettings As String
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="PageSettings"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
