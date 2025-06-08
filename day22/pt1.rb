initial_state = {:player_turn => true, 
                :mana_spent => 0, 
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
        state[:player_armour] = 7
        state[:le_shield] = 6
    elsif state[:next_spell] == "poison"
        state[:mana_spent] += 173
        state[:mana_remaining] -= 173
        state[:boss_hp] -= 3
        state[:le_poison] = 6
    elsif state[:next_spell] == "recharge"
        state[:mana_spent] += 229
        state[:mana_remaining] -= 229
        state[:le_recharge] = 5
        state[:mana_remaining] += 101
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

def generate_moves (state, stack)
    if state[:mana_remaining] >= 53
        state[:next_spell] = "magic_missile"
        stack << state.clone
    elsif state[:mana_remaining] >= 73
        state[:next_spell] = "drain"
        stack << state.clone
    elsif state[:mana_remaining] >=113 &&
        state[:le_shield] == 0
        state[:next_spell] = "shield"
        stack << state.clone
    elsif state[:mana_remaining] >= 173 &&
        state[:le_poison] == 0
        state[:next_spell] = "poison"
        stack << state.clone
    elsif state[:mana_remaining] >= 229 &&
        state[:le_recharge] == 0
        state[:next_spell] = "recharge"
        stack << state.clone
    end
end

won_games = []
stack = [initial_state]

while stack.length > 0 do
    state = stack.pop
    apply_le(state)
    evaluate(state)
        if state[:outcome] == "win"
            won_games << state[:mana_spent]
        elsif state[:outcome] == "lose"
            next
        end
    state[:player_turn] = !state[:player_turn]
    if state[:player_turn] == false
        state[:player_hp] -= (10 - state[:player_armour])
    else
        generate_moves(state, stack)
    end
end

pp won_games
