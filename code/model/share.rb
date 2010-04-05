# aktie.rb
# author: Bernhard Brodowsky

# provisorial

SHARE_PRICE_FACTOR = 1.5

module Model

  # A class that represents the shares.

  class Share
    
    # Initializes a new share with a given price.

    def initialize(street)
      unless street.is_a?(Model::Street)
        raise ArgumentError, "Argument street has to be a descendent of street."
      end
      @street = street
      @price = (street.price * SHARE_PRICE_FACTOR).to_i
    end

    attr_reader :street, :price
  end
end