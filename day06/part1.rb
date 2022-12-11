
input = File.read('./input.prod').chars

c = 4
while [input[c-4], input[c-3], input[c-2], input[c-1]].uniq.count < 4
  c += 1
end

puts c