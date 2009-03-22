	#tag Class
	Protected Class TestController
		#tag Method, Flags = &h0
			Sub Start()
			  Dim Now As Date
			  
			  TestResults = New XmlDocument
			  mTestSuite = TestResults.AppendChild(TestResults.CreateElement("TestSuite"))
			  mTestSuite.SetAttribute("name", App.ExecutableFile.Name)
			  
			  Now = New Date
			  mTestSuite.SetAttribute("started", Now.ShortDate + " " + Now.ShortTime)
			  
			  StartTimer
			  
			  ClearFixturesList
			  RaiseEvent StartTestFixtures  // event to record all those we're about to run
			  RunFixturesList
			  
			  EndTimer
			  
			  Now = New Date
			  
			  mTestSuite.SetAttribute("duration", Str(mTotalDuration))
			  mTestSuite.SetAttribute("completed", Now.ShortDate + " " + Now.ShortTime)
			End Sub
		#tag EndMethod

		#tag Method, Flags = &h0
			Function CreateTestGroup(TestGroupName As String) As XmlNode
			  Dim TestGroup As XmlNode
			  
			  mTestFixtureCount = mTestFixtureCount + 1
			  
			  If TestGroupName = "" Then
			    TestGroupName = "Test Fixture " + Str(mTestFixtureCount)
			  End If
			  
			  TestGroup = mTestSuite.AppendChild(TestResults.CreateElement("TestGroup"))
			  TestGroup.SetAttribute("name", TestGroupName)
			  
			  Return TestGroup
			End Function
		#tag EndMethod

		#tag Method, Flags = &h0
			Function Results() As XmlDocument
			  Return TestResults
			End Function
		#tag EndMethod

		#tag Method, Flags = &h0
			Function TotalTests() As Integer
			  Return mTotalTests
			End Function
		#tag EndMethod

		#tag Method, Flags = &h0
			Function TotalPassedTests() As Integer
			  Return mPassedTests
			End Function
		#tag EndMethod

		#tag Method, Flags = &h21
			Private Sub StartTimer()
			  mTimer = Microseconds
			  mTotalDuration = 0
			End Sub
		#tag EndMethod

		#tag Method, Flags = &h21
			Private Sub EndTimer()
			  mTotalDuration = (Microseconds-mTimer)/1000000
			End Sub
		#tag EndMethod

		#tag Method, Flags = &h0
			Sub FillDurationList(DurationList As ListBox)
			  Dim GroupCount As Integer
			  Dim TestCount As Integer
			  Dim i As Integer
			  Dim j As Integer
			  Dim x As Integer
			  Dim ChildCount As Integer
			  Dim DurationFound As Boolean
			  Dim Passed As Boolean
			  Dim Duration As String
			  Dim durationDouble As Double
			  
			  DurationList.DeleteAllRows
			  
			  GroupCount = mTestSuite.ChildCount
			  
			  mTotalTests = 0
			  mPassedTests = 0
			  
			  For i = 0 To GroupCount-1
			    TestCount = mTestSuite.Child(i).ChildCount
			    mTotalTests = mTotalTests + TestCount
			    
			    For j = 0 To TestCount-1
			      ' Find Duration Value
			      ChildCount = mTestSuite.Child(i).Child(j).ChildCount
			      DurationFound = False
			      Passed = False
			      Duration = "N/A"
			      For x = 0 to ChildCount-1
			        If mTestSuite.Child(i).Child(j).Child(x).Name = "Duration" Then
			          DurationFound = True
			          Duration = mTestSuite.Child(i).Child(j).Child(x).FirstChild.Value
			        ElseIf mTestSuite.Child(i).Child(j).Child(x).Name = "Status" Then  // currently one Status for many Message entries
			          If mTestSuite.Child(i).Child(j).Child(x).FirstChild.Value = "Pass" Then
			            Passed = True
			            mPassedTests = mPassedTests + 1
			          End If
			        End If
			      Next
			      If Passed Then
			        ' Class Name
			        DurationList.AddRow(mTestSuite.Child(i).GetAttribute("name"))
			        
			        ' Method Name
			        DurationList.Cell(DurationList.LastIndex, 1) = mTestSuite.Child(i).Child(j).GetAttribute("name")
			        
			        ' Duration
			        durationDouble = Val(Duration)
			        DurationList.Cell(DurationList.LastIndex, 2) = Format(durationDouble, "####.000000")
			        
			        ' % Of Total
			        If DurationFound And mTotalDuration <> 0 Then
			          DurationList.Cell(DurationList.LastIndex, 3) = Format(Val(Duration)/mTotalDuration, "#0.00%")
			        Else
			          DurationList.Cell(DurationList.LastIndex, 3) = "N/A"
			        End If
			      End If
			    Next
			  Next
			  
			End Sub
		#tag EndMethod

		#tag Method, Flags = &h0
			Sub LoadTestResults(Assigns Value As String)
			  TestResults = New XmlDocument
			  
			  TestResults.LoadXml(Value)
			  
			  mTestSuite = TestResults.FirstChild
			End Sub
		#tag EndMethod

		#tag Method, Flags = &h1
			Protected Sub ClearFixturesList()
			  redim mFixturesAboutToRun(-1)
			End Sub
		#tag EndMethod

		#tag Method, Flags = &h0
			Sub AddFixtureToRun(tf as TestFixture)
			  mFixturesAboutToRun.Append tf
			End Sub
		#tag EndMethod

		#tag Method, Flags = &h1
			Protected Sub RunFixturesList()
			  for each tf as TestFixture in mFixturesAboutToRun
			    tf.Start me
			  next
			End Sub
		#tag EndMethod


		#tag Hook, Flags = &h0
			Event StartTestFixtures()
		#tag EndHook


		#tag Property, Flags = &h0
			TestResults As XmlDocument
		#tag EndProperty

		#tag Property, Flags = &h21
			Private mTestSuite As XmlNode
		#tag EndProperty

		#tag Property, Flags = &h21
			Private mTimer As Double
		#tag EndProperty

		#tag Property, Flags = &h21
			Private mTotalTests As Integer
		#tag EndProperty

		#tag Property, Flags = &h21
			Private mPassedTests As Integer
		#tag EndProperty

		#tag Property, Flags = &h21
			Private mTotalDuration As Double
		#tag EndProperty

		#tag Property, Flags = &h21
			Private mTestFixtureCount As Integer
		#tag EndProperty

		#tag Property, Flags = &h21
			Private mFixturesAboutToRun() As TestFixture
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
