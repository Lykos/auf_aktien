# street.rb
# author: Ulrich Brodowsky

module Model
  
  # Represents a street in auf_aktien

  class Street
    def initialize(information)
      @name = information[:name]
      @price = information[:price]
      @upgrade_cost = information[:upgrade_cost]
      @entry_costs = information[:entry_costs]
      @downgrade_cost = information[:downgrade_cost]
      @turned = false
      @turnable = true
    end
    
    def turned?
      @turned
    end
    
    def turnable?
      @turnable
    end
    attr_reader :name, :price, :upgrade_cost, :entry_costs, :downgrade_cost
  end

end
