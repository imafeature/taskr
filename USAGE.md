#How to Manually Create the Taskr Service
*Note that you can simply downlaod the release files and copy them to your services folder*

First, make sure you meet all the requirements
---
To my knowledge, this just means your machine is running OS X. 


Next, set up the service and prepare Outlook
---
1. Copy the code in the file taskr-start.applescript
2. Launch automator
3. When prompted, click to create a new service
4. In the "Service receives" dropdown menu above the empty space to the right of the screen, choose "no input"
5. In the "in" dropbdown menu beside it, select "Microsoft Outlook"
6. Drag the action "Run AppleScrpt" from the middle column to the empty space beneath the dropdown menus in steps 4 and 5
7. Paste the copied code and make any desired modifications to the generated reply
8. Save your service and close the window
9. Repeat steps 1 - 8, this time with code copied from taskr-stop.applescript
10. From the apple menu, select System Preferences, and here, select Keyboard
11. In the first column, select Services, then locate the Taskr services in the second
12. Assign your desired shortcuts (I use Alt+Shift+T and Alt+Shift+D)
13. Open Outlook and create a folder named "Processing...", a folder named "Needs Attention", and a folder named Completed
14. Rejoice, for you have just finished manually setting up Taskr. Go try it out using your shortcut keys.
