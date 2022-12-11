
def char_to_int(char)
  if char.downcase == char
    char.ord - 96
  else
    char.ord - 38
  end
end

def items_to_hash(str)
  map = {}
  str.each_char { |c| map[c] = true}

  map
end

def elfs_symbol(str1, str2, str3)
  elf1 = items_to_hash(str1)
  elf2 = items_to_hash(str2)
  elf3 = items_to_hash(str3)

  elf1.keys.each do |item|
    return char_to_int(item) if elf2[item] && elf3[item]
  end
end

input = File.open('./input.prod')

exit = false
sum = 0

while !exit
  begin
    elf1 = input.readline
    elf2 = input.readline
    elf3 = input.readline

    sum += elfs_symbol(elf1, elf2, elf3)

  rescue EOFError
    exit = true
  end
end

puts sum