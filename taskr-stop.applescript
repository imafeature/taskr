tell application "Microsoft Outlook"
	(*
	--this block stores the folders we'll be using in variables
	--along with the completed task for easy manipulation
	*)
	set completedItem to selection
	set tasksProcessor to first mail folder whose name is "Processing..."
	set cFolder to first mail folder whose name is "Completed"
	
	(*--this verifies that there's a task and then processes it*)
	if completedItem is not equal to {} then
		set cTask to first item of completedItem
		move cTask to tasksProcessor
		set todo flag of cTask to completed
	else
		return result
	end if
	
	(*
	--these are variables generating the header info for the 
	--status updates that will be sent as a reply to the initial
	--email assigning the task
	*)
	set taskOwner to sender of cTask
	set taskOwnerName to name of taskOwner
	set prevTIDs to AppleScript's text item delimiters
	set AppleScript's text item delimiters to " "
	set taskOwnerFirstName to first text item of taskOwnerName
	set AppleScript's text item delimiters to prevTIDs
	set taskSubj to subject of cTask
	set taskOffSubj to "Re: " & taskSubj & " (Automated Notification of Completion)" as text
	
	(*--these are variables generating the body of the email*)
	set taskOffSalut to "<p>Hi " & taskOwnerFirstName & ":</p>"
	copy content of signature named "Taskr Completion Notification" to taskOffMsgBody
	
	(*--this inserts the salutation after the opening HTML tags*)
	set prevTIDs to AppleScript's text item delimiters
	set AppleScript's text item delimiters to "<head></head><body style=\"word-wrap: break-word; -webkit-nbsp-mode: space; -webkit-line-break: after-white-space; color: rgb(0, 0, 0); font-size: 14px; font-family: Calibri, sans-serif;\"><div style=\"font-size: medium; font-family: Calibri;\"><span style=\"font-size: 15px;\">"
	set temp to every text item of taskOffMsgBody
	set AppleScript's text item delimiters to "<head></head><body style=\"word-wrap: break-word; -webkit-nbsp-mode: space; -webkit-line-break: after-white-space; color: rgb(0, 0, 0); font-size: 14px; font-family: Calibri, sans-serif;\"><div style=\"font-size: medium; font-family: Calibri;\"><span style=\"font-size: 15px;\">" & taskOffSalut
	set taskOffMsg to temp as string
	set AppleScript's text item delimiters to prevTIDs
	
	(*--this prepares the actual e-mail*)
	set taskOffNotification to reply to cTask without opening window
	copy taskOffMsg to content of taskOffNotification
	copy taskOffSubj to subject of taskOffNotification
	
	(*--and this sends it*)
	send taskOffNotification
	
	(*--this final line of code moves the message to the completed folder*)
	move cTask to cFolder
	
end tell
