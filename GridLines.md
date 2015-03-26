# Introduction #

border lines are a type of adorner. There's a general mechanism for attaching code to bands which will be drawn before or after the content (eg: you would typically draw light shading before drawing text on top but might want a coloured border to appear in front).

So the simple way to add gridlines is to add an rbrwBorderAdorner
eg:
aReport.body.adorners.append new rbrwBorderAdorner( rbrwBorderAdorner.BorderCode.oneThin )

where the `oneThin` constant indicates the kind of border pattern