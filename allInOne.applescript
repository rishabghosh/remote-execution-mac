-- Define file path and remote details
set filePath to "./answers.txt" -- Adjust the path to the location of answers.txt
set remoteUser to "username" -- Replace with the remote MacBook username
set remoteHost to "IP_ADDRESS" -- Replace with the remote MacBook IP address
set remoteCommand to "osascript -e 'tell application \"Google Chrome\" to activate' -e 'tell application \"System Events\" to keystroke \"" -- End of the command to send to remote

-- Read the content of the file
set fileRef to open for access POSIX file filePath
set fileContent to read fileRef
close access fileRef

-- Escape special characters for AppleScript
set fileContent to my escapeAppleScriptChars(fileContent)

-- Combine the command
set fullCommand to remoteCommand & fileContent & "\"'"

-- Send the command via SSH
do shell script "ssh " & remoteUser & "@" & remoteHost & " " & quoted form of fullCommand

-- AppleScript handler to escape special characters for AppleScript
on escapeAppleScriptChars(theText)
    set theText to my replaceText("\"", "\\\"", theText)
    set theText to my replaceText("\r", "\\r", theText)
    set theText to my replaceText("\n", "\\n", theText)
    set theText to my replaceText("\t", "\\t", theText)
    return theText
end escapeAppleScriptChars

-- Replace text helper
on replaceText(findText, replaceText, subjectText)
    set AppleScript's text item delimiters to findText
    set subjectTextItems to text items of subjectText
    set AppleScript's text item delimiters to replaceText
    set subjectText to subjectTextItems as text
    set AppleScript's text item delimiters to {""}
    return subjectText
end replaceText
