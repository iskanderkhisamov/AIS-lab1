format PE CONSOLE 4.0
entry start

include '%fasminc%\win32a.inc'

section ".code" code readable writeable executable 

        hello db "Hello, world!",0

start:
        cinvoke printf, hello

        call [getch]

        push 0
        call [ExitProcess]

section '.idata' import data readable writeable

  library kernel32,'kernel32.dll',\
           msvcrt,'msvcrt.dll'

  import kernel32,\
          ExitProcess,'ExitProcess'

  import msvcrt,\
          printf,  'printf',\
          getch,   '_getch'

