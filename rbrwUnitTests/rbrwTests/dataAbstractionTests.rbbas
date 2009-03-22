#tag Class
Protected Class dataAbstractionTests
Inherits RBUnit.TestFixture
	#tag Event
		Sub SetupFixture()
		  SampleUserClass.FillSampleUsers samples
		  arraySource = new Sample2DUserArray(samples)
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub iterate2DArrayTest()
		  dim iter as rbrwIterableSource = arraySource.iterator
		  Assert.AreEqual arraySource, iter, " in this case, the source is itself the vertical record iterator"
		  
		  dim accumRecCount as integer
		  iter.start
		  while iter.more
		    accumRecCount = accumRecCount+ 1
		    iter.inc
		  wend
		  
		  Assert.AreEqual accumRecCount, UBound(samples)+1, "Iterating source encounters as many records as passed in array"
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FieldsFrom2DArrayTest()
		  // horizontally - check field iteration
		  dim fields as rbrwFieldFacade = arraySource.facade
		  Assert.IsNotNil fields
		  Assert.AreEqual arraySource, fields, " in this case, the source is itself the horizontally iterable fields supplier"
		  Assert.AreEqual fields.count, 2
		  
		  dim fieldStrs() as string = fields.listFields
		  Assert.AreEqual  "Surname", fieldStrs(0)
		  Assert.AreEqual  "Rank", fieldStrs(1)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ValuesFrom2DArrayTest()
		  arraySource.start
		  dim firstSurname as string = arraySource.fieldValue("Surname")
		  dim firstRank as string = arraySource.fieldValue(1)
		  
		  Assert.AreEqual "Abdullah", firstSurname
		  Assert.AreEqual "89", firstRank
		  Assert.AreEqual  "Abdullah"+chr(9)+"89", arraySource.value  // test value which is all fields tab-separated
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected arraySource As Sample2DUserArray
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected samples() As SampleUserClass
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
