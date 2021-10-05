highlight clear
if exists("syntax_on")
  syntax reset
endif

set background=dark

function!  GuiFor(group, ...)
  let histring = 'hi ' . a:group . ' '

  if strlen(a:1)
    let histring .= 'guibg=' . a:1 . ' '
  endif

  if strlen(a:2)
    let histring .= 'guifg=' . a:2 . ' '
  endif

  if a:0 >= 3 && strlen(a:3)
    let histring .= 'gui=' . a:3 . ' '
  endif

  execute histring
endfunction

call GuiFor('Normal', '#030B29', '#F0E7DF')
call GuiFor('ColorColumn', '#0f1736', '#F0E7DF')
call GuiFor('Todo', '#311501', '#795439')
call GuiFor('Comment', 'NONE', '#577A67')
call GuiFor('Statement', 'NONE', '#F88C24')
call GuiFor('Identifier', 'NONE', '#F0E7DF')
call GuiFor('Function', 'NONE', '#1890CC')
call GuiFor('Constant', 'NONE', '#30B8F2')
call GuiFor('String', 'NONE', '#5922C0')
call GuiFor('PreProc', 'NONE', '#D54D23')
call GuiFor('Operator', 'NONE', '#FD501B')
call GuiFor('rustQuestionMark', 'NONR', '#FD501B')
call GuiFor('Special', 'NONE', '#EBD126')
call GuiFor('MatchParen', 'NONE', '#24EB37')
call GuiFor('NvimInternalError', '#FF0000', '#FFFFFF')
call GuiFor('Error', 'NONE', '#F12F2F')
call GuiFor('WarningMsg', 'NONE', '#F4D048')
call GuiFor('Type', 'NONE', '#8264E2')
call GuiFor('Visual', '#89775C', 'NONE')
call GuiFor('LineNr', 'NONE', '#202847')
call GuiFor('CursorLineNr', 'NONE', '#202847')
call GuiFor('Pmenu', '#030B29', '#F0E7DF')
call GuiFor('PmenuSel', '#0f1736', '#69749B')
call GuiFor('PmenuSbar', '#0f1736', '#69749B')
call GuiFor('PmenuThumb', '#0f1736', '#69749B')
call GuiFor('TabLineFill', '#030B29', '#F0E7DF')
call GuiFor('TabLine', '#39436A', '#13162B')
call GuiFor('CursorColumn', '#24293D', 'NONE')
call GuiFor('CursorLine', '#24293D', 'NONE')
call GuiFor('DiffAdd', 'NONE', '#27EC36')
call GuiFor('DiffChange', 'NONE', '#F3BD39')
call GuiFor('DiffDelete', 'NONE', '#F36839')
call GuiFor('ToggleRustErr', 'NONE', '#F03737')
call GuiFor('ToggleRustWarn', 'NONE', '#EDA528')
call GuiFor('rustSelf', 'NONE', '#9B24AC')
