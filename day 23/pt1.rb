input = File.readlines("./day23/pt1.rb")

instructions = input.each do |line|
    line.split(" ")
end

pp instructions

def execute(instruction)
    if instruction.include?("hlf")
        register = register / 2
    elsif instruction.include?("tpl")
        register = register * 3
    elsif instruction.include?("inc")
        register = register + 1
    elsif instruction.include?(jmp)
        # move forward/back in the instructions list by x
    elsif instruction.include?(jie) &&
        register.even?
        # move forward/back in the instructions list by x
    elsif instruction.include?(jio) &&
        register == 1
        # move forward/back in the instructions list by x
    end


