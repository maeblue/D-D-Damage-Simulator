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

  def roll(num_rolls=1)
    
    #holding array
    rolls = []
    
    #for each roll
    num_rolls.times do |r|
      
      #generate a uniformly-distributed random number between 1 and num_sides
      #and add the modifier
      rolls << [@attack_die.roll, @damage_die.roll, @defense]
    
    end
    
    return rolls
  end
  
  # Compute the damage done for each roll, the average damage, hits and misses
  def roll_for_damage(num_rolls)
    
    #make the rolls
    rolls = roll(num_rolls)
    
    #remove all rolls that are misses, and return only the damage column
    rolls.map!  do |roll|
      puts roll.first[0].to_s + "-" + roll.last.to_s
      if roll.first[0] >= roll.last
        roll[1]
      end
    end
    
    rolls.compact!
    
    puts rolls
    
    hits = rolls.length
    misses = num_rolls - hits
    hit_ratio = hits.to_f/misses
    avg_damage = rolls.inject(0) {|avg,dmg| avg += dmg[0].to_f/num_rolls}
    
    return [rolls,hits,misses,hit_ratio,avg_damage]
  end


end
