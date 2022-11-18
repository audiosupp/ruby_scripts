# str = gets.chomp.to_s
# shift_factor = gets.to_i
# p str_arr = str.split('')
# p str_ord_arr = str_arr.map(&:ord)
# p str_ord_arr.map! {|n| n + shift_factor}
# p str_chr = str_ord_arr.map(&:chr)
# p str_mod = str_chr.join('')
# p str_mod

# def caesar_cipher(str, shift_factor)
#     cipher = str.split('')
#     p cipher
#     p str
# end


# # ascii upcase 65-90 A-Z 
# # lowercase 97-122 a-z

# str = "What a string!"
# shift_factor = 5

# # p alphabet = Array('a'..'z').chars.map(&:ord)
# # p alphabet_cap = Array('A'..'Z').chars.map(&:ord)

# p ascii = str.chars.map(&:ord)
# # p ascii.each do |num|
# #     if num >= 65 && <= 90
# #         num == alphabet
# #         p 'low'
# #     elsif num >= 97 && <= 122
# #         num == alphabet_cap
# #         p 'cap'
# #     else
# #         leftovers = Array(num)
# #         p leftovers
# #     end
# # end
        
# p shifted = ascii.map { |c| c + shift_factor}
# p shifted.map { |c| c.chr }.join


def caesar_cipher(str, shift_factor)
    alphabet = Array('a'..'z')
    # Create hash from alphabet array of strings + correspond index from 0 to alphabet length
    # looks like {"a"=>0, "b"=>1, ... etc}
    char_positions = Hash[alphabet.zip(0...alphabet.length)]
    str.chars.map { |char| 
        # Check which of the user string (str) characters correspond to char_positions hash of characters, 
        # if there is non correspond characters then that would be nil
        pos = char_positions[char.downcase]
        # If pos.nil? then skip str character, if not use (add) (pos character number + shift_factor) (modulo) % alphabet length (which is 26)
        nextchar = pos.nil? ? char : alphabet[(pos + shift_factor) % alphabet.length]
        # if original str char was upcase, then nextchar would be upcase, else just use nextchar
        (char == char.upcase) ? nextchar.upcase : nextchar
    }.join
end

caesar_cipher("What a string!", 5)