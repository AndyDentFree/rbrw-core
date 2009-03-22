	#tag Class
	Protected Class TestFixture
		#tag Method, Flags = &h21
			Private Sub TestName(Assigns name As String)
			  ' Create a new node to contain the results of the next test that runs
			  mXmlTestData = mXmlTestGroup.AppendChild(mXmlTestSuite.CreateElement("Test"))
			  mXmlTestData.SetAttribute("name", name)
			  
			  Assert.XmlTestData = mXmlTestData
			  Assert.XmlTestSuite = mXmlTestSuite
			  
			End Sub
		#tag EndMethod

		#tag Method, Flags = &h0
			Sub Start(testController As RBUnit.TestController)
			  mXmlTestGroup = testController.CreateTestGroup(mFixtureName)
			  
			  If mXmlTestGroup Is Nil Then Return
			  
			  mXmlTestSuite = testController.TestResults
			  
			  mAssert = New RBUnit.Assert
			  
			  SetupFixture
			  RunTests
			  TearDownFixture
			End Sub
		#tag EndMethod

		#tag Method, Flags = &h21
			Private Sub StartTimer()
			  mTimer = Microseconds
			End Sub
		#tag EndMethod

		#tag Method, Flags = &h21
			Private Sub EndTimer()
			  Dim duration As XmlNode
			  Dim elapsed As Double
			  
			  If mXmlTestData = Nil Then Return
			  
			  elapsed = (Microseconds-mTimer) / 1000000
			  duration = mXmlTestData.AppendChild(mXmlTestSuite.CreateElement("Duration"))
			  duration.AppendChild(mXmlTestSuite.CreateTextNode(Str(Elapsed)))
			End Sub
		#tag EndMethod

		#tag Method, Flags = &h0
			Sub FailTest()
			  ' For use by RBScript because it can only call public methods on this class
			  Assert.Fail("An exception occurred and was caught.")
			End Sub
		#tag EndMethod

		#tag Method, Flags = &h0
			Sub Constructor(testController As RBUnit.TestController)
			  testController.AddFixtureToRun self
			End Sub
		#tag EndMethod

		#tag Method, Flags = &h0
			Sub Constructor(testController As RBUnit.TestController, testFixtureName As String)
			  mFixtureName = testFixtureName
			  testController.AddFixtureToRun self
			End Sub
		#tag EndMethod

		#tag Method, Flags = &h1
			Protected Function Assert() As RBUnit.Assert
			  If mXmlTestData Is Nil Then
			    Me.TestName = "Test Name not specified (Use RunTest(""TestName"") instead of calling the Test Method directly)."
			    StartTimer
			    EndTimer
			  End If
			  
			  Return mAssert
			End Function
		#tag EndMethod

		#tag Method, Flags = &h21
			Private Sub RunTests()
			  Dim info As Introspection.TypeInfo
			  
			  info = Introspection.GetType(Self)
			  
			  Dim methods() As Introspection.MethodInfo
			  methods = info.GetMethods
			  
			  For Each m As Introspection.MethodInfo In methods
			    Dim param() As Variant
			    Dim rv As Variant
			    
			    If m.Name.Right(4) = "Test" And m.Name <> "FailTest" Then
			      Me.TestName = m.Name
			      
			      Setup
			      StartTimer
			      Try
			        rv = m.Invoke(Self, param)
			      Catch e As RuntimeException
			        Dim eInfo As Introspection.TypeInfo
			        eInfo = Introspection.GetType(e)
			        
			        Dim eMessage As String
			        eMessage = "A " + eInfo.FullName + " occurred and was caught."
			        If e.Message <> "" Then
			          eMessage = eMessage + EndOfLine + "Message: " + e.Message
			        End If
			        Assert.Fail(eMessage)
			      End Try
			      EndTimer
			      TearDown
			      
			      mXmlTestData = Nil
			    End If
			    
			  Next
			End Sub
		#tag EndMethod


		#tag Hook, Flags = &h0
			Event TearDown()
		#tag EndHook

		#tag Hook, Flags = &h0
			Event Setup()
		#tag EndHook

		#tag Hook, Flags = &h0
			Event SetupFixture()
		#tag EndHook

		#tag Hook, Flags = &h0
			Event TearDownFixture()
		#tag EndHook


		#tag Property, Flags = &h21
			Private mXmlTestData As XmlNode
		#tag EndProperty

		#tag Property, Flags = &h21
			Private mXmlTestSuite As XmlDocument
		#tag EndProperty

		#tag Property, Flags = &h21
			Private mXmlTestGroup As XmlNode
		#tag EndProperty

		#tag Property, Flags = &h21
			Private mTimer As Double
		#tag EndProperty

		#tag Property, Flags = &h21
			Private mAssert As RBUnit.Assert
		#tag EndProperty

		#tag Property, Flags = &h1
			Protected mFixtureName As String
		#tag EndProperty


		#tag ViewBehavior
			#tag ViewProperty
				Name="Name"
				Visible=true
				Group="ID"
				InheritedFrom="Object"
			#tag EndViewProperty
			#tag ViewProperty
				Name="Index"
				Visible=true
				Group="ID"
				InitialValue="-2147483648"
				InheritedFrom="Object"
			#tag EndViewProperty
			#tag ViewProperty
				Name="Super"
				Visible=true
				Group="ID"
				InheritedFrom="Object"
			#tag EndViewProperty
			#tag ViewProperty
				Name="Left"
				Visible=true
				Group="Position"
				InitialValue="0"
				InheritedFrom="Object"
			#tag EndViewProperty
			#tag ViewProperty
				Name="Top"
				Visible=true
				Group="Position"
				InitialValue="0"
				InheritedFrom="Object"
			#tag EndViewProperty
		#tag EndViewBehavior
	End Class
	#tag EndClass
