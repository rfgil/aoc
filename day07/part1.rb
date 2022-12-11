class Dir
  attr_reader :parent_dir, :name
  attr_accessor :childs, :files

  def initialize(name, parent_dir)
    @name = name
    @parent_dir = parent_dir
    @childs = []
    @files = []
  end

  def size
    @files.sum { |f| f[:size] } + @childs.sum(&:size)
  end

  def add_file(size, name)
    @files << { size: size.to_i, name: name }
  end
end

def cd(current_dir, target_dir)
  case target_dir
    when '/' then $root
    when '..' then current_dir.parent_dir
    else current_dir.childs.find { |dir| dir.name == target_dir }
  end
end

def create_dir(current_dir, name)
  new_dir = Dir.new(name, current_dir)

  current_dir.childs << new_dir
  $dirs_list << new_dir
end


input = File.open('./input.prod')

$root = Dir.new("/", nil)
$dirs_list = []
current_dir = nil

until (line = input.gets).nil?
  args = line.split

  if args[0] == '$' # line.starts_with("$")
    current_dir = cd(current_dir, args[2]) if args[1] == 'cd'
  else
    if args[0] == 'dir'
      create_dir(current_dir, args[1])
    else
      current_dir.add_file(args[0], args[1])
    end
  end
end

puts $dirs_list
       .filter{ |d| d.size <= 100000 }
       .sum(&:size)
