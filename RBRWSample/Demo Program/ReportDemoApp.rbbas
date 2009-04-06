#tag Class
Protected Class ReportDemoApp
Inherits Application
	#tag Event
		Sub Open()
		  rbrw.SetupStatics
		  SetupSampleData
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function TestFixedHeaderwithAlignedText() As Boolean Handles TestFixedHeaderwithAlignedText.Action
			PreviewReport ReportFixedHeaderWithAlignedText
			Return True
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function TestSimpleColumnsonelevel() As Boolean Handles TestSimpleColumnsonelevel.Action
			PreviewReport ReportSimpleColumnsOneLevel
			Return True
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function TestSimpleFixedHeader() As Boolean Handles TestSimpleFixedHeader.Action
			PreviewReport ReportSimpleFixedHeader
			Return True
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function TestSingleLineHeader() As Boolean Handles TestSingleLineHeader.Action
			PreviewReport ReportSingleLineHeader
			Return True
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function TestColumnsWithHeaderAndFooter() As Boolean Handles TestColumnsWithHeaderAndFooter.Action
			PreviewReport ReportColumnsOneLevelWithHeaderAndFooter
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function TestQuickbooksstyleStatement() As Boolean Handles TestQuickbooksstyleStatement.Action
			PreviewReport ReportQuickbooksStyleStatement
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ViewQuickbooksStyleStatementDesign() As Boolean Handles ViewQuickbooksStyleStatementDesign.Action
			dim pictDisplay as new ShowImages( rbrwQuickbooksStyleStatementDesign, "Quickbooks report screenshot with overlaid description of corresponding rbrw bands" )
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function PrtTestColumnsWithHeaderAndFooter() As Boolean Handles PrtTestColumnsWithHeaderAndFooter.Action
			JustPrint ReportColumnsOneLevelWithHeaderAndFooter
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function PrtTestFixedHeaderwithAlignedText() As Boolean Handles PrtTestFixedHeaderwithAlignedText.Action
			JustPrint  ReportFixedHeaderWithAlignedText
			Return True
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function PrtTestQuickbooksstyleStatement() As Boolean Handles PrtTestQuickbooksstyleStatement.Action
			JustPrint ReportQuickbooksStyleStatement
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function PrtTestSimpleColumnsonelevel() As Boolean Handles PrtTestSimpleColumnsonelevel.Action
			JustPrint ReportSimpleColumnsOneLevel
			Return True
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function PrtTestSingleLineHeader() As Boolean Handles PrtTestSingleLineHeader.Action
			JustPrint ReportSingleLineHeader
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function PrtTestSimpleFixedHeader() As Boolean Handles PrtTestSimpleFixedHeader.Action
			JustPrint ReportSimpleFixedHeader
			Return True
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function PrtTestSimpleColumnsDB() As Boolean Handles PrtTestSimpleColumnsDB.Action
			JustPrint ReportSimpleColumnsOneLevelDB
			Return True
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function TestSimpleColumnsDB() As Boolean Handles TestSimpleColumnsDB.Action
			PreviewReport ReportSimpleColumnsOneLevelDB
			Return True
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FilePageSetup() As Boolean Handles FilePageSetup.Action
			if commonPrinterSetup is nil then
			rbrwGraphicsPrint.initDefaultPageSetup(commonPrinterSetup)
			end if
			call commonPrinterSetup.PageSetupDialog
			Return True
			
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h0
		Function ReportFixedHeaderWithAlignedText() As rbrwReport
		  ' layout left and right plus different font styles
		  ' doesn't display any data inside the band
		  dim r as new rbrwReport ()
		  AddFancyHeader(r)
		  
		  return r
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ReportSingleLineHeader() As rbrwReport
		  dim r as new rbrwReport
		  r.defaultTextStyle.TextFont = "Courier"
		  r.pageHeaders.Add "This is just a single literal line of text", blockAlignT.alignCenter
		  
		  return r
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ReportSimpleFixedHeader() As rbrwReport
		  ' displays simple concatenation model - strings appended to band
		  dim r as new rbrwReport
		  r.pageHeaders.Add "This is just "  // note the trailing space
		  r.pageHeaders.Add "a single literal line of text "
		  r.pageHeaders.Add "composed by appending multiple items "
		  r.pageHeaders.Add new rbrwLineBand(1.5, points)
		  
		  //r.pageHeaders.StartNewRow
		  ' r.pageHeaders.Add new rbrwTextBlock("Another Line ") .MoveDownAfter  // different way to add lines
		  'r.pageHeaders.Add "and yet another", rbrw.layRight
		  
		  return r
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ReportSimpleColumnsOneLevel() As rbrwReport
		  dim r as new rbrwReport( new Sample2DUserArray(mSampleUsers) )
		  r.body.colSizer.alignment(1) = rbrwColSizer.colAlignT.alignRight
		  return r
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SetupSampleData()
		  SampleUserClass.FillSampleUsers mSampleUsers
		  CreateTestDB
		  SampleFinancialData.CreateSampleData
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ReportColumnsOneLevelWithHeaderAndFooter() As rbrwReport
		  dim r as new rbrwReport( new Sample2DUserArray(mSampleUsers) )
		  AddFancyHeader(r)
		  AddFancyFooter(r)
		  return r
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub AddFancyHeader(r as rbrwReport)
		  dim aBand as new rbrwLayoutBand
		  //aBand.uniqueTextStyle.TextSize = 9
		  dim aStyle as rbrwTextStyle = aBand.uniqueTextStyle
		  aStyle.TextSize = 9
		  aBand.Add "Text on the left"
		  aBand.Add "and the right", blockAlignT.alignRight
		  r.pageHeaders.Add aBand
		  //break
		  r.pageHeaders.startNewRow
		  dim midblock as new rbrwTextBlock(" A centerd line of text followed by a gap & line across page")
		  midblock.uniqueTextStyle.Bold = true
		  midblock.uniqueTextStyle.TextSize = 14
		  r.pageHeaders.Add midblock, blockAlignT.alignCenter
		  r.pageHeaders.Add new rbrwSpaceBand(12, mm)
		  r.pageHeaders.Add new rbrwLineBand(1.5, points)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub AddFancyFooter(r as rbrwReport)
		  r.PageFooters.Add new rbrwSpaceBand(12, mm)
		  r.PageFooters.Add new rbrwLineBand(1.5, points)
		  
		  dim aBand as new rbrwLayoutBand
		  aBand.uniqueTextStyle.TextSize = 12
		  aBand.uniqueTextStyle.Bold = true
		  aBand.uniqueTextStyle.Italic = true
		  aBand.uniqueTextStyle.TextColor = rgbCayenne
		  aBand.Add "One Chunk", blockAlignT.alignTextCenter
		  aBand.blocks.LastBlock.fixedWidth = 180
		  aBand.Add "Second Chunk", blockAlignT.alignTextCenter
		  aBand.blocks.LastBlock.fixedWidth = 180
		  aBand.Add "Third Chunk", blockAlignT.alignTextCenter
		  aBand.blocks.LastBlock.fixedWidth = 180
		  r.PageFooters.Add aBand
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ReportQuickbooksStyleStatement() As rbrwReport
		  ' a complex report similar to that from QuickBooks, see rbrwQuickbooksStyleStatementDesign.png
		  
		  const DESIGN_WIDTH = 540  // points at 72dpi, body width to fit on US 11 with 0.5" margins
		  // conveniently allows for 6 cols of 90 across the bottom
		  CONST AMT_COL_WIDTH = 85
		  CONST COL_SEP_WIDTH = 4
		  
		  dim mas as new rbrwMultiArraySource( _
		  SampleFinancialData.arDates, _
		  SampleFinancialData.arDetails, _
		  SampleFinancialData.arAmounts,  _
		  SampleFinancialData.arBalance)
		  mas.setColNames( Array("Date", "Details", "Amount", "Balance" ) )
		  
		  dim r as new rbrwReport( mas  )
		  r.settings.defaultTextStyle.leading = 2
		  r.settings.colSepWidth = COL_SEP_WIDTH
		  
		  // specify fixed widths for columns because we also align the blocks before and after
		  r.body.colSizer.fixedWidth(0) = AMT_COL_WIDTH - COL_SEP_WIDTH
		  r.body.colSizer.fixedWidth(1) = AMT_COL_WIDTH * 3 - COL_SEP_WIDTH
		  r.body.colSizer.fixedWidth(2) = AMT_COL_WIDTH - COL_SEP_WIDTH
		  r.body.colSizer.fixedWidth(3) = AMT_COL_WIDTH - COL_SEP_WIDTH
		  r.body.colSizer.alignment(0) = rbrwColSizer.colAlignT.alignCenter
		  r.body.colSizer.alignment(2) = rbrwColSizer.colAlignT.alignRight
		  r.body.colSizer.alignment(3) = rbrwColSizer.colAlignT.alignRight
		  r.body.border = true
		  
		  dim bandBorder as rbrwBorder
		  
		  dim aBand as new rbrwLayoutBand
		  
		  // Guff at top of page
		  dim rightblock as new rbrwTextBlock("Statement")
		  rightblock.uniqueTextStyle.Bold = true
		  rightblock.uniqueTextStyle.TextSize = 18
		  aBand.Add rightblock, blockAlignT.alignRight
		  
		  dim logoBlock as new rbrwPictureBlock(sisyphus_sign)
		  logoBlock.fixedWidth = 120
		  aBand.Add  logoBlock, blockAlignT.alignCenter
		  
		  // start address on left so the moveDownAfter is not after the tall Statement
		  aBand.Add  "MockMe Widgets, INC"
		  aBand.startNewRow
		  aBand.Add  "123 Stub Street"
		  aBand.startNewRow
		  aBand.Add  "Fowlerville WI 53999"
		  r.PageHeaders.Add aBand
		  
		  r.pageHeaders.Add new rbrwSpaceBand(20, mm)
		  
		  // Bill to - Customer Details Block
		  aBand = new rbrwLayoutBand
		  aBand.Add "Bill To:"
		  aBand.LastBlock.uniqueTextStyle.Bold = true
		  aBand.blocks.LastBlock.uniqueTextStyle.leading = 4
		  
		  aBand.startNewRow
		  aBand.AddRows Array( _
		  "Bill's Repairs", _
		  "97 Back Alley", _
		  "Fowlerville WI 53999" )
		  // want to somehow indent band here aBand.sett
		  r.PageHeaders.Add aBand
		  aBand.border = true
		  
		  r.pageHeaders.Add new rbrwSpaceBand(20, mm)
		  
		  // fake the aligned financial summary
		  aBand = new rbrwLayoutBand
		  for each s as string in Array("Date", "Amount Due", "Enclosed")
		    aBand.Add s, blockAlignT.alignTextCenter
		    aBand.blocks.LastBlock.fixedWidth = AMT_COL_WIDTH
		    aBand.blocks.LastBlock.uniqueTextStyle.Bold = true
		    aBand.blocks.LastBlock.uniqueTextStyle.leading = 4
		  next
		  aBand.startNewRow
		  // fake total details
		  for each s as string in Array("09/16/08",  "$1,520.00")
		    aBand.Add s, blockAlignT.alignTextCenter
		    aBand.blocks.LastBlock.fixedWidth = AMT_COL_WIDTH
		  next
		  r.PageHeaders.Add aBand
		  bandBorder = new rbrwBorder(1)
		  bandBorder.colSizer = new rbrwColSizer( Array(AMT_COL_WIDTH, AMT_COL_WIDTH, AMT_COL_WIDTH) )
		  aBand.border = bandBorder
		  
		  
		  r.pageHeaders.Add new rbrwSpaceBand(20, mm)
		  
		  
		  // space band to ensure page footer height isn't encroached on by columns
		  r.PageFooters.Add new rbrwSpaceBand(0.5, inches)
		  
		  aBand = new rbrwLayoutBand
		  for each s as string in Array("Current", "1-15", "16-30", "31-60", "61-90", "Over 90")
		    aBand.Add s, blockAlignT.alignTextCenter
		    aBand.blocks.LastBlock.fixedWidth = AMT_COL_WIDTH
		    aBand.blocks.LastBlock.uniqueTextStyle.Bold = true
		    aBand.blocks.LastBlock.uniqueTextStyle.leading = 4
		  next
		  aBand.startNewRow
		  // fake array of formatted numbers
		  for each s as string in Array("$7.00", "$17,890.11", "$1,290.45", "$0.00", "$0.00", "$0.00")
		    aBand.Add s, blockAlignT.alignTextCenter
		    aBand.blocks.LastBlock.fixedWidth = AMT_COL_WIDTH
		  next
		  r.PageFooters.Add aBand
		  bandBorder = new rbrwBorder(1)
		  bandBorder.colSizer = new rbrwColSizer( Array(AMT_COL_WIDTH, AMT_COL_WIDTH, AMT_COL_WIDTH, AMT_COL_WIDTH, AMT_COL_WIDTH, AMT_COL_WIDTH) )
		  aBand.border = bandBorder
		  
		  r.PageFooters.Add new rbrwSpaceBand(5, mm)
		  aBand = new rbrwLayoutBand
		  aBand.Add new rbrwPageNoBlock("Page ", "   ")
		  r.PageFooters.Add aBand
		  
		  return r
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub JustPrint(r as rbrwReport)
		  rbrwGraphicsPrint.PrintReport r, commonPrinterSetup
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub PreviewReport(r as rbrwReport)
		  dim w as new rbrwPreviewWindow(r)
		  w.Show
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub CreateTestDB()
		  testDB = new REALSQLDatabase
		  
		  dim appDataFolder as FolderItem =  SpecialFolder.ApplicationData.Child("rbrwDemoApp")
		  if not appDataFolder.Exists then
		    appDataFolder.CreateAsFolder
		  end if
		  testDB.databaseFile = appDataFolder.Child("rbrwDemoApp.rsd")
		  // Connect to the database
		  if testDB.databaseFile.exists  then
		    // The database file already exists, so we want to connect to it, presume previous run crashed
		    dim connected as Boolean = testDB.Connect()
		    testDB.SQLExecute "DROP TABLE users"  // MYSQL Syntax  "DROP TABLE users IF EXISTS"
		    assert not testDB.Error, "DELETING OLD test database table: " + testDB.ErrorMessage
		  else
		    dim created as Boolean = testDB.CreateDatabaseFile
		  end if
		  // mimic the SampleUsers class
		  testDB.SQLExecute "create table users (Surname varchar, Othername varchar, Rank integer) "
		  assert not testDB.Error, "Creating test database table: " + testDB.ErrorMessage
		  
		  testDB.SQLExecute "INSERT INTO users VALUES ('Abdullah', 'Jennifer', '89')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Alarcon', 'Steven', '127')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Albers', 'Joy', '149')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Amador', 'Willie', '31')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Amick', 'Gertrude', '32')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Andre', 'Sheri', '77')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Argento', 'Carmella', '26')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Atwell', 'Molly', '118')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Bach', 'Patrick', '96')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Bainbridge', 'Jeanie', '3')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Beane', 'Harold', '66')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Beaumont', 'Penny', '69')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Beeman', 'Antonio', '133')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Bergstrom', 'Jill', '132')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Birdwell', 'Carlos', '101')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Blanks', 'Kevin', '56')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Borges', 'Candice', '157')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Botello', 'Bruce', '151')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Bourassa', 'Rosa', '175')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Bretz', 'Lula', '67')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Cagle', 'Jeffery', '92')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Carder', 'Jimmy', '120')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Chadwell', 'Rodney', '39')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Chartrand', 'Roslyn', '10')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Colwell', 'Earl', '173')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Cooke', 'Samuel', '164')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Cornish', 'Bonnie', '156')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Coronado', 'Jose', '139')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Crowder', 'Todd', '148')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Damiano', 'James', '91')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Dehaven', 'Jacob', '119')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Derry', 'Rodney', '155')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Deville', 'Daisy', '47')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Dick', 'Carlos', '142')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Dobbin', 'Dona', '28')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Doxey', 'Karina', '22')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Dufrene', 'Blanche', '42')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Dunne', 'Randy', '83')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Eicher', 'Julie', '48')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Emanuel', 'Naomi', '70')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Everhart', 'Mike', '74')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Fagundes', 'Neva', '16')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Favor', 'Tia', '25')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Fike', 'Jerry', '137')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Fleury', 'Samuel', '59')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Fowlkes', 'Candice', '110')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Fred', 'Medeiros',  88)"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Freshour', 'Clinton', '11')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Frick', 'Alan', '68')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Fruge', 'Clinton', '24')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Fusco', 'Sonya', '103')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Garron', 'Louisa', '30')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Garry', 'Paul', '38')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Gayman', 'Kelly', '23')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Giguere', 'Gary', '79')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Glasser', 'Herman', '63')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Goodale', 'Theresa', '176')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Grimes', 'Beulah', '41')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Grogan', 'Heidi', '125')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Grover', 'Teresa', '135')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Guerin', 'Rosa', '146')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Hagerty', 'Raymond', '104')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Hardcastle', 'Pearl', '112')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Harjo', 'Lance', '21')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Hatch', 'Hazel', '82')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Hauck', 'Albert', '64')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Hayward', 'Jessica', '107')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Herzog', 'Rachel', '34')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Hetrick', 'Vincent', '94')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Hiatt', 'Randy', '87')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Hisle', 'Max', '5')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Hoelscher', 'Tamara', '115')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Hume', 'Steve', '75')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Huss', 'Antonio', '35')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Hylton', 'Sean', '117')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Irby', 'Marvin', '141')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Jeffery', 'Eiland', '58')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Jeffries', 'Brenda', '143')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Jordan', 'Helen', '99')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Kendrick', 'Brandi', '55')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Kilburn', 'Marian', '172')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Killough', 'Sarah', '36')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Kitchens', 'Kay', '95')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Klenk', 'Margery', '17')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Kline', 'Mike', '163')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Kurtz', 'Charles', '53')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Kyle', 'Marie', '122')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Lair', 'Carrie', '170')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Legrand', 'Clarence', '126')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Lepore', 'Sandra', '106')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Leverett', 'Terri', '60')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Lex', 'Max', '7')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Lovelady', 'Marjorie', '71')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Macomber', 'Dale', '109')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Madison', 'Ada', '140')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Mahle', 'Cody', '1')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Malinowski', 'Elsie', '43')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Manwaring', 'Hugh', '19')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Manzo', 'Marian', '76')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Marlin', 'Shelly', '160')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Mathewson', 'Pam', '72')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Mcmichael', 'Pat', '166')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Meisel', 'Alejandra', '9')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Menjivar', 'Ashlee', '29')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Michaud', 'Jeremy', '168')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Miele', 'Ernest', '49')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Million', 'Rosemary', '169')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Mize', 'John', '78')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Moorehead', 'Juan', '57')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Moreno', 'Laura', '46')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Naughton', 'Danny', '44')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Nicely', 'Allen', '121')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Noland', 'Lynda', '50')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Nowlin', 'Raymond', '150')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Oda', 'Elnora', '20')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Ogletree', 'Kristen', '134')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Oldenburg', 'Benita', '2')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Omara', 'Joe', '45')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Owens', 'Joann', '154')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Pedigo', 'Tammy', '102')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Peek', 'Vicki', '93')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Penrod', 'Amber', '84')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Prieto', 'Cheryl', '138')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Quirk', 'Edna', '62')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Quiroz', 'Monique', '113')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Radtke', 'Wendy', '131')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Reading', 'Iris', '100')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Rendon', 'Victor', '130')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Rossi', 'Billy', '51')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Roundy', 'Danny', '124')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Runion', 'Gladys', '98')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Saechao', 'Clinton', '8')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Scheffler', 'Patrick', '40')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Schott', 'Steven', '108')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Scott', 'Dunn', '147')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Scoville', 'Adam', '128')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Scruggs', 'Travis', '114')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Seaton', 'Manuel', '86')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Sedillo', 'Nathan', '116')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Segura', 'Howard', '111')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Shealey', 'Ted', '27')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Sheehan', 'Stephen', '162')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Shull', 'Andrew', '129')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Simpler', 'Sharron', '15')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Singer', 'Michael', '145')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Smith', 'Alan', '179')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Smith', 'Bryan', '178')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Smith', 'John', '177')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Snyder', 'Claire', '85')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Soucy', 'Johnny', '161')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Spinelli', 'Randy', '167')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Stamm', 'Wendy', '90')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Steven', 'Lillie', '152')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Stillman', 'Stephen', '136')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Stong', 'Maricela', '6')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Strohm', 'Hugh', '12')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Struck', 'Victor', '37')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Stuart', 'Peter', '174')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Sturgill', 'Katrina', '73')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Tannenbaum', 'Christian', '4')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Thatcher', 'Anita', '52')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Thurber', 'Alison', '158')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('True', 'Suzanne', '171')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Truman', 'Fred', '144')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Turk', 'Michele', '61')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Ulmer', 'Rebecca', '153')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Urbina', 'Joyce', '105')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Vachon', 'Simon', '80')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Valdez', 'Juanita', '81')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Villegas', 'Nathan', '165')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Vosburgh', 'Jami', '14')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Waddell', 'Curtis', '33')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Wenzel', 'Frank', '54')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Westerfield', 'Tara', '159')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Winder', 'Brandon', '65')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Wyche', 'Vince', '97')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Wydra', 'Tammy', '13')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Zamora', 'Lucy', '123')"
		  testDB.SQLExecute "INSERT INTO users VALUES ('Zona', 'Pearlie', '18')"
		  
		  assert not testDB.Error, "FILLING test database table: " + testDB.ErrorMessage
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ReportSimpleColumnsOneLevelDB() As rbrwReport
		  dim rs as RecordSet = testDB.SQLSelect("SELECT * FROM users ORDER BY Surname")
		  assert not testDB.Error, "Searching test database for report contents: " + testDB.ErrorMessage
		  
		  dim r as new rbrwReport( new rbrwRecordSetSource(rs) )
		  return r
		End Function
	#tag EndMethod


	#tag Note, Name = About
		
		
		
		Contains methods to create the demo reports
	#tag EndNote


	#tag Property, Flags = &h1
		Protected mSampleUsers() As SampleUserClass
	#tag EndProperty

	#tag Property, Flags = &h21
		Private testDB As REALSQLDatabase
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected commonPrinterSetup As PrinterSetup
	#tag EndProperty


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
