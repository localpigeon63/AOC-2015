input = File.readlines("./day15/input.txt")

class Ingredient
    attr_reader :name, :capacity, :durability, :flavor, :texture, :calories
    def initialize(name, capacity, durability, flavor, texture, calories)
        @name = name.downcase
        @capacity = capacity
        @durability = durability
        @flavor = flavor
        @texture = texture
        @calories = calories
    end
end

ingredients = []

input.each do |ingredient|
    name = (ingredient.split(":"))[0]
    numbers = ingredient.scan(/-?\d+/)
    capacity = numbers[0].to_i
    durability = numbers[1].to_i
    flavor = numbers[2].to_i
    texture = numbers[3].to_i
    calories = numbers[4].to_i
    ingredients << Ingredient.new(name, capacity, durability, flavor, texture, calories)
end

recipe_book = []

(0..100).each do |a|
    (0..(100 - a)).each do |b|
      (0..(100 - a - b)).each do |c|
        d = 100 - a - b - c
        amounts = [a, b, c, d]
        combination = ingredients.each_with_index.to_h { |ingredient, i| [ingredient, amounts[i]] }
        recipe_book << combination
      end
    end
  end

high_score = 0

recipe_book.each do |combination|
    capacity = 0
    durability = 0
    flavor = 0
    texture = 0
    calories = 0
    combination.each do |ingredient, amount|
        capacity += ingredient.capacity * amount
        durability += ingredient.durability * amount
        flavor += ingredient.flavor * amount
        texture += ingredient.texture * amount
        calories += ingredient.calories * amount
    end
    if calories != 500
        total_score = 0
    elsif capacity < 0 || durability < 0 || flavor < 0 || texture < 0
        total_score = 0
    else
        total_score = capacity * durability * flavor * texture
    end
    if total_score > high_score
        high_score = total_score
    end
end

puts high_score