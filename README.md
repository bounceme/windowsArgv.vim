# windowsArgv.vim

Untested!

Creates `CommandLineToArgvW()` which takes one string representing a parseable command, according to https://msdn.microsoft.com/en-us/library/17w5ykft. And, to create a `cmd.exe /c` compatible command, call `ArgvQuote()`, though keep in mind the metacharacters `(, ), %, !, ^, ", <, >, &, and |` should be escaped ( with `^` ) to be literal.
