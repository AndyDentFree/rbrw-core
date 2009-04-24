#tag Class
Protected Class dataAbstractionTests
Inherits RBUnit.TestFixture
	#tag Event
		Sub SetupFixture()
		  SampleUserClass.FillSampleUsers samples
		  arraySource = new Sample2DUserArray(samples)
		  SampleFinancialData.CreateSampleData
		  dim mas as new rbrwMultiArraySource( _
		  SampleFinancialData.arDates, _
		  SampleFinancialData.arDetails, _
		  SampleFinancialData.arAmounts)
		  
		  mas.setColNames( Array("Date", "Details", "Amount" ) )
		  multiArraySource = mas
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
		  Assert.AreEqual fields.fieldCount, 2
		  
		  dim fieldStrs() as string = fields.listFields
		  Assert.AreEqual  "Surname", fieldStrs(0)
		  Assert.AreEqual  "Rank", fieldStrs(1)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ValuesFrom2DArrayTest()
		  arraySource.iterator.start
		  dim firstSurname as string = arraySource.facade.fieldValue("Surname")
		  dim firstRank as string = arraySource.facade.fieldValue(1)
		  
		  Assert.AreEqual "Abdullah", firstSurname
		  Assert.AreEqual "89", firstRank
		  
		  
		  // test rbrwSource interface which is something we use rarely - returns all fields with tab separator
		  // cast in this test so we use the rbrwSource interface of Sample2DUserArray
		  Assert.AreEqual  "Abdullah"+chr(9)+"89", Sample2DUserArray(arraySource).value  // test value which is all fields tab-separated
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FieldsFromMultiArrayTest()
		  // horizontally - check field iteration
		  dim fields as rbrwFieldFacade = multiArraySource.facade
		  Assert.IsNotNil fields
		  Assert.AreEqual multiArraySource, fields, " in this case, the source is itself the horizontally iterable fields supplier"
		  Assert.AreEqual 3, fields.fieldCount, "3 fields expected"
		  
		  dim fieldStrs() as string = fields.listFields
		  Assert.AreEqual  "Date", fieldStrs(0)
		  Assert.AreEqual  "Details", fieldStrs(1)
		  Assert.AreEqual  "Amount", fieldStrs(2)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub iterateMultiArrayTest()
		  dim iter as rbrwIterableSource = multiArraySource.iterator
		  Assert.AreEqual multiArraySource, iter, " in this case, the source is itself the vertical record iterator"
		  
		  dim accumRecCount as integer
		  iter.start
		  while iter.more
		    accumRecCount = accumRecCount+ 1
		    iter.inc
		  wend
		  
		  Assert.AreEqual accumRecCount, UBound(SampleFinancialData.arDates)+1, "Iterating source encounters as many records as passed in array"
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ValuesFromMulti2DArrayTest()
		  multiArraySource.iterator.start
		  dim firstDate as string = multiArraySource.facade.fieldValue("Date")
		  dim firstDetails as string = multiArraySource.facade.fieldValue(1)
		  dim firstAmt as string = multiArraySource.facade.fieldValue(2)
		  
		  Assert.AreEqual "01/19/2009", firstDate
		  Assert.AreEqual  "INV#103737-1", firstDetails
		  Assert.AreEqual "$652.50", firstAmt
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected arraySource As rbrwDataset
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected samples() As SampleUserClass
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected multiArraySource As rbrwDataset
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
