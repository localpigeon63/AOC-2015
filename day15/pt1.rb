input = File.readlines("./day15/input.txt")

class Ingredient
    attr_reader :name, :capacity, :durability, :flavor, :texture, :calories
    def initialize(name, capacity, durability, flavor, texture, calories)
        @name = name
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

pp ingredients