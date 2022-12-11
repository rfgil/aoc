counter = 1
value = 1

hash = {}

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

puts hash[20]*20 + hash[60]*60 + hash[100]*100 + hash[140]*140 + hash[180]*180 + hash[220]*220
