# Introduction #
rbrw is primarily a code-oriented report-writer although a graphical editor is forthcoming, as a commercial project. The API is designed to make it easy to define reports with sensible default layout but to delve deeper for precise control where you need.

You can define a default report and print a database result with as little as three lines of code:
```
dim rs as RecordSet = testDB.SQLSelect("SELECT * FROM users ORDER BY Surname")
dim r as new rbrwReport( new rbrwRecordSetSource(rs) )  // body drawn from a record set
rbrwGraphicsPrint.PrintReport r
```

You can also compose a rich report with formatting and columns like [this example](http://www.aussiedesignedsoftware.com/files/rbrw/rbrwSampleQuickbooksStyleStatement.pdf) which is included in the main sample `ReportTester.`

rbrw uses an almost identical model and API to the  C++ OOFILE Report-writer http://www.oofile.com.au/reportwriter.html ported to idiomatic REALbasic and with the dependency on the OOFILE database ORM replaced by a more abstract data source.

One family of objects is used to define a report and a parallel tree does the rendering. eg: `rbrwTextBlock` is rendered to a REALbasic `Graphics` object by an `rbrwTextBlock_GraphicsRender.`

This allows for families of rendering objects to be added to target other backends - a new PDF renderer is under development and the RTF and HTML renderers already in OOFILE are being ported.

# Report Model #

rbrw provides a banding report model.

The bands stretch across the entire report page horizontally.

Bands can be fixed-height. Fixed-height bands must be used for page headers and footers.

Page headers and footers contain an array of fixed-height bands so you can compose a complex layout using them. The basic positioning model of these bands is based on the FileMaker Pro model - you just append chunks and they render as continuous blocks across the page. More complex positioning including centering and right-alignment is also possible.

The body of the report is optional - a report with no body is a single page report and you can just compose a lot of bands into the header to create an arbitrary page layout.

If a body is specified, it is an instance of rbrwIterableTreeBand which allows for breaking over pages. A body is specified by passing a data source into the report constructor. You can't change the body of the report once built - just use another `rbrwReport` object.

The _tree_ part of the name comes from the concept that if you regard the main body band as the top of the tree, it has its own headers and footers which can in turn branch out with more headers and footers. Thus, an arbitrarily deep tree can be constructed.

# Sample Projects #
rbrw has two projects that you can use to see how classes are used.

`rbrwUnitTests` is currently mainly for regression testing but also useful to illustrate the data source abstractions with the test classes `rbrwDatabaseTests,` `rbrwXMLSourceTests` and `dataAbstractionTests.`

`ReportTester` provides a range of simple sample methods that create reports, some of which are just headers and footers. These are all in methods of `ReportDemoApp.` It also demonstrates one of the benefits of building reports using code - you can easily have chunks of reusable code to assemble different reports.

# Data Sources #

The most common data sources you will use for the body of a columnar report are `rbrwMultiArraySource` and `rbrwRecordSetSource.` If you use web services or have other XML documents, you can also report directly from them using `rbrwXMLSource.`

The `rbrwMultiArraySource` caters for the common case when you have a number of parallel arrays of different data types, composed elsewhere in your code.
```
dim mas as new rbrwMultiArraySource( _
SampleFinancialData.arDates, _
SampleFinancialData.arDetails, _
SampleFinancialData.arAmounts,  _
SampleFinancialData.arBalance)
mas.SetColNames( Array("Date", "Details", "Amount", "Balance" ) )
```

As shown earlier, the `rbrwRecordSetSource` simply takes a `RecordSet` from any RB database and works out its column names and default layout accordingly.

`rbrwXMLSource` takes a number of XPath expressions, at its simplest it is a path to the root element and just the names of the children you want reporting, eg:
```
venuesDoc = new XmlDocument
venuesDoc.LoadXml TestVenues
dim source as new rbrwXMLSource( venuesDoc, "//venue" , Array("id", "name") ) 
```
to report against a typical piece of XML returned from a RESTful web service:
```
 <?xml version="1.0" encoding="UTF-8"?>
<venues type="array">
  <venue>
    <created-at type="datetime">2009-07-02T19:30:27Z</created-at>
    <id type="integer">1</id>
    <name>The Pabst Theater</name>
    <updated-at type="datetime">2009-07-02T19:30:27Z</updated-at>
  </venue>
  <venue>
    <created-at type="datetime">2009-07-02T19:30:37Z</created-at>
    <id type="integer">2</id>
    <name>Turner Hall</name>
    <updated-at type="datetime">2009-07-02T19:30:37Z</updated-at>
  </venue>
...
</venues>
```

It is also very easy to create your own data sources - see the `Sample2DUserArray` in the `ReportTester` application for an example. This would be used if you had an array of your own classes which you want to report directly.

# Layout #
Apart from the common use of columns in the body, most layout of the report is done using a `rbrwLayoutBand` which is logically composed of a series of blocks in rows. You explicitly call `startNewRow` to start blocks adding again from the left of the row, unless alignment is specified.

Shortcut methods allow you to just pass in an array of strings for multiple rows and text with embedded linefeeds similarly creates multiple rows.

eg from `ReportDemoApp.ReportQuickbooksStyleStatement` a layout band is used to compose a visual block:

![http://rbrw-core.googlecode.com/svn/wiki/Tutorial.attach/ComposedLayout-BillsRepairs.png](http://rbrw-core.googlecode.com/svn/wiki/Tutorial.attach/ComposedLayout-BillsRepairs.png)
```
// Bill to - Customer Details Block
aBand = new rbrwLayoutBand
aBand.Add "Bill To:"
aBand.LastBlock.UniqueTextStyle.Bold = true
aBand.Blocks.LastBlock.UniqueTextStyle.leading = 4
  
aBand.StartNewRow
aBand.AddRows Array( _
  "Bill's Repairs", _
  "97 Back Alley", _
  "Fowlerville WI 53999" ) 
```

## Vertical Layout ##
The individual bands of a report are composed at runtime to work out their positions - no band knows anything about an absolute position on a page and a common idiom is to use a space band to break up blocks of layout bands. If you want a clear vertical margin below the headers or above the footers, ending or starting the footers with a space band is an easy way to specify this, with your choice of units:
```
  r.PageHeaders.Add new rbrwSpaceBand(20, mm)
  // last band of headers
  r.PageFooters.Add new rbrwSpaceBand(0.5, inches)
```

# Goodies - Reusable bits of Code #
These are things which might be useful bits of code by themselves, they make no assumptions about being used in the report-writer:
  * `scn` class for working with arbitrary precision coordinates in inches, mm, cm or points
  * the data abstraction layer - you can use `rbrwRecordSetSource` and associated classes for your own abstract data iteration - eg: as the basis for an abstract mapping to controls.

# Gotchas #
The `scn` subsystem used for scaled number operations requires initialising, resulting in an assertion "ensure `scnStatics.SetupStatics` has been called" if it has not been invoked. Currently, this is done by adding a call to `rbrw.SetupStatics` early, say in your `App.Open` event