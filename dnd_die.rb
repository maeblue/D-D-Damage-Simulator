#A Die with D&D characteristics
class DnDDie
  
  #a DnD die has a number of sides and a modifier
  attr_accessor :num_sides, :modifier

  #It initializes with the number of sides, and a modifer, which defaults to 0
  def initialize(num_sides,modifier=0)
    @num_sides = num_sides
    @modifier = modifier
  end
  
  #generate the die rolls
  def roll(num_rolls=1)
    
    #holding array
    rolls = []
    
    #for each roll
    num_rolls.times do |r|
      
      #generate a uniformly-distributed random number between 1 and num_sides
      #and add the modifier
      rolls << rand(@num_sides) + 1 + @modifier
    
    end
    
    return rolls
    
  end

end
