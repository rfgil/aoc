matrix = []

File.read('./input.prod')
    .split("\n")
    .each { |line| matrix << line.chars.map { |c| { height: c.to_i, is_visible: false } } }

SIZE = matrix.size

raise StandardError if matrix[0].size != SIZE

(0..SIZE - 1).each do |i|
  left_max = matrix[i][0]
  right_max = matrix[i][SIZE - 1]
  top_max = matrix[0][i]
  bottom_max = matrix[SIZE - 1][i]

  right_max[:is_visible] = true
  left_max[:is_visible] = true
  top_max[:is_visible] = true
  bottom_max[:is_visible] = true

  (1..SIZE - 1).each do |j|
    left_max = matrix[i][j] if matrix[i][j][:height] > left_max[:height]
    top_max = matrix[j][i] if matrix[j][i][:height] > top_max[:height]

    left_max[:is_visible] = true
    top_max[:is_visible] = true
  end

  (SIZE - 2).downto(0).each do |j|
    right_max = matrix[i][j] if matrix[i][j][:height] > right_max[:height]
    bottom_max = matrix[j][i] if matrix[j][i][:height] > bottom_max[:height]

    right_max[:is_visible] = true
    bottom_max[:is_visible] = true
  end
end

puts matrix.sum { |trees| trees.filter { |t| t[:is_visible] }.count }

# puts "#{matrix.map { |m| m.map {|i| i[:height]}  }}"
