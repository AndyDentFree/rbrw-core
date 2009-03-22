#tag Class
Protected Class rbrwWrappingTests
Inherits testsNeedingGraphicsEnv
	#tag Method, Flags = &h0
		Sub CalculateWrappingNoWrappingTest()
		  dim sizer as new rbrwTextSizer
		  sizer.calculateWrapping "Smith", 200
		  
		  Assert.AreEqual 1, sizer.getNumRows
		  dim lines() as integer = sizer.getLineStarts
		  Assert.AreEqual 0, UBound(lines)
		  Assert.AreEqual 0, lines(0)
		  
		  dim lengths() as integer = sizer.getLineLengths
		  Assert.AreEqual 0, UBound(lengths)
		  Assert.AreEqual 33, lengths(0), "pixels long by testing on Mac, may vary"
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CalculateWrappingSizedTextArrayTest()
		  dim sizedBody as new rbrwSizedTextArray(2)
		  
		  sizedBody.text(0) = "Smith"
		  sizedBody.text(1) = "89"
		  sizedBody.CalculateWrapping 0, 200
		  sizedBody.CalculateWrapping 1, 80
		  
		  // wrap calcs for first col
		  Assert.AreEqual 1, sizedBody.GetNumRows(0)
		  dim lines() as integer = sizedBody.GetLineStarts(0)
		  Assert.AreEqual 0, UBound(lines)
		  Assert.AreEqual 0, lines(0)
		  
		  dim lengths() as integer = sizedBody.GetLineLengths(0)
		  Assert.AreEqual 0, UBound(lines)
		  Assert.AreEqual 0, lines(0)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CalculateWrappingNoWrappingMultipleWordTest()
		  dim sizer as new rbrwTextSizer
		  sizer.calculateWrapping "Smith and Jones", 200
		  
		  Assert.AreEqual 1, sizer.getNumRows
		  dim lines() as integer = sizer.getLineStarts
		  Assert.AreEqual 0, UBound(lines)
		  Assert.AreEqual 0, lines(0)
		  
		  dim lengths() as integer = sizer.getLineLengths
		  Assert.AreEqual 0, UBound(lengths)
		  Assert.AreEqual 94, lengths(0)  //  pixels long by testing on Mac, may vary
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CalculateWrappingMultipleWordTest()
		  dim sizer as new rbrwTextSizer
		  sizer.calculateWrapping "Smith and Jones", 40  // narrow so have to wrap each word onto new line
		  
		  Assert.AreEqual 3, sizer.getNumRows, "should wrap to three rows"
		  dim lines() as integer = sizer.getLineStarts
		  Assert.AreEqual 2, UBound(lines)
		  Assert.AreEqual 0, lines(0)
		  Assert.AreEqual 6, lines(1), "first word of line 1 starts at character 6"
		  Assert.AreEqual 10, lines(2), "first word of line 2 starts at character 10"
		  
		  dim lengths() as integer = sizer.getLineLengths
		  Assert.AreEqual 2, UBound(lengths)
		  Assert.AreEqual 33, lengths(0), "length of 'Smith'"
		  Assert.AreEqual 22, lengths(1), "length of 'and'"
		  Assert.AreEqual 31, lengths(2), "length of 'Jones'"
		  
		  
		End Sub
	#tag EndMethod


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
