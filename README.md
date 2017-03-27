# windowsArgv.vim

Untested!

Creates `WinQuote()` which takes one string arg representing a parseable command, according to https://msdn.microsoft.com/en-us/library/17w5ykft (as far as I can tell). In theory, you can just `join()` the result and give it to `system()`.
