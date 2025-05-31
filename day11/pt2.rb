password = "hepxxyzz"

def is_valid(string)
    duplicates = string.scan(/(\w)\1{1}/)
    characters = string.split("")
    return false if string == "hepxxyzz"
    return false if string.match(/[iol]/)
    return false if duplicates.uniq.length <= 1
    characters.each_with_index do |character, index|
        if index + 2 < characters.length
            next_expected = character.succ
            second_expected = next_expected.succ
            if characters[index + 1] == next_expected && 
                characters[index + 2] == second_expected &&
                !second_expected.match(/[ab]/)
                return true
            end
        end
    end
    return false
end

until is_valid(password) do
    password = password.succ
end

puts password