
def shape1_to_name(shape2)
  case shape2.downcase
  when 'a' then 'r' # rock
  when 'b' then 'p' # paper
  when 'c' then 's' # scissors
  else
    throw StandardError
  end
end

def game_result_to_points(shape1)
  case shape1.downcase
  when 'x' then 0 # lose
  when 'y' then 3 # draw
  when 'z' then 6 # win
  else
    throw StandardError
  end
end

def shape_points(shape)
  case shape
  when 'r' then 1 # rock
  when 'p' then 2 # paper
  when 's' then 3 # scissors
  else
    throw StandardError
  end
end

def winning_mapping
  {
    'r': 'p',
    'p': 's',
    's': 'r'
  }
end

def losing_mapping
  {
    'r': 's',
    'p': 'r',
    's': 'p'
  }
end

def points(shape1, game_result)
  shape1 = shape1_to_name(shape1)
  game_result_points = game_result_to_points(game_result)

  shape_to_play = case game_result_points
                  when 0 then losing_mapping[shape1.to_sym]
                  when 3 then shape1
                  when 6 then winning_mapping[shape1.to_sym]
                  else throw StandardError
                  end

  puts shape_to_play

  shape_points(shape_to_play) + game_result_points
end


input = File.read('./input')

puts input.split("\n")
          .map { |line| line.split }
          .map { |game| points(game[0], game[1]) }
          .sum


