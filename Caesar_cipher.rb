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