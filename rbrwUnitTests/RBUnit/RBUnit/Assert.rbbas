	#tag Class
	Protected Class Assert
		#tag Method, Flags = &h0
			Sub IsTrue(condition As Boolean, message As String = "")
			  If condition Then
			    Pass(message)
			  Else
			    Fail("<true> expected, but was <false>.", message)
			  End If
			End Sub
		#tag EndMethod

		#tag Method, Flags = &h0
			Sub Fail(message As String, userMsg as string = "")
			  if userMsg.LenB > 0 then
			    // for cases when we generate a failure description from comparisons like AreEqual and still append a user message
			    message =  message  + " - " + userMsg
			  end if
			  
			  // Write out the test group, name and failure indicator.
			  Dim status As XmlNode
			  Dim messageNode As XmlNode
			  Dim childCount As Integer
			  Dim i As Integer
			  Dim statusFound As Boolean
			  
			  childCount = XmlTestData.ChildCount
			  
			  statusFound = False
			  For i = 0 To ChildCount-1
			    If XmlTestData.Child(i).Name = "Status" Then
			      ' Replace with new status
			      status = XmlTestData.ReplaceChild(XmlTestSuite.CreateElement("Status"), XmlTestData.Child(i))
			      statusFound = True
			    End If
			  Next
			  
			  If Not statusFound Then
			    ' Add new status
			    status = XmlTestData.AppendChild(XmlTestSuite.CreateElement("Status"))
			  End If
			  
			  status.AppendChild(XmlTestSuite.CreateTextNode("Fail"))
			  messageNode = XmlTestData.AppendChild(XmlTestSuite.CreateElement("Message"))
			  messageNode.AppendChild(XmlTestSuite.CreateTextNode("Failure: " + message))
			  
			End Sub
		#tag EndMethod

		#tag Method, Flags = &h0
			Sub Pass(message As String = "")
			  Dim status As XmlNode
			  Dim messageNode As XmlNode
			  Dim childCount As Integer
			  Dim i As Integer
			  Dim statusFound As Boolean
			  
			  childCount = XmlTestData.ChildCount
			  
			  statusFound = False
			  For i = 0 To ChildCount-1
			    If XmlTestData.Child(i).Name = "Status" Then
			      // Replace with new status
			      // INCORRECT CODE REMOVED BY ANDY DENT
			      ' status = XmlTestData.ReplaceChild(XmlTestSuite.CreateElement("Status"), XmlTestData.Child(i))
			      // LEAVE A STATUS THERE - it is either Pass in which we're happy or Fail which we aren't allowed to override
			      statusFound = True
			    End If
			  Next
			  
			  If Not statusFound Then
			    // Add new status
			    status = XmlTestData.AppendChild(XmlTestSuite.CreateElement("Status"))
			    status.AppendChild(XmlTestSuite.CreateTextNode("Pass"))
			  End If
			  
			  
			  // ANDY DENT - don't append messages in Pass either as the RBUnitTestRunner.ParseAddNode only seems to expect failures to have messages
			  //
			  'If message <> "" Then
			  'messageNode = XmlTestData.AppendChild(XmlTestSuite.CreateElement("Message"))
			  'messageNode.AppendChild(XmlTestSuite.CreateTextNode(message))
			  'End If
			End Sub
		#tag EndMethod

		#tag Method, Flags = &h0
			Sub IsFalse(condition As Boolean, message As String = "")
			  If condition Then
			    Fail("<false> expected, but was <true>.", message)
			  Else
			    Pass(message)
			  End If
			End Sub
		#tag EndMethod

		#tag Method, Flags = &h0
			Sub IsNil(anObject As Object, message As String = "")
			  If anObject = Nil Then
			    Pass(message)
			  Else
			    Fail("Object was expected to be <nil>, but was not.", message)
			  End If
			  
			End Sub
		#tag EndMethod

		#tag Method, Flags = &h0
			Sub IsNotNil(anObject As Object, message As String = "")
			  If anObject <> Nil Then
			    Pass(message)
			  Else
			    Fail("Expected value not to be <nil>, but was <nil>.", message)
			  End If
			  
			End Sub
		#tag EndMethod

		#tag Method, Flags = &h0
			Sub AreEqual(expected As Double, actual As Double, tolerance As Double, message As String = "")
			  Dim diff As Double
			  
			  diff = Abs(expected - actual)
			  If diff <= (tolerance + 0.00000001) Then
			    Pass(message)
			  Else
			    Fail(FailEqualMessage(Format(expected, "#########.##########"), Format(actual, "#########.##########")), message)
			  End If
			End Sub
		#tag EndMethod

		#tag Method, Flags = &h21
			Private Function FailEqualMessage(expected As String, actual As String) As String
			  Dim message As String
			  
			  message = "Expected <" + expected + "> but was <" + actual + ">."
			  
			  Return message
			End Function
		#tag EndMethod

		#tag Method, Flags = &h0
			Sub AreEqual(expected As Integer, actual As Integer, message As String = "")
			  If expected = actual Then
			    Pass(message)
			  Else
			    Fail( FailEqualMessage(Str(expected), Str(actual)), message)
			  End If
			End Sub
		#tag EndMethod

		#tag Method, Flags = &h0
			Sub AreEqual(expected As Date, actual As Date, message As String = "")
			  If expected.TotalSeconds = actual.TotalSeconds Then
			    Pass(message)
			  Else
			    Fail(FailEqualMessage(expected.ShortDate + " " + expected.LongTime, actual.ShortDate + " " + actual.LongTime), message)
			  End If
			End Sub
		#tag EndMethod

		#tag Method, Flags = &h0
			Sub AreEqual(expected As String, actual As String, message As String = "")
			  ' This is a case-insensitive comparison
			  
			  If expected = actual Then
			    Pass(message)
			  Else
			    Fail( FailEqualMessage(expected, actual), message )
			  End If
			End Sub
		#tag EndMethod

		#tag Method, Flags = &h0
			Sub AreEqual(expected As Color, actual As Color, message As String = "")
			  Dim expectedColor, actualColor As String
			  
			  If expected = actual Then
			    Pass(message)
			  Else
			    expectedColor = "RGB(" + Str(expected.Red) + ", " + Str(expected.Green) + ", " + Str(expected.Blue) + ")"
			    actualColor = "RGB(" + Str(actual.Red) + ", " + Str(actual.Green) + ", " + Str(actual.Blue) + ")"
			    Fail(FailEqualMessage(expectedColor, actualColor), message)
			  End If
			End Sub
		#tag EndMethod

		#tag Method, Flags = &h0
			Sub AreEqual(expected As Object, actual As Object, message As String = "")
			  ' Tests the objects for equality.  This requires Operator_Compare to be implemented
			  ' in the class
			  if expected is actual then
			    Pass(message)  // same object so is equal to self
			  else
			    // naively but operator_compare is not a base method so the subclass version is NOT checked here
			    //if expected = actual then
			    // so lookup using Introspection
			    Dim info As Introspection.TypeInfo = Introspection.GetType(expected)
			    
			    Dim methods() As Introspection.MethodInfo = info.GetMethods
			    Dim gotCompare as Boolean
			    For Each m As Introspection.MethodInfo In methods
			      Dim param() As Variant
			      Dim rv As Variant
			      
			      If m.Name = "Operator_Compare" Then
			        gotCompare = True
			        Try
			          param.append actual
			          rv = m.Invoke(expected, param)
			        End try
			        if rv.IntegerValue = 0 then
			          Pass(Message)
			        else
			          Fail("Failure: Objects are not equal", message)
			        end if
			        Exit For
			      end if // Operator_Compare
			    next  // loop through methods to find Operator_Compare
			    if not gotCompare then
			      Fail("Failure: Objects don't implement Operator_Compare", message)
			    end if
			  end if  // shortcut using "is"
			End Sub
		#tag EndMethod

		#tag Method, Flags = &h0
			Sub AreEqual(expected() As String, actual() As String, message As String = "")
			  Dim expectedSize, actualSize As Integer
			  
			  expectedSize = UBound(expected)
			  actualSize = UBound(actual)
			  
			  If expectedSize <> actualSize Then
			    Fail( "Expected string arrays ubounds <" + Str(expectedSize) + _
			    "> but was <" + Str(actualSize) + ">.", _
			    message)
			    return
			  End If
			  
			  For i as integer = 0 to expectedSize
			    If expected(i) <> actual(i) Then
			      Fail( FailEqualMessage("Array(" + Str(i) + ") = '" + expected(i) + "'", _
			      "Array(" + Str(i) + ") = '" + actual(i) + "'"), _
			      message)
			      return
			    End If
			  Next
			  
			  Pass(message)
			End Sub
		#tag EndMethod

		#tag Method, Flags = &h21
			Private Sub Ignore()
			  ' Causes the test results to be ignored.  They will not be included in the results XML
			End Sub
		#tag EndMethod

		#tag Method, Flags = &h0
			Sub AreSame(expected As Object, actual As Object, message As String = "")
			  If expected is actual Then
			    Pass(message)
			  Else
			    Fail("Objects are not the same", message)
			  End If
			End Sub
		#tag EndMethod

		#tag Method, Flags = &h0
			Sub AreDifferent(expected As Object, actual As Object, message As String = "")
			  If not(expected is actual) Then
			    Pass(message)
			  Else
			    Fail("Objects are not the same", message)
			  End If
			End Sub
		#tag EndMethod

		#tag Method, Flags = &h0
			Sub AreEqualVariants(expected As Variant, actual As Variant, message As String = "")
			  ' This is a case-insensitive comparison
			  If expected = actual Then
			    Pass(message)
			  Else
			    break  // Andy - this needs to be smarter, using Introspection to evaluate variant contents and see if is array
			    Fail( FailEqualMessage(expected.StringValue, actual.StringValue), message )
			  End If
			End Sub
		#tag EndMethod


		#tag Property, Flags = &h0
			XmlTestData As XmlNode
		#tag EndProperty

		#tag Property, Flags = &h0
			XmlTestSuite As XmlDocument
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
