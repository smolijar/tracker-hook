# VHS documentation
# See: https://github.com/charmbracelet/vhs

Output examples/demo.gif

Require echo

Set Shell "bash"
Set FontSize 32
Set Width 1200
Set Height 600
Set PlaybackSpeed 0.8

Hide
Type "git checkout master" Enter
Type "echo foo > demo && git add demo && clear" Enter
Show

Type "git checkout -b feat/kitty-42"
Sleep 1s
Enter
Sleep 1s


Type "git commit"
Sleep 2s
Enter
Sleep 1s

Type "i🎉 Issue reference from branch already in trailers!"
Enter
Sleep 1.5s

Escape
Sleep 1s

Down
Right 10
Sleep 0.5s

Down 4
Right 13
Sleep 2s

Type ":cq"
Enter

Hide
Type "git checkout master" Enter
Type "git branch -d feat/kitty-42" Enter
Type "git reset demo; rm demo;" Enter
Show
