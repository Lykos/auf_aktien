# author: Ulrich Brodowsky

require 'exceptions/auf_aktien_exception'
require 'model/possession'

module Model
  
  # Represents a street in auf_aktien

  class Street < Possession

    # initialize a new street with given parameters

    def initialize(informations)
      super
      @upgrade_cost = informations[:upgrade_cost]
      @entry_costs = informations[:entry_costs]
      @downgrade_cost = informations[:downgrade_cost]
      @level = 0
    end
    
    attr_reader :upgrade_cost, :entry_costs, :downgrade_cost, :level

    # increases the level by one

    def upgrade!
      unless upgradable?
        raise AufAktienException, "#{inspect} upgraded without possibility."
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
        raise AufAktienException, "#{inspect} downgraded without possibility."
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
    
    # Shows if the street can be turned.

    def turnable?
      @level == 0
    end

  end

end
