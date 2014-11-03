require "./Rooms/Room2.rb"
require "./Rooms/Dead.rb"
require "./Rooms/Text.rb"
module Room1
	
	def Room1.start
	  Text.dialog(1)
	  Text.dialog(2)
	  Text.dialog(3)
	  step_Left = false
	  step_Right = false
	  
	  while true
		print "> "
		choice = $stdin.gets.chomp

		if choice == "step left" && !step_Right
			dead("You step on a trap and die.")
		elsif choice == "step forward" && (!step_Right || !step_Left)
			dead("You step on a trap and die.")
		elsif choice == "step right" && step_Right
			dead("You step on a trap and die.")
		elsif choice == "step right" && !step_Right
			puts "Good job! You are still alive."
			step_Right = true
		elsif choice == "step forward" && step_Right && step_Left
		  puts "Good job! You open the door and enter"
		  Room2.door_room
		elsif choice == "step left" && step_Right && !step_Left
		  puts "Good job! You are still alive."
		  step_Left = true
		else
		  puts "I got no idea where the traps are."
		end
	  end
	end
	
end


