class Player
  attr_accessor :name
  attr_reader :health

  def initialize(name, health=100)
    @name = name.capitalize
    @health = health
    @found_treasures = Hash.new(0)
  end

  def to_s
    "I'm #{@name} with a health = #{@health}, points = #{points}, and score = #{score}."
  end

  def blam
    puts "#{@name} got blammed!"
    @health -= 10
  end

  def w00t
    puts "#{@name} got w00ted!"
    @health += 15
  end

  def name=(new_name)
    @name = new_name.capitalize
  end

  def score
    @health + points
  end

  def strong?
    @health > 100
  end

  def <=>(other_score)
    other_score <=> score
  end

  def find_treasure(treasure)
    @found_treasures[treasure.name] += treasure.points

    puts "#{@name} found a #{treasure.name} worth #{treasure.points} points."
    puts "#{@name}'s treasures: #{@found_treasures}"
  end

  def points
    @found_treasures.values.reduce(0, :+)
  end

  def each_found_treasure
    #iterate over found_treasures hash

    @found_treasures.each do |name, points|
      yield Treasure.new(name, points)
    end
  end

# Only run if the name of current source file (__FILE__) is the same as the program being run ($0 or $PROGRAM_NAME).

  if __FILE__ == $0
    player = Player.new("moe")
    puts player.name
    puts player.health
    player.w00t
    puts player.health
    player.blam
    puts player.health
  end

end
