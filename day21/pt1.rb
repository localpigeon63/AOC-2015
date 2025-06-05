input = File.readlines("./day21/input.txt").map do |line|
    line.chomp.gsub(/\s+\+/, '+')
end

all_items = input[1..5] + input[8..12] + input[15..20]

Item = Data.define(:name, :cost, :damage, :defence)

all_items = all_items.map do |item|
    parts = item.split(/\s+/)
    name, cost, damage, defence = parts
    damage = damage.to_i
    defence = defence.to_i
    cost = cost.to_i
    Item.new(name, cost, damage, defence)
end

weapons = []
armour = []
rings = []

weapons.concat(all_items[0..4])
armour.concat(all_items[5..9] + [Item.new("nil", 0, 0, 0)])
rings.concat(all_items[10..15] + [Item.new("nil_left", 0, 0, 0), Item.new("nil_right", 0, 0, 0)])

ring_combos = rings.combination(2).to_a

all_builds = weapons.product(armour, ring_combos).map do |weapon, armour, (ring1, ring2)|
    [weapon, armour, ring1, ring2]
end

winning_builds = []

all_builds.each do |build|
    hp = 100.0
    boss_hp = 103.0
    boss_damage = 9
    boss_defence = 2
    player_damage = build.sum { |item| item.damage }
    player_defence = build.sum { |item| item.defence}
    player_hit = [(player_damage - boss_defence), 1].max
    boss_hit = [(boss_damage - player_defence), 1].max
    player_survives = (hp / boss_hit).ceil
    boss_survives = (boss_hp / player_hit).ceil
    if boss_survives <= player_survives
        winning_builds << build
    end
end

winning_build_costs = []

winning_builds.each do |winning_build|
    total_cost = winning_build.sum { |item| item.cost }
    winning_build_costs << total_cost
end

puts winning_build_costs.min