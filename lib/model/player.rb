# author Ulrich

module Model

  # controls the logic of one Player of the game and deals with his money and streets

  class Player
    
    def initialize(name)
      @name = name
      @shares = []
      @streets = []
    end
    
    attr_reader :name, :shares, :streets
    
    def possession
      @shares + @streets
    end

  end

end
