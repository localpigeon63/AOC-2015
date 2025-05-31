input = File.readlines("./day7/input.txt")

instructions = {}
wire_values = {}

input.each do |line|
    instruction = line.split("->")[0].strip
    target = line.split("->")[1].chomp.strip
    instructions[instruction] = target
    wire_values[target] = nil
end

def check(wire, wire_values)
    if wire =~ /^\d+$/
        return wire.to_i
    elsif wire_values.key?(wire)
        return wire_values[wire]
    end
end

def execute(instruction, wire_values)
    if instruction.include? "AND"
        wire_1 = check(instruction.split("AND")[0].strip, wire_values)
        wire_2 = check(instruction.split("AND")[1].strip, wire_values)
        if wire_1 && wire_2
            wire_1 & wire_2
        end
    elsif instruction.include? "NOT"
        wire = check(instruction.gsub("NOT ", "").strip, wire_values)
        if wire
            ~wire & 0xFFFF
        end
    elsif instruction.include? "OR"
        wire_1 = check(instruction.split("OR")[0].strip, wire_values)
        wire_2 = check(instruction.split("OR")[1].strip, wire_values)
        if wire_1 && wire_2
            wire_1 | wire_2
        end
    elsif instruction.match /RSHIFT \d+/
        wire = check(instruction.split("RSHIFT")[0].strip, wire_values)
        modifier = instruction.split("RSHIFT")[1].strip.to_i
        if wire
            wire >> modifier
        end
    elsif instruction.match /LSHIFT \d+/
        wire = check(instruction.split("LSHIFT")[0].strip, wire_values)
        modifier = instruction.split("LSHIFT")[1].strip.to_i
        if wire
            wire << modifier
        end
    else
        if
        instruction =~ /^\d+$/
        instruction.to_i
        else
        wire_values[instruction]
        end
    end
end

while instructions.any? do
    to_do_list = {}
    instructions.each do |instruction, target|
        result = execute(instruction, wire_values, to_do_list)
        if result 
            wire_values[target] = result
        else to_do_list[instruction] = target
        end
    end
    instructions = to_do_list
end

result = wire_values["a"]




