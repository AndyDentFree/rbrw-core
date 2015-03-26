One initial need for the report-writer was to emulate a Quickbooks Financial Statement. This image below is the design brief from the client, which requires the basic report features be achieved of;
  * Multi-line page headers with content aligned left and right
  * Layout bands formatted with boxing of content
  * Background shading of cells in layout bands
  * Centre alignment of cells in layout bands
  * Overall right-alignment (or faking it) of a bounded table in a layout band
  * Background Shading of headings on a columnar band
  * Centre alignment of headings on a Columnar band
  * Right alignment of content in some columns
  * Bounding box and dividing lines drawn on columns
  * Breaks on data changes

It did **not** require significant features from OOFILE:
  * Picture or graph content
  * Color
  * Wrapped, multi-line text content
  * Custom item drawers (unless used to implement some of the shading above)
  * Styled text rendering

Nor did it require nested related data so I haven't yet added that to the data abstraction.

![http://rbrw-core.googlecode.com/svn/trunk/rbrw/rbrwQuickbooksStyleStatementDesign.png](http://rbrw-core.googlecode.com/svn/trunk/rbrw/rbrwQuickbooksStyleStatementDesign.png)