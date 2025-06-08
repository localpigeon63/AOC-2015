# exactly the same as pt1 but with one initial register value changed

input = File.readlines("./day23/input.txt")

instruction_list = []

def parse(line)
    line = line.chomp.gsub(",", "")
    parts = line.split
    entry = {:instruction => nil, :register => nil, :offset => nil}

    parts.each do |part|
        if part.match?(/[+-]?\d+/)
            entry[:offset] = part.to_i
        elsif part == "a" || part == "b"
            entry[:register] = part
        else
            entry[:instruction] = part
        end
    end
    entry
end

input.map do |entry|
    instruction_list << parse(entry)
end

registers = {"a" => 1, "b" => 0}

def execute(entry, registers)
    jump = 1
    if entry[:instruction] == "hlf"
        registers[entry[:register]] /= 2
    elsif entry[:instruction] == "tpl"
        registers[entry[:register]] *= 3
    elsif entry[:instruction] == "inc"
        registers[entry[:register]] += 1
    elsif entry[:instruction] == "jmp"
        jump = entry[:offset]
    elsif entry[:instruction] == "jie" &&
        registers[entry[:register]].even?
        jump = entry[:offset]
    elsif entry[:instruction] == "jio" &&
        registers[entry[:register]]  == 1
        jump = entry[:offset]
    end
    return jump, registers
end

pointer = 0

while pointer < instruction_list.size
  entry = instruction_list[pointer]
  jump, registers = execute(entry, registers)
  pointer += jump
end

puts registers
