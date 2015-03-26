# From the outside #

By default, the topmost level of columnar bands has bold headers drawn above its columns. These are drawn from the field names if not overridden.

The setting controlling the nesting level of drawing these headers is a report setting in rbrwSettings (so is inherited from rbrwDefaultSettings)

**drawHeadingsDownToLevel** starting at 1.

# Implementation #
Detailed scrappy notes as I'm porting:

rbrwTreeBand\_GraphicsRender.drawColumnHeaders is called by draw and DrawContinuingOverPage if they haven't been drawn yet on this page, checking the property mDrawnColHeadersThisPage.

The code in drawColumnHeaders is very similar to draw but uses the member mColHeaders instead of a locally created rbrwSizedTextArray.

mColHeaders is initialised by rbrwTreeBand\_GraphicsRender.CalcColHeaderWrapping invoked by rbrwTreeBand\_GraphicsRender.startTableBody