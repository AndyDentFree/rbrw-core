Without getting into testing actual rendering (yet), I've included a small unit test suite for things where possible. The intent is to make that suite as comprehensive as feasible, all the way to ultimately testing graphical rendering and comparing with saved snapshots as a regression test. That should pickup any effects from future REALbasic drawing code changes.

The main tests at present are for string wrapping and meauring, the graphics abstraction including scaling and, most importantly, the data abstraction layer. rbrwDatabaseTests creates a small local REALSQLDatabase and tests iteratng through it as would a report.

The project `rbrwUnitTests/rbrwUnitTests.rbvcp` includes a copy of [Paul Lefebvre's RBUnit](http://code.google.com/p/rbunit/).