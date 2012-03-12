# author: Bernhard F. Brodowky

module Model

  # Represents a square on the Monopoly board.

  class Square

    # Initializes a new square with a given name.

    def initialize(name)
      @name = name
    end

    attr_reader :name

  end

end
