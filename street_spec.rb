# street_spec.rb
# author: Ulrich Brodowsky

require 'street.rb'

describe Model::Street do
  before do
    @name = "Testname"
    @price = 1000
    @upgrade_cost = 1000
    @downgrade_cost = 1000
    @entry_costs = [100,250,900,1500,2500,4500]
    @street = Model::Street.new :name => @name, :price => @price, :upgrade_cost => @upgrade_cost, :entry_costs => @entry_costs, :downgrade_cost => @downgrade_cost
  end
  
  it "should have the name we gave it" do
    @street.name.should equal @name
  end
  
  it "should have the price we gave it" do
    @street.price.should equal @price
  end
  
  it "should have the mortgage of half the price" do
    @street.mortgage.should equal @price / 2
  end
  
  it "should have the upgrade costs we gave" do
    @street.upgrade_cost.should equal @upgrade_cost
  end
  
  it "should have the hotel sell cost we gave" do
    @street.downgrade_cost.should equal @downgrade_cost
  end

  it "should have the entry costs we gave" do
    @street.entry_costs.should equal @entry_costs
  end
  
  it "should have no owner before we specified one" do
    @street.owner.should be_nil
  end
  
  it "should have the owner we gave" do
    @street.owner = @owner
    @street.owner.should equal @owner
  end    

  it "should have level 0 when we created it" do
    @street.level.should equal 0
  end

  it "should have the level 1 costs with level 1"  do
    @street.upgrade!
    @street.entry_cost.should equal @entry_costs[1]
  end

  it "shouldn't be turned after creation" do
    @street.should_not be_turned
  end
  
  it "should be turnable after creation" do
    @street.should be_turnable
  end
  
  it "should be turnable with level 0(after 1 upgrade and 1 downgrade)" do
    @street.upgrade!
    @street.downgrade!    
    @street.should be_turnable
  end
  
  it "shouldn't be turnable with level 2" do
    @street.upgrade!
    @street.upgrade!
    @street.should_not be_turnable
  end
  
  it "should be turned after turning" do
    @street.turn!
    @street.should be_turned
  end
  
  it "shouldn't be turned after turning 2 times" do
    @street.turn!
    @street.turn!
    @street.should_not be_turned
  end
  
  it "should have level 2 after 2 upgrades" do
    @street.upgrade!
    @street.upgrade!
    @street.level.should equal 2
  end
  
  it "should have level 1 after 2 upgrades and one downgrade" do
    @street.upgrade!
    @street.upgrade!
    @street.downgrade!    
    @street.level.should equal 1
  end

  it "shouldn't be upgradable if we upgrade 5 times" do
    5.times {@street.upgrade!}
    @street.should_not be_upgradable
  end

  it "should be downgradable if we upgrade 5 times" do
    5.times {@street.upgrade!}
    @street.should be_downgradable
  end

  it "shouldn't be downgradable when it is just created" do
    @street.should_not be_downgradable
  end

  it "should be upgradable when it is just created" do
    @street.should be_upgradable
  end

  it "shouldn't be downgradable after upgrade and downgrade 2 times" do
    @street.upgrade!
    @street.upgrade!
    @street.downgrade!        
    @street.downgrade!        
    @street.should_not be_downgradable
  end

  it "should upgradable after upgrade and downgrade 2 times" do
    @street.upgrade!
    @street.upgrade!
    @street.downgrade!        
    @street.downgrade!        
    @street.should be_upgradable
  end

  it "should raise an exception if we upgrade 6 times(or more)" do
    lambda {
      6.times {@street.upgrade!}
    }.should_raise ShareException
  end

  it "should raise an exception if we upgrade 6 times(or more)(after 1 upgrade and 1 downgrade)" do
    lambda {
      4.times {@street.upgrade!}
      @street.downgrade!
      3.times {@street.upgrade!} 
    }.should_raise ShareException
  end

  it "should raise an exception if we upgrade 2 times and want to turn it" do
    lambda {
      2.times {@street.upgrade!}
      @street.turn!
    }.should_raise ShareException
  end

  it "should raise an exception if we downgrade from level 0" do
    lambda {
      @street.downgrade!
    }.should_raise ShareException
  end

  it "should raise an exception if we upgrade when it is turned" do
    lambda {
      @street.turn!
      @street.upgrade!
    }.should_raise ShareException
  end

  it "should raise an exception if we downgrade from level 0(after 1 upgrade and 1 downgrade)" do
    lambda {
      @street.upgrade!
      @street.downgrade!
      @street.downgrade!
    }.should_raise ShareException
  end

end
