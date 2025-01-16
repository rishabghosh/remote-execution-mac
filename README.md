# Setting Up and Controlling a Remote MacBook with Keystrokes

This guide explains how to set up and use remote login to control a MacBook via SSH and send keystrokes using an AppleScript.

---

## Step 1: Find Remote Mac Username

1. Open **Terminal** on the remote Mac.
2. Run the following command to get the username:
   ```bash
   whoami
   ```

---

## Step 2: Find Remote Mac Network IP Address

1. Open **System Settings** on the remote Mac.
2. Go to **Network > Wi-Fi** and click on **Details**.
3. Look for the **IP Address** listed under the Wi-Fi details.
    - Note: Reconnecting to the network may result in a new IP address.

---

## Step 3: Enable Remote Login on the Remote Mac

1. Open **System Settings > Sharing** on the remote Mac.
2. Turn on **Remote Login**.
3. Under the **Remote Login** section, you will see a line showing your username and IP address, formatted as:
   ```
   username@ipaddress
   ```
   Make sure it is the same as Step 1 & 2
4. Change the **Allow access for** setting to **All users**.

---

## Step 4: Test SSH Access from the Local Mac

1. Open **Terminal** on your local Mac.
2. Execute the following command:
   ```bash
   ssh username@ipaddress
   ```
   Replace `username` and `ipaddress` with the values from the remote Mac.
3. If prompted:
    - You will see a message:
      ```
      Are you sure you want to continue connecting (yes/no/[fingerprint])?
      ```
      Type `yes` and press Enter.
    - Enter the password of the remote Mac when prompted.
4. If successful, you will see a message like this:
   ```
   Last login: Thu Jan 16 21:11:06 2025 from 192.168.x.x
   ```

---

## Step 5: Prepare the Keystroke Content

1. Copy the content you want to send as keystrokes to the remote Mac.
    - Use **Command + C** to copy the text to your clipboard.

---

## Step 6: Execute the AppleScript

1. Execute the script using the following command in **Terminal** from projects root:
   ```bash
   osascript sendKeyStrokes.applescript
   ```
2. Provide the password for the remote Mac when prompted.

---

## Step 7: Enable Accessibility on the Remote Mac

1. If executing the script for the first time, you may see a popup on the remote Mac.
2. Open **System Settings > Privacy & Security > Accessibility**.
3. Enable access for **sshd-keygen-wrapper**.
4. You may need to execute the `sendKeyStrokes.applescript` script again for it to take effect.

---

## Step 8: Turn Off Remote Login and Accessibility Access (Post-Work)

1. Once you are done with your work, turn off **Remote Login** on the remote Mac:
   - Open **System Settings > Sharing** and disable **Remote Login**.
2. Revoke accessibility access for **sshd-keygen-wrapper**:
   - Open **System Settings > Privacy & Security > Accessibility**.
   - Uncheck **sshd-keygen-wrapper** from the list.

---

## Troubleshooting

- Ensure SSH is properly configured and working.
- Verify that the remote Mac's IP address and username are correct.
- Confirm that **Accessibility** permissions have been granted to `sshd-keygen-wrapper` on the remote Mac.

---

Enjoy sending keystrokes to your remote Mac!

