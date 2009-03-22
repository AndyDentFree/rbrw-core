#tag Class
Protected Class rbrwStringTests
Inherits RBUnit.TestFixture
	#tag Method, Flags = &h0
		Sub isspaceUsingStringsTest()
		  dim testStr as string = "Andy Dent" + EndOfLine + "is here, Kilroy"
		  Assert.IsFalse isspace( testStr.Mid(0,1) )
		  Assert.IsTrue isspace( testStr.Mid(5,1) )
		  Assert.IsTrue isspace( testStr.Mid(10,1) )
		  
		  dim tabbed as string = "A" + chr(9) + "tab to here"
		  Assert.IsTrue isspace( tabbed.Mid(2,1) )
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub isspaceUsingAscTest()
		  Assert.IsTrue isspace( &h09 )
		  Assert.IsTrue isspace( &h20 )
		  Assert.IsTrue isspace( &h0A )
		  Assert.IsTrue isspace( &h0B )
		  Assert.IsTrue isspace( &h0C )
		  Assert.IsTrue isspace( &h0D )
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub trailingWordsTest()
		  dim lastChar1B, nextWordStartZB as integer
		  
		  // test that zero-based
		  // trailing spaces just cut off
		  lastChar1B = rbrwTextSizer.TruncateTrailingWord("Andy  ", nextWordStartZB)
		  Assert.AreEqual 4, lastChar1B, "last char of word detected when ends in spaces"
		  Assert.AreEqual 0, nextWordStartZB, "next word returns 0 because ended in spaces"
		  
		  
		  // handle empty strings
		  lastChar1B = rbrwTextSizer.TruncateTrailingWord("", nextWordStartZB)
		  Assert.AreEqual -1, lastChar1B, "empty string returns -1 as last word index"
		  Assert.AreEqual 0, nextWordStartZB, "next word returns zero because empty string"
		  
		  
		  // handle no-space strings
		  lastChar1B = rbrwTextSizer.TruncateTrailingWord("bog", nextWordStartZB)
		  Assert.AreEqual 2, lastChar1B, "string with no partial word returns last char as last char in string"   // weird as it seems, original code had this bug in it where if no truncation, returned 0-based value
		  Assert.AreEqual 3, nextWordStartZB, "next word presumed to be following this text"
		  
		  
		  // handle typical cut-off word (last word with no leading spaces is assumed to be cut-off)
		  lastChar1B = rbrwTextSizer.TruncateTrailingWord("big bog    on", nextWordStartZB)
		  Assert.AreEqual 7, lastChar1B, "two valid words at end of string skipped over"
		  Assert.AreEqual 11, nextWordStartZB, "next word detected "
		  
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
