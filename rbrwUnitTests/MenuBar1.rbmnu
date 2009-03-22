#tag Menu
Begin Menu MenuBar1
   Begin MenuItem UntitledMenu1
      SpecialMenu = 1
      Text = ""
      Index = -2147483648
      AutoEnable = True
   End
   Begin MenuItem FileMenu
      SpecialMenu = 0
      Text = "&File"
      Index = -2147483648
      AutoEnable = True
      Begin MenuItem FileOpen
         SpecialMenu = 0
         Text = "Open..."
         Index = -2147483648
         ShortcutKey = "O"
         Shortcut = "Cmd+O"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem FileSave
         SpecialMenu = 0
         Text = "Save"
         Index = -2147483648
         ShortcutKey = "S"
         Shortcut = "Cmd+S"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem FileSaveAs
         SpecialMenu = 0
         Text = "Save As..."
         Index = -2147483648
         ShortcutKey = "S"
         Shortcut = "Cmd+Shift+S"
         MenuModifier = True
         AltMenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem UntitledMenu0
         SpecialMenu = 0
         Text = "-"
         Index = -2147483648
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
         AutoEnable = True
      End
   End
   Begin MenuItem TestMenu
      SpecialMenu = 0
      Text = "Test"
      Index = -2147483648
      AutoEnable = True
      Begin MenuItem TestRunAllTests
         SpecialMenu = 0
         Text = "Run All Tests"
         Index = -2147483648
         ShortcutKey = "R"
         Shortcut = "Cmd+R"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem 
         SpecialMenu = 2
         Text = ""
         Index = -2147483648
         AutoEnable = True
      End
   End
   Begin MenuItem HelpMenu
      SpecialMenu = 0
      Text = "Help"
      Index = -2147483648
      AutoEnable = True
      Begin MenuItem HelpRBUnitHelp
         SpecialMenu = 0
         Text = "RBUnit Help"
         Index = -2147483648
         ShortcutKey = "?"
         Shortcut = "Cmd+?"
         MenuModifier = True
         AutoEnable = True
      End
      Begin AppleMenuItem AppleAboutRBUnit
         SpecialMenu = 0
         Text = "About RBUnit"
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
   Begin MenuItem 
      SpecialMenu = 2
      Text = ""
      Index = -2147483648
      AutoEnable = True
   End
End
#tag EndMenu
