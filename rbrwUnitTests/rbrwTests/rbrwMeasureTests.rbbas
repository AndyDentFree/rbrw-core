#tag Class
Protected Class rbrwMeasureTests
Inherits testsNeedingGraphicsEnv
	#tag Method, Flags = &h0
		Sub HeightOfTextStyleTest()
		  // try a range of heights to confirm the style consistently gets a realistic pixel height
		  dim ts as new rbrwTextStyle("Helvetica", 10)
		  Assert.AreEqual 8.0,  ts.TextAscent( rbrwCurrentDraw.CurrentGraphics ), 0.0
		  
		  ts = new rbrwTextStyle("Helvetica", 18)
		  Assert.AreEqual 14.0,  ts.TextAscent( rbrwCurrentDraw.CurrentGraphics ), 0.0
		  
		  ts = new rbrwTextStyle("Helvetica", 36)
		  Assert.AreEqual 28.0,  ts.TextAscent( rbrwCurrentDraw.CurrentGraphics ), 0.0
		  
		  ts = new rbrwTextStyle("Helvetica", 72)
		  Assert.AreEqual 55.0,  ts.TextAscent( rbrwCurrentDraw.CurrentGraphics ), 0.0
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ScaledHeightOfTextStyleTest()
		  // before scaling kicks in
		  rbrwCurrentDraw.setStyleFrom new rbrwTextStyle("Helvetica", 10)
		  Assert.AreEqual 8.0,  rbrwCurrentDraw.TextAscent, 0.0
		  
		  rbrwCurrentDraw.setStyleFrom new rbrwTextStyle("Helvetica", 18)
		  Assert.AreEqual 14.0,  rbrwCurrentDraw.TextAscent, 0.0
		  
		  rbrwCurrentDraw.setStyleFrom new rbrwTextStyle("Helvetica", 36)
		  Assert.AreEqual 28.0, rbrwCurrentDraw.TextAscent, 0.0
		  
		  rbrwCurrentDraw.setStyleFrom new rbrwTextStyle("Helvetica", 72)
		  Assert.AreEqual 55.0,  rbrwCurrentDraw.TextAscent, 0.0
		  
		  
		  
		  dim tempScaler as new stCurrentDrawScaling( 2.0 )
		  
		  // try a range of heights to confirm the style consistently gets a realistic pixel height
		  rbrwCurrentDraw.setStyleFrom new rbrwTextStyle("Helvetica", 10)
		  Assert.AreEqual 15.0,  rbrwCurrentDraw.TextAscent, 0.0
		  
		  rbrwCurrentDraw.setStyleFrom new rbrwTextStyle("Helvetica", 18)
		  Assert.AreEqual 28.0,  rbrwCurrentDraw.TextAscent, 0.0
		  
		  rbrwCurrentDraw.setStyleFrom new rbrwTextStyle("Helvetica", 36)
		  Assert.AreEqual 55.0, rbrwCurrentDraw.TextAscent, 0.0
		  
		  rbrwCurrentDraw.setStyleFrom new rbrwTextStyle("Helvetica", 72)
		  Assert.AreEqual 111.0,  rbrwCurrentDraw.TextAscent, 0.0
		  
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
