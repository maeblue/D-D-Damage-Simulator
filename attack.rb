require 'dnd_die.rb'

#Simulates an attack roll
class Attack
  
  #Has two DnD Die (attack and damage), and a defense
  attr_accessor :attack_die, :damage_die, :defense
  
  def initialize(attack, damage, defense)
    @attack_die = attack
    @damage_die = damage
    @defense = defense
  end

  def roll(num_rolls)
    
    #holding array
    rolls = []
    
    #for each roll
    num_rolls.times do |r|
      
      #generate a uniformly-distributed random number between 1 and num_sides
      #and add the modifier
      rolls << [@attack.roll, @damage.roll, @defense]
    
    end
    
    return rolls
  end
  
  # Compute the damage done for each roll, the average damage, hits and misses
  def roll_for_damage(num_rolls)
    
    #make the rolls
    rolls = roll(num_rolls)
    
    #remove all rolls that are misses, and return only the damage column
    rolls.map! | do |roll|
      roll[1] if roll.first > roll.last
    end
    
    hits = rolls.length
    misses = num_rolls - hits
    avg_damage = rolls.inject(0) {|avg,dmg| avg += dmg.to_f/num_rolls}
    
    return [rolls,hits,misses,avg_damage]
  end


end
