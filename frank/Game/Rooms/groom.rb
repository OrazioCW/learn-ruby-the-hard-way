require "./Rooms/eroom.rb"
  module GRoom
     def GRoom.room
        puts "This room is full of gold.  How much do you take?"

        print "> "
        choice = $stdin.gets.chomp

        if isnum?(choice)
          how_much = choice.to_i
        else
          ERoom.dead("Man, learn to type a number.")
        end

        if how_much < 50
          puts "Nice, you're not greedy, you win!"
          exit(0)
        else
          ERoom.dead("You greedy bastard!")
        end
     end

     def self.isnum?(str)
       begin
           !!Integer(str)
         rescue ArgumentError, TypeError
           false
       end
    end
  end
