input = File.readlines("./day13/input.txt")

def create_guestlist(input)
    guests = []
    input.each do |line|
        guests << (line.split(" "))[0]
    end
    guests.uniq
end

guests = create_guestlist(input)

happiness_data = {}

input.each do |line|
    name1 = (line.split(" "))[0]
    name2 = ((line.split(" ")[-1])).gsub(".", "")
    number = line.gsub("lose ", "-")[/-?\d+/].to_i
    happiness_data[[name1, name2]] = number
end

happiness_index = Hash.new(0)

happiness_data.each do |key, value|
  guest_pair = key.sort
  happiness_index[guest_pair] += value
end

seating_plans = guests.permutation.to_a
happiness_degrees = []

seating_plans.each do |seating_plan|
    happiness_per_plan = []
    seating_plan.each_cons(2) do |person1, person2|
        tuple = [person1, person2].sort
        happiness_per_plan << happiness_index[tuple]
    end
    final_tuple = [seating_plan.last, seating_plan.first].sort
    happiness_per_plan << happiness_index[final_tuple]
    happiness_degrees << happiness_per_plan.sum
end

pp happiness_degrees.sort[-1]