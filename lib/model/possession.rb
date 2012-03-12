# author: Bernhard F. Brodowsky

module Model

  # Provisorial:

  TURN_COST_FACTOR = 0.5
  TURN_WIN_FACTOR = 0.5

  # Used to represent possessions such as streets and shares.
  #
  class Possession
    # Initialize a new possession with some start information.
    #
    def initialize(informations)
      @name = informations[:name]
      @price = informations[:price]
      @turned = false
      @turn_cost = (@price * TURN_COST_FACTOR).to_i
      @turn_win = (@price * TURN_WIN_FACTOR).to_i
    end

    attr_reader :name, :price, :turn_cost, :turn_win, :turned

    # turns the possession, so that it can't be upgraded or so that it can be upgraded

    def turn!
      unless turnable?
        raise AufAktienException, "#{inspect} turned without possibility."
      end
      @turned = !@turned
    end

    # Shows if the street can't be up and downgraded.

    def turned?
      @turned
    end

    # Is the possession currently turnable?

    def turnable?
      true
    end
  end
end
