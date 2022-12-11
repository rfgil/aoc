input = File.open('./input.prod')

$array = Array.new(9) { [] }

while (line = input.readline).include?("]")
  line = line.gsub(" [", "[").gsub("   ", "*").gsub("[", "").gsub("]", "").gsub(" ", "").strip

  puts "--#{line}--"
  line.chars.each_with_index do |c, index|
    $array[index].prepend(c) unless c == "*"
  end
end

input.readline # blank input line

def move(count, from, to)
  aux = []

  while count > 0
    aux  << $array[from - 1].pop
    count = count - 1
  end

  aux.reverse.each { |e| $array[to - 1] << e }
end

input.readlines
     .map { |str| str.gsub("move ", "").gsub(/( from | to )/, "-").strip.split("-") }
     .each{ |command| move(command[0].to_i, command[1].to_i, command[2].to_i) }

puts $array.reduce("") { |acc, x| acc + x.last }