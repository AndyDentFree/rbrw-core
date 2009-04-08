These classes come from Andy Dent's rbrw, a port of his C++ cross-platform OOFILE report-writer.

The main open-source project rbrw-core is hosted at http://code.google.com/p/rbrw-core/
under the Mozilla Public License 1.1 which allows unrestricted use including commercial.

See http://www.aussiedesignedsoftware.com/ for more details on any commercial releases.

User documentation on the Wiki http://code.google.com/p/rbrw-core/w/list

Philosophically, this report-writer is driven by program code rather than requiring visual layout.
This approach scales well to producing hundreds of related reports. The XML-based report serialisation
will also make it easy to make graphical layout engines of varying complexity. Some of these may be
offered as commercial products.

Unlike SQL-oriented report-writers, from the start it has a concept of abstract data sources allowing 
you to supply data in:
- a 2D array
- parallel 1D arrays
- RecordSet objects
- user-defined classes implementing two simple interfaces for vertical and horizontal iteration 

There are samples and unit tests for all the above.

Note to anyone looking at the source code, whilst it may appear a very big product, much of this 
is *necessary* complexity. The original product, and where this is heading, renders to graphic
environments as well as RTF, HTML and plain text. It started as idiomatic C++ making heavy use of 
multiple-inheritance.

---------
2009/04/08 Version 0.8
I decided to arbitrarily do a release so people can start playing with it 
as the in-house use has proved robust for reports of hundreds of pages and I could do 
with more eyeballs and feedback. 

The core ability to create a report with an arbitrary data source is doing nicely with
page and band headers and footers.
