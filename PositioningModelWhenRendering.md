Regardless of the type of renderer, we have access to currentReport.currentVerticalPos which a renderer is expected to increment as it goes down the page.

## Graphics Renderers ##
An RB Graphics renderer such as rbrwTreeBand\_GraphicsRender has access to rbrwCurrentDraw.moveTo to specify the rendering position - following the Windows convention which we're porting, you can pass in a point argument and get back the position.

This is only ever supposed to be used temporarily, eg: when rendering adjacent lines bordering a cell. A renderer is not obliged to maintain rbrwCurrentDraw.sX and sY - it mimics the _MoveTo then Draw_ approach of Windows and old-fashioned Mac drawing primitives.

The coordinates maintained in rbrwCurrentDraw and rbrwReport.currentVerticalPos are 72dpi points. Only at the last possible minute is rbrwCurrentDraw supposed to scale any given coordinates, within its Draw or Fill methods which shadow the Graphics class.