class Monkey
  attr_reader :inspect_count
  attr_accessor :items

  def initialize(starting_items, operation, test, true_case, false_case)
    @items = starting_items || []
    @operation = operation.gsub(" ", "")
    @test = test
    @true_case = true_case
    @false_case = false_case
    @inspect_count = 0
  end

  def calc_operation(worry_level)
    arg = @operation
      .gsub("old", worry_level.to_s)
      .split(/([+\-\*\/])/)

    arg[0].to_i.send(arg[1], arg[2].to_i)
  end

  def inspect(monkeys)
    @inspect_count += @items.count

    @items.each do |item|
      worry = calc_operation(item)
      worry = (worry / 3).floor

      if (worry % @test).zero?
        monkeys[@true_case].items << worry
      else
        monkeys[@false_case].items << worry
      end
    end

    @items = []
  end

end

ROUNDS = 20
monkeys = []

input = File.open('./input.prod')

until input.gets.nil?
  starting_items = input.gets.strip.gsub("Starting items: ", "").split.map(&:to_i)
  operation = input.gets.strip.gsub("Operation: new = ", "")
  test = input.gets.strip.gsub("Test: divisible by ", "").to_i
  true_case = input.gets.strip.gsub("If true: throw to monkey ", "").to_i
  false_case = input.gets.strip.gsub("If false: throw to monkey ", "").to_i

  input.gets # blank line separating monkeys

  monkeys << Monkey.new(starting_items, operation, test, true_case, false_case)
end

(0..ROUNDS - 1).each do |round|
  monkeys.each { |m| m.inspect(monkeys) }
end


puts monkeys.map(&:inspect_count).max(2).inject(:*)


