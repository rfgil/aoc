counter = 1
value = 1

hash = {}
hash[1] = 1

File.read('./input.prod')
    .split("\n")
    .map { |line| line.split }
    .each do |arg|
  if arg[0] == 'noop'
    counter += 1
    hash[counter] = value
  else
    counter += 1
    hash[counter] = value
    counter += 1
    value += arg[1].to_i
    hash[counter] = value
  end
end


(0..5).each do |height|
  (0..39).each do |pixel|
    cycle = height * 40 + pixel + 1
    sprite = hash[cycle]

    if (pixel - sprite).abs <= 1
      print '#'
    else
      print '.'
    end
  end
  puts
end

puts hash