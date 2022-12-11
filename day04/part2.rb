input = File.read('./input.prod')

def has_overlap(min1, max1, min2, max2)
  (max1 >= min2 && max1 <= max2) ||
    (max2 >= min1 && max2 <= max1) ||
    (min1 <= max2 && min1 >= min2) ||
    (min2 <= max1 && min2 >= min1)
end

puts input.split("\n")
          .map { |line| line.split(/[,-]/) }
          .filter { |a| has_overlap(a[0].to_i, a[1].to_i, a[2].to_i, a[3].to_i) }
          .count