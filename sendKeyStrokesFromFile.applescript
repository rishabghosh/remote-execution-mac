-- Path to the file
set filePath to (path to desktop as text) & "answers.txt"

-- Convert AppleScript path to POSIX path
set posixFilePath to POSIX path of (filePath as alias)

-- Check if the file exists using shell command
set fileExists to (do shell script "test -e " & quoted form of posixFilePath & " && echo yes || echo no") is "yes"

-- If the file exists, attempt to read it
if fileExists then
  try
  -- Read the content from the file
    set fileContent to (read POSIX file posixFilePath as «class utf8»)

    -- Notify that the file is accessible and content was read
    display dialog "File exists and was successfully read."

    -- Type out each character
    repeat with i from 1 to length of fileContent
      set theChar to character i of fileContent
      tell application "System Events"
        keystroke theChar
      end tell
      delay 0.05 -- Adjust the delay to simulate typing speed
    end repeat
  on error errMsg
  -- Display an error message if reading fails
    display dialog "Error reading the file: " & errMsg
  end try
else
-- Notify if the file does not exist
  display dialog "File does not exist or cannot be accessed at path: " & posixFilePath
end if
