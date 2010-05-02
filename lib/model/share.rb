# author: Bernhard F. Brodowsky

require 'model/street'

# provisorial

SHARE_PRICE_FACTOR = 1.5

module Model

  # A class that represents the shares.

  class Share < Possession
    
    # Initializes a new share with a given price.

    def initialize(street)
      @street = street
      super(:name => @street.name + " share",
        :price => @price = (@street.price * SHARE_PRICE_FACTOR).to_i)
    end

    attr_reader :street, :price
  end
end
