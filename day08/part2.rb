matrix = []

File.read('./input.prod')
    .split("\n")
    .each { |line| matrix << line.chars.map(&:to_i) }

SIZE = matrix.size

raise StandardError if matrix[0].size != SIZE

score = 0

(1..SIZE - 2).each do |i|
  (1..SIZE - 2).each do |j|

    height = matrix[i][j]

    right_count = 1
    left_count = 1
    top_count = 1
    bottom_count = 1

    left_count += 1 while left_count < j && matrix[i][j - left_count] < height
    right_count += 1 while right_count + j + 1 < SIZE && matrix[i][j + right_count] < height
    bottom_count += 1 while bottom_count + i + 1 < SIZE && j && matrix[i + bottom_count][j] < height
    top_count += 1 while top_count < i && matrix[i - top_count][j] < height

    current_score = top_count * bottom_count * left_count * right_count
    score = current_score if current_score > score
  end
end

puts score

# puts "#{matrix.map { |m| m.map {|i| i[:height]}  }}"
