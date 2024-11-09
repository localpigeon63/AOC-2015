# scrappy notes. Do not take seriously.
# split the input lines into three: instruction, start point, end point
# define how the instructions are executed
# figure out how to apply them to a square for which you have two coordinates and need to extrapolate the other two

def extract_data (instruction, start_point, end_point)
    instruction, points = line.split("") #difficulty here is what to split on. Unresolved!
    start_point, end_point = points.split(" through ")
end

def execute_instruction
    if instruction = 'turn on'
        1
    elsif instruction = 'turn off'
        0
    else #i.e. toggle
        if 0
            1
        else
            0
        end
    end
end