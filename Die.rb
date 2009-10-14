#Die Class, for simulating die rolls
class Die

  #each die has a number of sides
  attr_accessor :num_sides

  #initialize the die with it's number of sides
  #and possibly number of rolls
  def initialize(num_sides)
    @num_sides = num_sides
  end

  #generate the die rolls
  def roll(num_rolls)
    
    #holding array
    rolls = []
    
    #for each roll
    num_rolls.times do |r|
      
      #generate a uniformly-distributed random number between 1 and num_sides
      rolls << rand(@num_sides) + 1
    
    end
    
    return rolls
    
  end
  
end
