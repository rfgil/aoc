input = File.read('./input.prod')

def char_to_int(char)
  if char.downcase == char
    char.ord - 96
  else
    char.ord - 38
  end
end

def find_duplicate(str1, str2)
  map = {}

  str1.each_char { |c| map[c] = char_to_int(c) }

  str2.each_char do |c|
    return map[c] if map.key?(c)
  end
end

puts input.split("\n")
          .map { |line| [line.slice(0, line.length / 2), line.slice(line.length / 2, line.length)] }
          .map { |split| find_duplicate(split[0], split[1]) }
          .sum
