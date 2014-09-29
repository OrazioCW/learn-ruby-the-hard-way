
def gold_room
	puts "This room is full of gold. How much do you take?"
	print "> "
	choice = $stdin.gets.chomp
	
	# fixed if
	if choice =~ /\A[-+]?[0-9]+\z/ && choice > 0
		how_much = choice.to_i
	else
		dead("Man, learn to type a number.")
	end
	
	if how_much < 50 
		puts "Nice, you are not greedy, you win!"
		exit(0)
	else
		dead("You greedy bastard!")
	end
end

def mummy_room

  Text.dialog(4)
  Text.dialog(5)
  Text.dialog(6)
  Text.dialog(7)
  
  while true
    print "> "
    choice = $stdin.gets.chomp

    if choice == "take honey"
      dead("The bear looks at you then slaps your face off.")
    elsif choice == "taunt bear" && !bear_moved
      puts "The bear has moved from the door. You can go through it now."
      bear_moved = true
    elsif choice == "taunt bear" && bear_moved
      dead("The bear gets pissed off and chews your leg off.")
    elsif choice == "open door" && bear_moved
      gold_room
    else
      puts "I got no idea what that means."
    end
  end
end


def cthulhu_room
  puts "Here you see the great evil Cthulhu."
  puts "He, it, whatever stares at you and you go insane."
  puts "Do you flee for your life or eat your head?"

  print "> "
  choice = $stdin.gets.chomp

  if choice.include? "flee"
    start
  elsif choice.include? "head"
    dead("Well that was tasty!")
  else
    cthulhu_room
  end
end

def dead(why)
  puts why, "Good job!"
  exit(0)
end

def start
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
	  mummy_room
	elsif choice == "step left" && step_Right && !step_Left
      puts "Good job! You are still alive."
	  step_Left = true
    else
      puts "I got no idea where the traps are."
    end
  end
end

start()

