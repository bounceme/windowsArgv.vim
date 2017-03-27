# windowsArgv.vim

Untested!

Creates `CommandLineToArgvW()` which takes one string representing a parseable command, according to https://msdn.microsoft.com/en-us/library/17w5ykft. And, to create a cmd.exe compatible command, call `ArgvQuote()` with the returned array from `CommandLineToArgvW()`.
