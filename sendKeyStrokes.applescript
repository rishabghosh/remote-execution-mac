-- Define remote details
set remoteUser to "username" -- Replace with the remote MacBook username
set remoteHost to "IP_ADDRESS" -- Replace with the remote MacBook IP address

-- Get the text from the clipboard
set theText to the clipboard

-- Escape double quotes in the clipboard text
set escapedText to my escapeDoubleQuotes(theText)

-- Define the remote command to execute
set remoteCommand to "osascript -e 'tell application \"System Events\" to repeat with i from 1 to length of \"" & escapedText & "\"' -e 'keystroke character i of \"" & escapedText & "\"' -e 'delay 0.1' -e 'end repeat'"

-- Send the command via SSH
do shell script "ssh " & remoteUser & "@" & remoteHost & " " & quoted form of remoteCommand

-- Helper function to escape double quotes
on escapeDoubleQuotes(theString)
  set AppleScript's text item delimiters to "\""
  set theString to text items of theString
  set AppleScript's text item delimiters to "\\\""
  set theString to theString as text
  set AppleScript's text item delimiters to {""}
  return theString
end escapeDoubleQuotes
