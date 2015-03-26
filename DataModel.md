I just wanted to jot down a few quick thoughts about the decisions that went into the abstraction of data fed into a report, which might help clarify it for anyone looking at the project.

The core data model for an OOFILE and thus rbrw report is a tree, hanging off a top-level iterable data view.

This provides the content the main columnar band from which nested bands are triggered.

In OOFILE, a dbView provides _vertical_ iteration through records and _horizontal_ iteration through a set of fields.

In rbrw, these concepts are split into the interfaces rbrwIterableSource for vertical and rbrwFieldFacade for horizontal.

For convenience, there's another interface rbrwFieldFacadeWithIterator which can provide both. Quite often you will have a single class providing the complete data operations, as seen in rbrwRecordSetSource and rbrwMultiArraySource.

## Implications of the rbrwFieldFacade. ##

An idea I've not had time to implement yet is the trivial use of a decorator pattern with the FieldFacade. You could attach calculated columns to a class which forwards _real_ fields to the original FieldFacade that it wraps but adds a couple of calculated columns. These would contain calculations across the row, or an accumulator, and could be expressed in terms of the existing fields.

As a clean Decorator pattern, this could be extended in several layers. eg: one FieldFacade might wrap some financial transactions and add a horizontal sum of a Debit and Credit column. Another could wrap the resulting set of fields and be adding a running balance column.