# author: Bernhard Brodowsky

module Model

  # This class represents the bank account of a user. It has got a balance which
  # can be modified either by paying a certain amount or by receiving money.

  class Account

    # Initialize a new account with a given starting balance.

    def initialize(balance)
      unless balance.is_a? Integer
        raise ArgumentError, "balance has to be an integer in initialize"
      end
      if balance < 0
        raise ArgumentError, "balance has to be nonnegative in initialize"
      end
      @balance = balance
    end

    attr_reader :balance

    # pay a certain price

    def pay!(price)
      unless price.is_a? Integer
        raise ArgumentError, "price has to be an integer in pay!"
      end
      if price < 0
        raise ArgumentError, "price has to be nonnegative in pay!"
      end
      unless can_pay? price
        raise ArgumentError, "price has to be a payable amount in pay!"
      end
      @balance -= price
     end

    # reiceive a certain amount of money

    def receive!(win)
      unless win.is_a? Integer
        raise ArgumentError, "win has to be an integer in receive!"
      end
      if win < 0
        raise ArgumentError, "win has to be nonnegative in receive!"
      end
      @balance += win
    end

    # Can a given price be payed with the current balance?

    def can_pay?(price)
      unless price.is_a? Integer
        raise ArgumentError, "price has to be an integer in can_pay?"
      end
      if price < 0
        raise ArgumentError, "win has to be nonnegative in can_pay?"
      end
      @balance >= price
    end
  end
end
