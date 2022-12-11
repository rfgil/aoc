require 'set'

SIZE = 10

$visited = Set.new
$rope = Array.new(SIZE) { { x: 0, y: 0 } }

def next_tail_pos(head, tail)
  diff_x = head[:x] - tail[:x]
  diff_y = head[:y] - tail[:y]

  x = diff_x.positive? ? -1 : 1
  y = diff_y.positive? ? -1 : 1

  return { x: head[:x] + x, y: head[:y] + y } if diff_x.abs >= 2 && diff_y.abs >= 2
  return { x: head[:x] + x, y: head[:y] } if diff_x.abs >= 2
  return { x: head[:x], y: head[:y] + y } if diff_y.abs >= 2

  return tail
end

def print_2d_points_visual(points)
  max_x = points.max_by { |point| point[:x] }[:x] + 2
  max_y = points.max_by { |point| point[:y] }[:y] + 2

  (0..max_x).each do |x|
    (0..max_y).each do |y|
      if points.any? { |point| point[:x] == x && point[:y] == y }
        print points.find_index({x: x, y: y}) #'*'
      else
        print '.'
      end
    end
    puts
  end
end

def move(direction, count)
  (1..count).each do |_|

    $rope[0] = case direction
      when 'R' then { x: $rope[0][:x] + 1, y: $rope[0][:y] }
      when 'U' then { x: $rope[0][:x], y: $rope[0][:y] + 1 }
      when 'L' then { x: $rope[0][:x] - 1, y: $rope[0][:y] }
      when 'D' then { x: $rope[0][:x], y: $rope[0][:y] - 1 }
    end

    (1..SIZE - 1).each do |index|
      $rope[index] = next_tail_pos($rope[index - 1], $rope[index])
    end

    $visited.add($rope[SIZE - 1])
  end
end

$visited.add($rope[SIZE - 1])

File.read('./input.prod')
    .split("\n")
    .map { |line| line.split }
    .each { |arg| move(arg[0], arg[1].to_i) }

puts $visited.count

#print_2d_points_visual($rope)
