require_relative "slot_machine"

slot_machine = SlotMachine.new
slot_machine.play
puts "Your score: #{slot_machine.score}"
