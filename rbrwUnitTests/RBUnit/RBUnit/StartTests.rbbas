#tag Class
Protected Class StartTests
Inherits TestController
	#tag Event
		Sub StartTestFixtures()
		  '' Create instances of your test fixtures here. or use separate class - see note RBUnit.How To Register Tests
		  'Dim unitTests As RBUnit.TestFixture
		  '
		  '' unitTests = New MyTestFixture(Me)
		  'unitTests = New AssertPassTests(Me, "Assertion Tests (all should pass)")
		  '
		  'unitTests = New AssertFailTests(Me, "Assertion Tests (all should fail)")
		  '
		  '' tests of RB language itself, building up a user-contributed suite of regression tests
		  'unitTests = New ArrayTests(Me, "Array Tests")
		  'unitTests = New VariantTests(Me, "Variant Tests")
		  'unitTests = New XMLTests(Me, "XML Tests")
		  
		End Sub
	#tag EndEvent


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
