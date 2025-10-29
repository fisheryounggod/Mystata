clear
use http://www.ats.ucla.edu/stat/stata/notes/hsb2

* show summarize command
summarize

* a long graph command with wide       space in the comment
* and a very long command
* Notice we start with "grss" so this graph will show up in the .htm file
grss graph twoway (scatter read write, ylabel(0 5 to 100) xlabel(10 20 to 90) ) (lfit read write,  ylabel(0 5 to 100) xlabel(10 20 to 90))

** this is
** two comments
** and commands spanning over multiple lines
** Notice we start with "grss" so this graph will show up in the .htm file
grss scatter ///
  read ///
  write ///
  math

* a short comment
* A comment on the describe command that really goes on way too long and really is very wide and long
describe

* and now we make a scatterplot
* but we forgot the "grss" prefix, so this does NOT show up in the
* web page
scatter science socst

** a comment on tab starting with two stars
tab ses

