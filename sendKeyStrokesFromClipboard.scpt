-- Get the text from the clipboard
set theText to the clipboard

-- Type out each character
repeat with i from 1 to length of theText
    set theChar to character i of theText
    tell application "System Events"
        keystroke theChar
    end tell
    delay 0.01 -- Adjust the delay to simulate typing speed
end repeat
