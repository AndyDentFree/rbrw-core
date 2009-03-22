#tag Class
Protected Class tbrwDatabaseTests
Inherits RBUnit.TestFixture
	#tag Event
		Sub Setup()
		  testDB = new REALSQLDatabase
		  
		  dim appDataFolder as FolderItem =  SpecialFolder.ApplicationData.Child("rbrwUnit")
		  Assert.IsNotNil appDataFolder, "can create FolderItem for Application data folder Child rbrwUnit"
		  if not appDataFolder.Exists then
		    appDataFolder.CreateAsFolder
		  end if
		  testDB.databaseFile = appDataFolder.Child("tbrwDatabaseTests.rsd")
		  // Connect to the database
		  if testDB.databaseFile.exists  then
		    // The database file already exists, so we want to connect to it, presume previous run crashed
		    dim connected as Boolean = testDB.Connect()
		    Assert.IsTrue connected, "Can connect to existing database " + testDB.DatabaseFile.ShellPath
		    Assert.IsFalse testDB.Error, "No error on opening of database"
		    testDB.SQLExecute "DROP TABLE Customers IF EXISTS"
		    Assert.IsFalse testDB.Error, "No error on drop of old database table Customers"
		  else
		    dim created as Boolean = testDB.CreateDatabaseFile
		    Assert.IsTrue created, "Can create database " + testDB.DatabaseFile.ShellPath
		  end if
		  Assert.IsFalse testDB.Error, "No error on creation of database"
		  CreateTestDBTables
		End Sub
	#tag EndEvent

	#tag Event
		Sub TearDown()
		  testDB.Close
		  testDB.DatabaseFile.Delete
		  testDB = nil
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub HasLocalDBTest()
		  // validates that the Setup worked
		  Assert.IsNotNil testDB, "have a test database open"
		  dim expectedTables() as string = Array("Customers")
		  dim tables() as string = testDB.Tables
		  Assert.AreEqual expectedTables, tables, "testDB only contains one table - 'Customers' "
		  dim rs as RecordSet = testDB.SQLSelect("SELECT * FROM Customers")
		  
		  Assert.AreEqual 6, rs.RecordCount
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub CreateTestDBTables()
		  testDB.SQLExecute "create table Customers (ID integer NOT NULL PRIMARY KEY, Name varchar, Balance double) "
		  Assert.IsFalse testDB.Error, "No error on creation of database table Customers"
		  
		  testDB.SQLExecute "INSERT INTO Customers VALUES ('1', 'Dent', '99.3')"
		  testDB.SQLExecute "INSERT INTO Customers VALUES ('2', 'Smith', '9.3')"
		  testDB.SQLExecute "INSERT INTO Customers VALUES ('3', 'Podkarnilov', '12.5')"
		  testDB.SQLExecute "INSERT INTO Customers VALUES ('4', 'Miro', '1.0')"
		  testDB.SQLExecute "INSERT INTO Customers VALUES ('5', 'Beeblerocks', '0.0')"
		  testDB.SQLExecute "INSERT INTO Customers VALUES ('6', 'Jones', '10258')"
		  
		  
		  Assert.IsFalse testDB.Error, "No error on creation of database table Customers"
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CanUseDBasSourceTest()
		  // validate that a RecordSet can be trivially wrapped, as it is by a report
		  dim rs as RecordSet = testDB.SQLSelect("SELECT * FROM Customers ORDER BY Name")
		  dim source as new rbrwRecordSetSource( rs )
		  
		  source.start
		  
		  Assert.AreEqual "5", source.fieldValue(0), "ID matches"
		  Assert.AreEqual "Beeblerocks", source.fieldValue("Name"), "Name matches"
		  Assert.AreEqual "0", source.fieldValue(2), "Balance matches"
		  source.inc
		  Assert.IsTrue source.more, "more than 5 records"
		  
		  Assert.AreEqual "1", source.fieldValue(0), "ID matches"
		  Assert.AreEqual "Dent", source.fieldValue("Name"), "Name matches"
		  Assert.AreEqual "99.3", source.fieldValue(2), "Balance matches"
		  source.inc
		  Assert.IsTrue source.more
		  
		  Assert.AreEqual "6", source.fieldValue(0), "ID matches"
		  Assert.AreEqual "Jones", source.fieldValue("Name"), "Name matches"
		  Assert.AreEqual "10258", source.fieldValue(2), "Balance matches"
		  source.inc
		  Assert.IsTrue source.more
		  
		  Assert.AreEqual "4", source.fieldValue(0), "ID matches"
		  Assert.AreEqual "Miro", source.fieldValue("Name"), "Name matches"
		  Assert.AreEqual "1", source.fieldValue(2), "Balance matches"
		  source.inc
		  Assert.IsTrue source.more
		  
		  Assert.AreEqual "3", source.fieldValue(0), "ID matches"
		  Assert.AreEqual "Podkarnilov", source.fieldValue("Name"), "Name matches"
		  Assert.AreEqual "12.5", source.fieldValue(2), "Balance matches"
		  source.inc
		  Assert.IsTrue source.more
		  
		  Assert.AreEqual "2", source.fieldValue(0), "ID matches"
		  Assert.AreEqual "Smith", source.fieldValue("Name"), "Name matches"
		  Assert.AreEqual "9.3", source.fieldValue(2), "Balance matches"
		  source.inc
		  Assert.IsFalse source.more, "last is 6th record"
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DBFieldsListableTest()
		  // validate that a RecordSet can be trivially wrapped, as it is by a report
		  dim rs as RecordSet = testDB.SQLSelect("SELECT * FROM Customers ORDER BY Name")
		  dim source as new rbrwRecordSetSource( rs )
		  
		  Assert.AreEqual 3, source.Count
		  
		  dim fieldStrs() as string = source.listFields
		  Assert.AreEqual  "ID", fieldStrs(0)
		  Assert.AreEqual  "Name", fieldStrs(1)
		  Assert.AreEqual  "Balance", fieldStrs(2)
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private testDB As REALSQLDatabase
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
