# windowsArgv.vim

Experimental!

**in vim you should `:set shellxescape=` **

Creates `CommandLineToArgvW()` which takes one string representing a parseable command, according to https://msdn.microsoft.com/en-us/library/17w5ykft. And, to create a `cmd.exe` compatible command, call `Cmdexe()`, though keep in mind the metacharacters `(, ), %, !, ^, ", <, >, &, and |` should be escaped ( with `^` ) to be literal.
