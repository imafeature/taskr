# TASKR
The Applescript behind an OS X service for Outlook 2011 (my first Applescript and my first repo!)

See the appropriate RELEASE_NOTES-v* file for change logs and high-priority issues with the release. 
For usage instructions and requirements, see the aptly-named USAGE file. 

What is it?
-------
Taskr is a pair of scripts run via Apple’s OS X’s services feature. With a single click, Taskr-On flags a selected message in Outlook, as a task, moves it to a Needs Attention folder, and alerts the sender that said e-mail has been received and will be addressed in due course. When the task detailed in the e-mail has been completed, Taskr-Off marks the task as complete, moves it to a Completed folder, and alerts the original sender that the task has been completed and is ready for review if applicable.

Sooo... A read-receipt?
-------
Not quite. Outlook’s read receipts can be requested by a sender at the time of sending, but a receipt cannot be sent uninvited. Taskr is meant to improve communication in environments with a high-volume of e-mail communication while reducing the amount of time actually spent writing those messages.

Documentation
-------
Currently, due to the short length of the code, the limited amount of time currently invested in it (thus far, ~2.5 hours), and the fact that I’ve only just been exposed to best practices, documentation is limited to the code’s comments. Fret not: I am not at all familiar with Applescript so the code is heavily commented so I could keep track of what I was writing. You should be fine. If need be, I will convert these to proper documentation during a later release.

Support
-------
Yours or mine?

It doesn’t matter! If you need help, feel free to message me. I probably won’t know the answer, but I’ll do my best to find it. I love collaborative learning! As it happens, I love instruction-based learning, too, so if you want to offer help, that’s totally great! I’m open to suggestions and feedback. <!--Just send your question/comment to support@imagineknowing.me.-->

Licensing 
-------
This section is included only because all the templates had it. The script is free to use and modify for personal and commercial use, but I’d love a shout out or whatever. It would make me feel warm and fuzzy inside.  

Author
-------
The author of Taskr is one Parker McDade, a web design turned software programming student* . Contact info is as follows:
    Git: imafeature
    Web: imagine-knowing.me/Parker
    LinkedIn **: /l2xMcDade


* If you’re reading this after Spring 2016 and there’s no evidence that I’ve killed myself, remind me to update this.
** What can I say? A girl’s gotta eat.
