require 'set'

$visited = Set.new

$head = { x: 0, y: 0 }
$tail = { x: 0, y: 0 }

def next_tail_pos
  diff_x = $head[:x] - $tail[:x]
  diff_y = $head[:y] - $tail[:y]

  return { x: $head[:x] - diff_x / 2, y: $head[:y] } if diff_x.abs == 2
  return { x: $head[:x], y: $head[:y] - diff_y / 2 } if diff_y.abs == 2

  return $tail
end

def move(direction, count)
  (1..count).each do |_|

    $head = case direction
      when 'R' then { x: $head[:x] + 1, y: $head[:y] }
      when 'U' then { x: $head[:x], y: $head[:y] + 1 }
      when 'L' then { x: $head[:x] - 1, y: $head[:y] }
      when 'D' then { x: $head[:x], y: $head[:y] - 1 }
    end

    $tail = next_tail_pos
    $visited.add($tail)
    # puts "#{$head} => #{$tail}"
  end
end

$visited.add($tail)

File.read('./input.prod')
    .split("\n")
    .map { |line| line.split }
    .each { |arg| move(arg[0], arg[1].to_i) }

puts $visited.count
