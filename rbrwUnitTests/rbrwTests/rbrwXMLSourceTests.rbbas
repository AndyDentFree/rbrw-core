#tag Class
Protected Class rbrwXMLSourceTests
Inherits RBUnit.TestFixture
	#tag Event
		Sub Setup()
		  venuesDoc = new XmlDocument
		  venuesDoc.LoadXml TestVenues
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub HasXMLLoadedTest()
		  // validates that the Setup worked
		  Assert.IsNotNil venuesDoc, "have a test XML Document open"
		  dim root as XmlElement = venuesDoc.DocumentElement
		  Assert.AreEqual root.Name, "venues"
		  Assert.AreEqual root.Child(0).Name, "venue"
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub XMLFieldsListableForSimplePathTest()
		  // validate that an XML document can be trivially wrapped, as it is by a report
		  // should be able to see all "fields" for a given root
		  dim source as new rbrwXMLSource( venuesDoc, "//venue" )
		  
		  Assert.AreEqual 4, source.fieldCount
		  
		  dim fieldStrs() as string = source.listFields
		  Assert.AreEqual  "created-at", fieldStrs(0)
		  Assert.AreEqual  "id", fieldStrs(1)
		  Assert.AreEqual  "name", fieldStrs(2)
		  Assert.AreEqual  "updated-at", fieldStrs(3)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub XMLFieldsListableTest()
		  // validate that an XML document can be trivially wrapped, as it is by a report
		  // should be able to see all "fields" for a given root
		  dim source as new rbrwXMLSource( venuesDoc, "//venue" , Array("id", "name") )  // restricted elements by name
		  
		  Assert.AreEqual 2, source.fieldCount
		  
		  dim fieldStrs() as string = source.listFields
		  Assert.AreEqual  "id", fieldStrs(0)
		  Assert.AreEqual  "name", fieldStrs(1)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub XMLReadAllWithinPathTest()
		  // validate that an XML document can be trivially wrapped, as it is by a report
		  // the sample TestVenues contains 3 venue elements
		  dim source as new rbrwXMLSource( venuesDoc, "//venue" )
		  
		  source.start
		  
		  Assert.AreEqual "2009-07-02T19:30:27Z", source.fieldValue(0), "created-at matches"
		  Assert.AreEqual "1", source.fieldValue(1), "ID matches"
		  Assert.AreEqual "The Pabst Theater", source.fieldValue("name"), "Name matches"
		  Assert.AreEqual "2009-07-02T19:30:27Z", source.fieldValue(3), "updated-at matches"
		  source.inc
		  Assert.IsTrue source.more, "more than 1 records"
		  
		  Assert.AreEqual "2009-07-02T19:30:37Z", source.fieldValue(0), "created-at matches"
		  Assert.AreEqual "2", source.fieldValue(1), "ID matches"
		  Assert.AreEqual "Turner Hall", source.fieldValue("name"), "Name matches"
		  Assert.AreEqual "2009-07-02T19:30:37Z", source.fieldValue(3), "updated-at matches"
		  source.inc
		  Assert.IsTrue source.more, "more than 2 records"
		  
		  Assert.AreEqual "2009-07-02T19:30:48Z", source.fieldValue(0), "created-at matches"
		  Assert.AreEqual "3", source.fieldValue(1), "ID matches"
		  Assert.AreEqual "The Riverside", source.fieldValue(2), "Name matches"
		  Assert.AreEqual "2009-07-02T19:30:48Z", source.fieldValue(3), "updated-at matches"
		  source.inc
		  Assert.IsFalse source.more, "only 3 records"
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub XMLReadKnownColsWithinPathTest()
		  // validate that an XML document can be trivially wrapped, as it is by a report
		  // the sample TestVenues contains 3 venue elements
		  dim source as new rbrwXMLSource( venuesDoc, "//venue" , Array("id", "name") )  // restricted elements by name
		  
		  source.start
		  
		  Assert.AreEqual "1", source.fieldValue(0), "ID matches"
		  Assert.AreEqual "The Pabst Theater", source.fieldValue("name"), "Name matches"
		  source.inc
		  Assert.IsTrue source.more, "more than 1 records"
		  
		  Assert.AreEqual "2", source.fieldValue(0), "ID matches"
		  Assert.AreEqual "Turner Hall", source.fieldValue("name"), "Name matches"
		  source.inc
		  Assert.IsTrue source.more, "more than 2 records"
		  
		  Assert.AreEqual "3", source.fieldValue(0), "ID matches"
		  Assert.AreEqual "The Riverside", source.fieldValue(1), "Name matches"
		  source.inc
		  Assert.IsFalse source.more, "only 3 records"
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected venuesDoc As XmlDocument
	#tag EndProperty


	#tag Constant, Name = TestVenues, Type = String, Dynamic = False, Default = \" <\?xml version\x3D\"1.0\" encoding\x3D\"UTF-8\"\?>\r<venues type\x3D\"array\">\r  <venue>\r    <created-at type\x3D\"datetime\">2009-07-02T19:30:27Z</created-at>\r    <id type\x3D\"integer\">1</id>\r    <name>The Pabst Theater</name>\r    <updated-at type\x3D\"datetime\">2009-07-02T19:30:27Z</updated-at>\r  </venue>\r  <venue>\r    <created-at type\x3D\"datetime\">2009-07-02T19:30:37Z</created-at>\r    <id type\x3D\"integer\">2</id>\r    <name>Turner Hall</name>\r    <updated-at type\x3D\"datetime\">2009-07-02T19:30:37Z</updated-at>\r  </venue>\r  <venue>\r    <created-at type\x3D\"datetime\">2009-07-02T19:30:48Z</created-at>\r    <id type\x3D\"integer\">3</id>\r    <name>The Riverside</name>\r    <updated-at type\x3D\"datetime\">2009-07-02T19:30:48Z</updated-at>\r  </venue>\r</venues>", Scope = Public
	#tag EndConstant


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
