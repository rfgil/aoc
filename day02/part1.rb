
def shape_points(shape2)
  case shape2_to_name(shape2)
  when 'r' then 1 # rock
  when 'p' then 2 # paper
  when 's' then 3 # scissors
  else
    throw StandardError
  end
end

def victory_points(shape1, shape2)
  shape1 = shape1_to_name(shape1)
  shape2 = shape2_to_name(shape2)

  return 3 if shape1 == shape2 # draw

  is_victory = case shape1
               when 'r' then shape2 == 'p'
               when 's' then shape2 == 'r'
               when 'p' then shape2 == 's'
               end

  return 6 if is_victory
  return 0
end

def shape2_to_name(shape1)
  case shape1.downcase
  when 'x' then 'r' # rock
  when 'y' then 'p' # paper
  when 'z' then 's' # scissors
  else
    throw StandardError
  end
end

def shape1_to_name(shape2)
  case shape2.downcase
  when 'a' then 'r' # rock
  when 'b' then 'p' # paper
  when 'c' then 's' # scissors
  else
    throw StandardError
  end
end

input = File.read('./input')

puts input.split("\n")
          .map { |line| line.split }
          .map { |game|  victory_points(game[0], game[1]) + shape_points(game[1]) }
          .sum
