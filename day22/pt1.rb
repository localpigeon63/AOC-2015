initial_state = {:mana_spent => 0, 
                :mana_remaining => 500, 
                :player_hp => 50, 
                :player_armour => 0,
                :boss_hp => 71,
                :le_shield => 0,
                :le_poison => 0,
                :le_recharge => 0,
                :next_spell => nil,
                :outcome => nil }

def cast(state)
    if state[:next_spell] == "magic_missile"
        state[:mana_spent] += 53
        state[:mana_remaining] -= 53
        state[:boss_hp] -= 4
    elsif state[:next_spell] == "drain"
        state[:mana_spent] += 73
        state[:mana_remaining] -= 73
        state[:boss_hp] -= 2
        state[:player_hp] += 2
    elsif state[:next_spell] == "shield"
        state[:mana_spent] += 113
        state[:mana_remaining] -= 113
        state[:le_shield] = 6
    elsif state[:next_spell] == "poison"
        state[:mana_spent] += 173
        state[:mana_remaining] -= 173
        state[:le_poison] = 6
    elsif state[:next_spell] == "recharge"
        state[:mana_spent] += 229
        state[:mana_remaining] -= 229
        state[:le_recharge] = 5
    end
end

def apply_le(state)
    if state[:le_shield] > 0
        state[:player_armour] = 7
        state[:le_shield] -= 1
    else
        state[:player_armour] = 0
    end
    if state[:le_poison] > 0
        state[:boss_hp] -= 3
        state[:le_poison] -= 1
    end
    if state[:le_recharge] > 0
        state[:mana_remaining] += 101
        state[:le_recharge] -= 1
    end
end

def evaluate(state)
    if state[:boss_hp] < 1
        state[:outcome] = "win"
    elsif state[:player_hp] < 1
        state[:outcome] = "lose"
    end
end

def generate_moves (state)
    new_states = []
    if state[:mana_remaining] >= 53 || 
        (state[:le_recharge] >= 1 && state[:mana_remaining] + 101 >= 53)
        new_state = state.dup
        new_state[:next_spell] = "magic_missile"
        new_states << new_state
    end
    if state[:mana_remaining] >= 73 ||
        (state[:le_recharge] >= 1 && state[:mana_remaining] + 101 >= 73)
        new_state = state.dup
        new_state[:next_spell] = "drain"
        new_states << new_state
    end
    if (state[:mana_remaining] >=113 ||
        (state[:le_recharge] >= 1 && state[:mana_remaining] + 101 >= 53)) &&
        state[:le_shield] <= 1
        new_state = state.dup
        new_state[:next_spell] = "shield"
        new_states << new_state
    end
    if (state[:mana_remaining] >= 173 ||
        (state[:le_recharge] >= 1 && state[:mana_remaining] + 101 >= 53)) &&
        state[:le_poison] <= 1
        new_state = state.dup
        new_state[:next_spell] = "poison"
        new_states << new_state
    end
    if (state[:mana_remaining] >= 229 ||
        (state[:le_recharge] >= 1 && state[:mana_remaining] + 101 >= 53)) &&
        state[:le_recharge] <= 1
        new_state = state.dup
        new_state[:next_spell] = "recharge"
        new_states << new_state
    end
    new_states
end

winning_games = []
losing_games = []

stack = generate_moves(initial_state)

while stack.any? do
    state = stack.pop.dup

    # player turn
    apply_le(state)
    evaluate(state)
        if state[:outcome] == "win"
            winning_games << state[:mana_spent]
            next
        elsif state[:outcome] == "lose"
            losing_games << state
            next
        end
    
    cast(state)

    evaluate(state)
    if state[:outcome] == "win"
        winning_games << state[:mana_spent]
        next
    elsif state[:outcome] == "lose"
        losing_games << state
        next
    end

    #boss turn
    apply_le(state)
    evaluate(state)
    if state[:outcome] == "win"
    winning_games << state[:mana_spent]
        next
    elsif state[:outcome] == "lose"
        losing_games << state
        next
    end

    state[:player_hp] = state[:player_hp] - [1, (10 - state[:player_armour])].max

    evaluate(state)
    if state[:outcome] == "win"
    winning_games << state[:mana_spent]
        next
    elsif state[:outcome] == "lose"
        losing_games << state
        next
    else
        stack.concat(generate_moves(state))
    end
end

total_winning_games = winning_games.count
total_losing_games = losing_games.count

puts "winning_games = #{total_winning_games}"
puts "losing_games = #{total_losing_games}"
puts winning_games.min
