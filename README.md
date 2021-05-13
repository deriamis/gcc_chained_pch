# gcc_chained_pch

Caveats: This is not a supported way of doing PCH chaining in GCC. There
are many reasons why it may not work for you. However, if your include
structure is relatively simple and you're not doing some tricky macro
defines outside of the include structure to enable/disable features, it
should work just fine.

GCC bug showing what you're getting yourself into:
  https://gcc.gnu.org/bugzilla/show_bug.cgi?id=54050
PPH, or the GCC Project That Would Have Fixed It But Died, Part One Million:
  https://gcc.gnu.org/wiki/pph
