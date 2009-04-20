#tag Menu
Begin Menu ExampleMenuBar
   Begin MenuItem FileMenu
      SpecialMenu = 0
      Text = "&File"
      Index = -2147483648
      AutoEnable = True
      Begin MenuItem FileClose
         SpecialMenu = 0
         Text = "Close"
         Index = -2147483648
         ShortcutKey = "W"
         Shortcut = "Cmd+W"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem UntitledSeparator
         SpecialMenu = 0
         Text = "-"
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem FilePageSetup
         SpecialMenu = 0
         Text = "Page Setup..."
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem FilePrint
         SpecialMenu = 0
         Text = "Print..."
         Index = -2147483648
         ShortcutKey = "P"
         Shortcut = "Cmd+P"
         MenuModifier = True
         AutoEnable = True
      End
      Begin QuitMenuItem FileQuit
         SpecialMenu = 0
         Text = "Quit"
         Index = -2147483648
         ShortcutKey = "Q"
         Shortcut = "Cmd+Q"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem 
         SpecialMenu = 2
         Text = ""
         Index = -2147483648
         AutoEnable = False
      End
   End
   Begin MenuItem EditMenu
      SpecialMenu = 0
      Text = "&Edit"
      Index = -2147483648
      AutoEnable = True
      Begin MenuItem EditUndo
         SpecialMenu = 0
         Text = "&Undo"
         Index = -2147483648
         ShortcutKey = "Z"
         Shortcut = "Cmd+Z"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem UntitledMenu2
         SpecialMenu = 0
         Text = "-"
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem EditCut
         SpecialMenu = 0
         Text = "Cu&t"
         Index = -2147483648
         ShortcutKey = "X"
         Shortcut = "Cmd+X"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem EditCopy
         SpecialMenu = 0
         Text = "&Copy"
         Index = -2147483648
         ShortcutKey = "C"
         Shortcut = "Cmd+C"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem EditPaste
         SpecialMenu = 0
         Text = "&Paste"
         Index = -2147483648
         ShortcutKey = "V"
         Shortcut = "Cmd+V"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem EditClear
         SpecialMenu = 0
         Text = "Clear"
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem 
         SpecialMenu = 2
         Text = ""
         Index = -2147483648
         AutoEnable = True
      End
   End
   Begin MenuItem UntitledMenu3
      SpecialMenu = 1
      Text = ""
      Index = -2147483648
      AutoEnable = True
   End
   Begin MenuItem PreviewMenu
      SpecialMenu = 0
      Text = "Preview"
      Index = -2147483648
      AutoEnable = True
      Begin MenuItem TestSingleLineHeader
         SpecialMenu = 0
         Text = "Single Line Header"
         Index = -2147483648
         ShortcutKey = "1"
         Shortcut = "Cmd+1"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem TestSimpleFixedHeader
         SpecialMenu = 0
         Text = "Simple Fixed Header"
         Index = -2147483648
         ShortcutKey = "2"
         Shortcut = "Cmd+2"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem TestFixedHeaderwithAlignedText
         SpecialMenu = 0
         Text = "Multi-line Header with Aligned Text"
         Index = -2147483648
         ShortcutKey = "3"
         Shortcut = "Cmd+3"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem TestFixedHeaderwithArbitraryPositioning
         SpecialMenu = 0
         Text = "Fixed Header with Layout, Pic"
         Index = -2147483648
         ShortcutKey = "4"
         Shortcut = "Cmd+4"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem TestSimpleColumnsonelevel
         SpecialMenu = 0
         Text = "Simple Columns, one level"
         Index = -2147483648
         ShortcutKey = "5"
         Shortcut = "Cmd+5"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem TestSimpleColumnsDB
         SpecialMenu = 0
         Text = "Simple Columns, from Database"
         Index = -2147483648
         ShortcutKey = "6"
         Shortcut = "Cmd+6"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem TestColumnsWithHeaderAndFooter
         SpecialMenu = 0
         Text = "Columns with Header and Footer"
         Index = -2147483648
         ShortcutKey = "7"
         Shortcut = "Cmd+7"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem TestQuickbooksstyleStatement
         SpecialMenu = 0
         Text = "Quickbooks-style Statement"
         Index = -2147483648
         ShortcutKey = "8"
         Shortcut = "Cmd+8"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem UntitledMenu0
         SpecialMenu = 0
         Text = "-"
         Index = -2147483648
         AutoEnable = False
      End
      Begin MenuItem TestMixedStyledText
         SpecialMenu = 0
         Text = "Mixed Styled Text"
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem TestSnakingColumns
         SpecialMenu = 0
         Text = "Snaking Columns"
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem TestTwolevelGrouping
         SpecialMenu = 0
         Text = "Two-level Grouping"
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem 
         SpecialMenu = 2
         Text = ""
         Index = -2147483648
         AutoEnable = True
      End
      Begin AppleMenuItem 
         SpecialMenu = 2
         Text = ""
         Index = -2147483648
         AutoEnable = True
      End
   End
   Begin MenuItem PrintMenu
      SpecialMenu = 0
      Text = "Print"
      Index = -2147483648
      AutoEnable = True
      Begin MenuItem PrtTestSingleLineHeader
         SpecialMenu = 0
         Text = "Single Line Header"
         Index = -2147483648
         ShortcutKey = "1"
         Shortcut = "Cmd+Shift+Alt+1"
         MenuModifier = True
         AltMenuModifier = True
         PCAltKey = True
         AutoEnable = True
      End
      Begin MenuItem PrtTestSimpleFixedHeader
         SpecialMenu = 0
         Text = "Simple Fixed Header"
         Index = -2147483648
         ShortcutKey = "2"
         Shortcut = "Cmd+Shift+Alt+2"
         MenuModifier = True
         AltMenuModifier = True
         PCAltKey = True
         AutoEnable = True
      End
      Begin MenuItem PrtTestFixedHeaderwithAlignedText
         SpecialMenu = 0
         Text = "Multi-line Header with Aligned Text"
         Index = -2147483648
         ShortcutKey = "3"
         Shortcut = "Cmd+Shift+Alt+3"
         MenuModifier = True
         AltMenuModifier = True
         PCAltKey = True
         AutoEnable = True
      End
      Begin MenuItem PrtTestFixedHeaderwithArbitraryPositioning
         SpecialMenu = 0
         Text = "Fixed Header with Layout, Pic"
         Index = -2147483648
         ShortcutKey = "4"
         Shortcut = "Cmd+Shift+Alt+4"
         MenuModifier = True
         AltMenuModifier = True
         PCAltKey = True
         AutoEnable = True
      End
      Begin MenuItem PrtTestSimpleColumnsonelevel
         SpecialMenu = 0
         Text = "Simple Columns, one level"
         Index = -2147483648
         ShortcutKey = "5"
         Shortcut = "Cmd+Shift+Alt+5"
         MenuModifier = True
         AltMenuModifier = True
         PCAltKey = True
         AutoEnable = True
      End
      Begin MenuItem PrtTestSimpleColumnsDB
         SpecialMenu = 0
         Text = "Simple Columns, from Database"
         Index = -2147483648
         ShortcutKey = "6"
         Shortcut = "Cmd+Shift+Alt+6"
         MenuModifier = True
         AltMenuModifier = True
         PCAltKey = True
         AutoEnable = True
      End
      Begin MenuItem PrtTestColumnsWithHeaderAndFooter
         SpecialMenu = 0
         Text = "Columns with Header and Footer"
         Index = -2147483648
         ShortcutKey = "7"
         Shortcut = "Cmd+Shift+Alt+7"
         MenuModifier = True
         AltMenuModifier = True
         PCAltKey = True
         AutoEnable = True
      End
      Begin MenuItem PrtTestQuickbooksstyleStatement
         SpecialMenu = 0
         Text = "Quickbooks-style Statement"
         Index = -2147483648
         ShortcutKey = "8"
         Shortcut = "Cmd+Shift+Alt+8"
         MenuModifier = True
         AltMenuModifier = True
         PCAltKey = True
         AutoEnable = True
      End
      Begin MenuItem 
         SpecialMenu = 2
         Text = ""
         Index = -2147483648
         AutoEnable = True
      End
      Begin AppleMenuItem 
         SpecialMenu = 2
         Text = ""
         Index = -2147483648
         AutoEnable = True
      End
   End
   Begin MenuItem 
      SpecialMenu = 2
      Text = ""
      Index = -2147483648
      AutoEnable = False
   End
   Begin MenuItem ViewMenu
      SpecialMenu = 0
      Text = "View"
      Index = -2147483648
      AutoEnable = True
      Begin MenuItem ViewQuickbooksStyleStatementDesign
         SpecialMenu = 0
         Text = "Quickbooks-Style Statement Design"
         Index = -2147483648
         AutoEnable = True
      End
   End
   Begin MenuItem HelpMenu
      SpecialMenu = 0
      Text = "Help"
      Index = -2147483648
      AutoEnable = True
      Begin MenuItem HelpReportTesterHelp
         SpecialMenu = 0
         Text = "ReportTester Help"
         Index = -2147483648
         AutoEnable = True
      End
   End
End
#tag EndMenu
