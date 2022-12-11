input = File.read('./input.prod')

puts input.split("\n")
          .map { |line| line.split(/[,-]/) }
          .filter { |a| (a[0].to_i <= a[2].to_i && a[1].to_i >= a[3].to_i) || (a[2].to_i <= a[0].to_i && a[3].to_i >= a[1].to_i) }
          .count