# aktie.rb
# author: Bernhard Brodowsky

require 'code/model/street.rb'

# provisorial

SHARE_PRICE_FACTOR = 1.5

module Model

  # A class that represents the shares.

  class Share
    
    # Initializes a new share with a given price.

    def initialize(street)
      @street = street
      @price = (street.price * SHARE_PRICE_FACTOR).to_i
    end

    attr_reader :street, :price
  end
end