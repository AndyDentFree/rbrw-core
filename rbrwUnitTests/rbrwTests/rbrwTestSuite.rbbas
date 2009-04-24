#tag Class
Protected Class rbrwTestSuite
Inherits RBUnit.TestController
	#tag Event
		Sub StartTestFixtures()
		  Dim unitTests As RBUnit.TestFixture
		  // put new test suites at the top so most visible
		  unitTests = new rbrwDatabaseTests(self, "Test local database data sources access")
		  unitTests = new rbrwStringTests(self, "string utility tests for core utilities used in rbrw")
		  unitTests = new rbrwWrappingTests(self, "Text wrapping tests for columnar word-wrapping")
		  unitTests = New rbrwMeasureTests(self, "Measuring Tests")
		  unitTests = new rbrwGraphicsEnvTests(self, "Shared Graphics Environment Tests")
		  unitTests = new dataAbstractionTests(self, "Test sample data sources and abstractions")
		  
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
			InitialValue="2147483648"
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
