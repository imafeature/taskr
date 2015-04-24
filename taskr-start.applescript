tell application "Microsoft Outlook"
	(*
	--this block stores the folders we'll be using in variables
	--along with the new task for easy manipulation
	*)
	set tasksItem to selection
	set tasksProcessor to first mail folder whose name is "Processing..."
	set tbdFolder to first mail folder whose name is "Needs Attention"
	
	(*--this verifies that there's a task and then processes it*)
	if tasksItem is not equal to {} then
		set newTask to first item of tasksItem
		move of newTask to tasksProcessor
		set todo flag of newTask to not completed
	else
		return result
	end if
	
	(*
	--these are variables generating the header info for the 
	--status updates that will be sent as a reply to the initial
	--email assigning the task
	*)
	set taskOwner to sender of newTask
	set taskOwnerName to name of taskOwner
	set prevTIDs to AppleScript's text item delimiters
	set AppleScript's text item delimiters to " "
	set taskOwnerFirstName to first text item of taskOwnerName
	set AppleScript's text item delimiters to prevTIDs
	set taskSubj to subject of newTask
	set taskOnSubj to "Re: " & taskSubj as text
	
	(*--these are variables generating the body of the email*)
	set taskOnSalut to "<p>Hi " & taskOwnerFirstName & ":</p>"
	copy content of signature named "Taskr Read Receipt" to taskOnMsgBody
	
	(*--this inserts the salutation after the opening HTML tags*)
	set prevTIDs to AppleScript's text item delimiters
	set AppleScript's text item delimiters to "<head></head><body style=\"word-wrap: break-word; -webkit-nbsp-mode: space; -webkit-line-break: after-white-space; color: rgb(0, 0, 0); font-size: 14px; font-family: Calibri, sans-serif;\"><div style=\"font-family: Calibri; font-size: medium;\"><span style=\"font-size: 15px;\">"
	set temp to every text item of taskOnMsgBody
	set AppleScript's text item delimiters to "<head></head><body style=\"word-wrap: break-word; -webkit-nbsp-mode: space; -webkit-line-break: after-white-space; color: rgb(0, 0, 0); font-size: 14px; font-family: Calibri, sans-serif;\"><div style=\"font-family: Calibri; font-size: medium;\"><span style=\"font-size: 15px;\">" & taskOnSalut
	set taskOnMsg to temp as string
	set AppleScript's text item delimiters to prevTIDs
	
	set taskOnNotification to reply to newTask without opening window
	copy taskOnMsg to content of taskOnNotification
	
	send taskOnNotification
	
	set is read of newTask to false
	move newTask to tbdFolder
	
end tell
