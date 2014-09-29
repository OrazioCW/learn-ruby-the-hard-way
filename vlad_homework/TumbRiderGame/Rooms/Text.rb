module Text
	
	@text = []
	text.push("You enter a dark Tomb full of traps.")
	text.push("In front of you is tree steps corridor leading to a door.")
	text.push("Which way you take those steps?")
	text.push("There is a mummy here.")
	text.push("The mummy has sward.")
	text.push("This mummy guard another door.")
	text.push("How are you going to enter that door?")
	text.push("Which way you take those steps?")
	text.push("Which way you take those steps?")
	text.push("Which way you take those steps?")
	text.push("Which way you take those steps?")
	text.push("Which way you take those steps?")
	text.push("Which way you take those steps?")
	
	def Text.dialog(i) 
		puts text[i]
	end
	
end
