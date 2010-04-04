# street.rb
# author: Ulrich Brodowsky

require "../code/model/share_exception.rb"

# Provisorial:

STREET_TURN_COST_FACTOR = 0.5
STREET_TURN_WIN_FACTOR = 0.5

module Model
  
  # Represents a street in auf_aktien

  class Street

    # initialize a new street with given parameters

    def initialize(information)
      @name = information[:name]
      @price = information[:price]
      @upgrade_cost = information[:upgrade_cost]
      @entry_costs = information[:entry_costs]
      @downgrade_cost = information[:downgrade_cost]
      @turned = false
      @turn_cost = (@price * STREET_TURN_COST_FACTOR).to_i
      @turn_win = (@price * STREET_TURN_WIN_FACTOR).to_i
      @owner = nil
      @level = 0
    end
    
    attr_reader :name, :price, :upgrade_cost, :entry_costs, :downgrade_cost, :turned, :turn_cost, :turn_win, :level 
    attr_accessor :owner

    # increases the level by one

    def upgrade!
      unless upgradable?
        raise ShareException, "#{inspect} upgraded without possibility."
      end
      @level += 1
    end

    # gives the costs when someone enters the street with the level from now

    def entry_cost
      @entry_costs[level]
    end

    # decreases the level by one

    def downgrade!
      unless downgradable?
        raise ShareException, "#{inspect} downgraded without possibility."
      end
      @level -= 1
    end

    # controlls if the street can be upgraded

    def upgradable?
      @level < 5 and @turned == false
    end
    
    # controlls if the street can be downgraded

    def downgradable?
      @level > 0 and @turned == false
    end
    
    # turns the stree, so that it can't be upgraded or so that it can be upgraded

    def turn!
      unless turnable?
        raise ShareException, "#{inspect} turned without possibility."
      end
      @turned = !@turned
    end

    # Shows if the street can't be up and downgraded.

    def turned?
      @turned
    end
    
    # Shows if the street can be turned.
    
    def turnable?
      @level == 0
    end
  end

end
