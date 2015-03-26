## Background ##
OOFILE started life as a two-pass Mac report-writer which recorded pictures of each page then rendered them on a preview window or to print. Saving a compact form of each rendered page makes it trivial to jump around the preview and an accurate page count is necessary to be able to draw headers or footers like _Page 1 of 3._

When implementing the first Windows version, back on Windows 95, we used Metafiles but they were so buggy under NT Workstation 4 that we had to write our own substitute. Like a Mac PICT, we compose a page as a series of recorded opcodes from the initial report rendering pass.

The _Drawing Element_ was born - oofDE and rbrwDE.

## The Abstract and Graphics Hierarchy ##

  * rbrwDrawingElement
    * rbrwPicDE
    * rbrwPositionedDE
      * rbrwSizedDE
        * rbrwGraphicsRectDE
        * rbrwGraphicsLineDE
        * rbrwGraphicsShadeDE
      * rbrwTextDE
        * rbrwGraphicsTextDE
    * rbrwTextStyleDE
      * rbrwGraphicsTextStyleDE

The drawing elements starting with rbrwGraphics are the ones used to draw to a REALbasic Graphics object for preview or printing. They are collected together into an rbrwPage.

Drawing elements are produced by a render class such as rbrwTextBlock\_GraphicsRender


## Scaling ##
Scaling is done at the last possible minute in rbrwCurrentDraw. This abstraction maintains an X, Y state for drawing elements and also serves as a proxy for a Graphics instance. Drawing through rbrwCurrentDraw instead of directly to a graphics class allows the rest of rbrw to continue to work in a 72dpi world.

rbrwCurrentDraw.ScalingFactor is a property which allows you to change the scaling factor from the default 1.0. Typically it is set by classes such as rbrwGraphicsPrint.PrintReport changing it to match the printer resolution.