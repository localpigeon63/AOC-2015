# none of the 

string.split
instructions, points = line.split("") #difficulty here is what to split on. Unresolved!
start_point, end_point = points.split(" through ")
approved_start_date, approved_end_date = approved_between.split(" - ")


def execute_instruction
    if instruction = 'turn on'
        status = on
    elsif instruction = 'turn off'
        status = off
    else #i.e. toggle
        if status = off
            status = on
        else
            status = off
        end
    end
end