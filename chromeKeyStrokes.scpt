-- Get the text from the clipboard
set theText to the clipboard

-- Define the command to activate Chrome and type the text
set remoteCommand to "osascript -e 'tell application \"Google Chrome\" to activate' -e 'tell application \"System Events\" to keystroke \"" & theText & "\"'"

-- Send the command to Mac B via SSH
do shell script "ssh username@IP_ADDRESS " & quoted form of remoteCommand
