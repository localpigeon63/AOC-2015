
test_initial_state = {:mana_spent => 0, 
                :mana_remaining => 500, 
                :player_hp => 50, 
                :player_armour => 0,
                :boss_hp => 71,
                :le_shield => 0,
                :le_poison => 0,
                :le_recharge => 0,
                :next_spell => nil,
                :outcome => nil }

test_spells = ["recharge", "poison", "shield", "magic_missile", "magic_missile", "drain", "magic_missile", "magic_missile"]

def log_state(state, phase)
  puts "After #{phase}:"
  puts "  Player HP: #{state[:player_hp]}"
  puts "  Player Armour: #{state[:player_armour]}"
  puts "  Boss HP: #{state[:boss_hp]}"
  puts "  Mana Remaining: #{state[:mana_remaining]}"
  puts "  Effects: Shield=#{state[:le_shield]}, Poison=#{state[:le_poison]}, Recharge=#{state[:le_recharge]}"
  puts "  Mana Spent: #{state[:mana_spent]}"
  puts "  Outcome: #{state[:outcome]}"
  puts "-" * 40
end

turns = 7  # 5 player+boss turns = 10 total turns

SPELL_COSTS = {
  "magic_missile" => 53,
  "drain" => 73,
  "shield" => 113,
  "poison" => 173,
  "recharge" => 229
}

state = test_initial_state.dup
turns.times do |turn_number|
    puts "=== Turn #{turn_number + 1} - Player's turn ==="
  apply_le(state)
  evaluate(state)
  log_state(state, "applying effects (start of player turn)")
  break if state[:outcome]

  # Pick spell for this turn
  spell = test_spells[turn_number % test_spells.size]
  state[:next_spell] = spell

  # Check if enough mana to cast spell
  if state[:mana_remaining] >= SPELL_COSTS[spell]
    cast(state)
    state[:next_spell] = nil
    evaluate(state)
    log_state(state, "casting #{spell}")
    break if state[:outcome]
  else
    puts "Not enough mana to cast #{spell}, skipping cast."
    state[:next_spell] = nil
  end

  puts "=== Turn #{turn_number + 1} - Boss's turn ==="
  apply_le(state)
  evaluate(state)
  log_state(state, "applying effects (start of boss turn)")
  break if state[:outcome]

  # Boss attacks: damage 10 - armour, minimum 1
  damage = [1, 10 - state[:player_armour]].max
  state[:player_hp] -= damage
  evaluate(state)
  log_state(state, "boss attacks for #{damage} damage")
  break if state[:outcome]
end

puts "=== Final Outcome: #{state[:outcome] || 'ongoing'} ==="

