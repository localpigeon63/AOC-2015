input = File.readlines("./day24/input.txt")

parcels = input.map do |number|
    number.chomp.to_i
end

valid_arrangements = []
target_number = parcels.sum/4

(1..parcels.size).each do |parcels_in_group|
  found_valid = false
  group_1_combinations = parcels.combination(parcels_in_group).to_a
  group_1_combinations.each do |group_1|
    remaining_parcels = parcels - group_1
    if group_1.sum == target_number
      (1..remaining_parcels.size).each do |parcels_in_group|
        group_2_combinations = remaining_parcels.combination(parcels_in_group).to_a
        group_2_combinations.each do |group_2|
          if group_2.sum == target_number
            remaining_parcels = parcels - group_1 - group_2
            (1..remaining_parcels.size).each do |parcels_in_group|
                group_3_combinations = remaining_parcels.combination(parcels_in_group).to_a
                group_3_combinations.each do |group_3|
                    if group_3.sum == target_number
                        valid_arrangements << group_1
                        found_valid = true
                        break
                    else
                        next
                    end
                end
                break if found_valid
            end
          end
        end
        break if found_valid 
      end
    end
  end
break if found_valid
end    

pp valid_arrangements

quantum_entanglement = valid_arrangements.flatten.reduce(:*)

puts quantum_entanglement