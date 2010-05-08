# author: Bernhard F. Brodowsky

shared_examples_for "all possessions", :shared => true do

  describe "after creation" do
    
    it "should have the name we gave it" do
      @possession.name.should == @name
    end

      it "should have the price we gave it" do
      @possession.price.should == @price
    end
    
    it "should have the turn cost of half the price" do
      @possession.turn_cost.should == @price / 2
    end
    
    it "should have the turn win of half the price" do
      @possession.turn_win.should == @price / 2
    end
    
    it "shouldn't be turned" do
      @possession.should_not be_turned
    end
    
    it "should be turnable" do
      @possession.should be_turnable
    end

  end

  describe "in any situation" do
    
    it "shouldn't be turned after turning 2 times" do
      @possession.turn!
      @possession.turn!
      @possession.should_not be_turned
    end
    
    it "should be turnable after turning 2 times" do
      @possession.turn!
      @possession.turn!
      @possession.should be_turnable
    end

    it "should be turned after turning 3 times" do
      @possession.turn!
      @possession.turn!
      @possession.turn!
      @possession.should be_turned
    end

    it "should be turnable after turning 3 times" do
      @possession.turn!
      @possession.turn!
      @possession.should be_turnable
    end

  end

end