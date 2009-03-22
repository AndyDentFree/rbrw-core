#tag Module
Protected Module DatabaseUtils
	#tag Method, Flags = &h0
		Function Tables(extends db as Database) As string()
		  dim rs as RecordSet
		  if db isa MySQLDatabase then
		    rs = db.SQLSelect("SHOW TABLES")
		  elseif db isa REALSQLDatabase then
		    rs = db.SQLSelect("SELECT name FROM sqlite_master WHERE type='table' ORDER BY name")
		  end if
		  if rs is nil then
		    dim ret() as string
		    return ret
		  end if
		  return rs.asStringArray
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AsStringArray(extends rs as RecordSet) As string()
		  dim ret() as string
		  dim lastFieldIx as integer = rs.FieldCount 
		  // tempting to rs.MoveFirst but that actually clears the EOF condition on empty sets
		  while not rs.EOF
		    for i as integer = 1 to lastFieldIx  // snarl, fields are 1-indexed
		      ret.Append rs.IdxField(i)
		    next i
		    rs.MoveNext
		  wend
		  return ret
		End Function
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
End Module
#tag EndModule
