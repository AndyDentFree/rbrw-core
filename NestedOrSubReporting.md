## The OOFILE Data Context ##
Here's a complete example that comes from the standalone OOFILE report code to produce a nested report with two tables, as seen in [PDF](http://www.oofile.com.au/reportsamples/pdf/ComplexReport.pdf).
```
oofRep*
CSampleBase::DoPerformanceOnCurricItems()
{
// for each student, nested view band with their progress in a sub-table
// without breaking to new page 
	oofRep* ret = new oofRep;
	
	mData->Students->setSortOrder(mData->Students->LastName);
	mData->Students->start();

	//Report Body
	dbView StudentsView (mData->Students, false);
	StudentsView << mData->Students->LastName << mData->Students->Note;	
	oofRepViewBand* theBody = new oofRepViewBand(StudentsView, false);
	
	// nested table
	dbView ProgressView (mData->Students->Progress, false);
	ProgressView  << mData->Students->Progress->CurricItems->Name 
				  << mData->Students->Progress->LastRecorded 
				  << mData->Students->Progress->LevelAchieved;
				  
	ProgressView.colSizer()->setAlignment(0, oofColSizer::alignLeft);	// force numeric ID to align left					 				
	ProgressView.setHeading(0,"Curriculum ID");	// change numeric title			 				
	ProgressView.setHeading(1,"Subject");				 				
	oofRepViewBand* subBody = new oofRepViewBand(ProgressView, true /* draw boxed*/);
	subBody->footers() 
		<< new oofRepLineBand(8) 
		<< new oofRepSpaceBand(40);  // nice big gap
	
	theBody->footerBreaks() << new oofRepBreakEveryRecord(subBody);


	ret->body(theBody);
	return ret;
}
```

## Issues in Translating to rbrw ##
The OOFILE data model provides a natural top-down relationship traversal where relationships are another form of field.

The data model shown above has three tables
  * `Students`
  * `Progress` - individual class records owned by a given Student
  * `CurricItems` - lookup table for the names of curriculum items

To be able to create a true nested report, I need to extend `rbrwDataSet` to provide a similar feature.

That design has been completed. It is being informed by the _Active Record_ pattern as implemented in Ruby on Rails, being a modern example of tackling similar issues.