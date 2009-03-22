#tag Class
Protected Class rbrwGraphicsEnvTests
Inherits testsNeedingGraphicsEnv
	#tag Method, Flags = &h0
		Sub HaveCurrentEnvTest()
		  dim g as Graphics = rbrwCurrentDraw.CurrentGraphics
		  Assert.IsNotNil rbrwCurrentDraw.CurrentGraphics, "rbrwCurrentDraw.CurrentGraphics has non-nil value"
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CanAdjustSharedGraphicsPositionTest()
		  rbrwCurrentDraw.moveTo 11.3, 99.0
		  Assert.AreEqual rbrwCurrentDraw.x, 11.3, 0.0
		  Assert.AreEqual rbrwCurrentDraw.y, 99.0, 0.0
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
