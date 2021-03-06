--
--  AppDelegate.applescript
--  iTunesTagEditor
--
--  Created by ats on 2014/08/02.
--  Copyright (c) 2014îN ay65535. All rights reserved.
--

script AppDelegate
	property parent : class "NSObject"
	
	-- IBOutlets
	property theWindow : missing value
	property txtName : missing value
	property txtArtist : missing value
	property txtAlbum : missing value
	property theSelection : missing value
	
	on btnOKClicked:sender
		--display alert "Hello there " & txtName
		display alert "Hello there " & (stringValue() of txtName)
		--txtName's setStringValue:theName
	end btnOKClicked:
	
	on btnNextClicked:sender
		tell application "iTunes"
			set theTrack to item 2 of theSelection
			txtName's setStringValue:(name of theTrack)
			txtArtist's setStringValue:(artist of theTrack)
			txtAlbum's setStringValue:(album of theTrack)
			display alert "theSelection: " & (name of theTrack)
		end tell
	end btnNextClicked:
	
	on applicationWillFinishLaunching:aNotification
		-- Insert code here to initialize your application before any files are opened
		tell application "iTunes"
			set theSelection to selection
			--repeat with theTrack in theSelection
			--	set aName to name of theTrack
			--end repeat
			set theTrack to first item of theSelection
			txtName's setStringValue:(name of theTrack)
			txtArtist's setStringValue:(artist of theTrack)
			txtAlbum's setStringValue:(album of theTrack)
		end tell
	end applicationWillFinishLaunching:
	
	on applicationShouldTerminate:sender
		-- Insert code here to do any housekeeping before your application quits
		return current application's NSTerminateNow
	end applicationShouldTerminate:
	
end script