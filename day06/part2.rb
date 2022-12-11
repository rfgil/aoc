
$input = File.read('./input.prod').chars

SIZE = 14

def array_from_index(n)
  (1..SIZE).map { |i| $input[n - i] }
end

c = SIZE
while array_from_index(c).uniq.count < SIZE
  c += 1
end

puts c