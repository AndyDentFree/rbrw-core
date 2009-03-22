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
		  RBUnitTestRunner.testSuite = new rbrwTestSuite
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		PageSettings As String
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			added so code from aeon that uses App.propSystemDB can be used directly
		#tag EndNote
		propSystemDB As mySQLDatabase
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
