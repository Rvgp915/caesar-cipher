def new_shift(shift)
  shift = shift >= 26 ? (shift % 26) : shift
end

def shift_character(string, character, shift)
  if string.index(character) + shift < 26
    string[string.index(character) + shift]
  else
    string[(26 - string.index(character) - shift).abs()]
  end
end

ALPHABET_UPPERCASE = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
ALPHABET_LOWERCASE = "abcdefghijklmnopqrstuvwxyz"

def cipher(message, shift)
  shift = new_shift(shift)
  encrypted_array = message.split("").map do |character|
    if ALPHABET_UPPERCASE.include?(character)
      shift_character(ALPHABET_UPPERCASE, character, shift)
    elsif ALPHABET_LOWERCASE.include?(character)
      shift_character(ALPHABET_LOWERCASE, character, shift)
    else
      character
    end
  end
  encrypted_array.join("")
end

puts "Enter a message that you want encrypted: "
MESSAGE = gets.chomp
puts "Enter a desired shift: "
SHIFT = gets.chomp.to_i
ENCRYPTED_MESSAGE = cipher(MESSAGE, SHIFT)
puts "Your encrypted message is: #{ENCRYPTED_MESSAGE}"
