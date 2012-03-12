# author: Ulrich Brodowsky

$:.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$:.unshift(File.join(File.dirname(__FILE__)))

require 'model/street'
require 'all_possessions_spec'

describe Model::Street do
  
  before do
    @name = "Testname"
    @price = 1000
    @upgrade_cost = 1000
    @downgrade_cost = 1000
    @entry_costs = [100, 250, 900, 1500, 2500, 4500]
    arguments = {:name => @name, :price => @price,
      :upgrade_cost => @upgrade_cost, :entry_costs => @entry_costs,
      :downgrade_cost => @downgrade_cost}
    @street = Model::Street.new(arguments)
    @possession = @street
  end
  
  it_should_behave_like "all possessions"

  describe "after creation" do

    it "should have the upgrade costs we gave" do
      @street.upgrade_cost.should equal @upgrade_cost
    end
    
    it "should have the downgrade cost we gave" do
      @street.downgrade_cost.should equal @downgrade_cost
    end
    
    it "should have the entry costs we gave" do
      @street.entry_costs.should equal @entry_costs
    end
    
    it "should have level 0" do
      @street.level.should equal 0
    end

    it "shouldn't be downgradable" do
      @street.should_not be_downgradable
    end
    
    it "should be upgradable" do
      @street.should be_upgradable
    end

  end

  describe "should raise an exception" do

    it "when downgraded after creation" do
      lambda {
        @street.downgrade!
      }.should raise_error AufAktienException
    end

    it "if we upgrade 6 times(or more)" do
      lambda {
        6.times {@street.upgrade!}
      }.should raise_error AufAktienException
    end
    
    it "f we upgrade 6 times(or more)(after 1 upgrade and 1 downgrade)" do
    lambda {
        4.times {@street.upgrade!}
        @street.downgrade!
        3.times {@street.upgrade!} 
      }.should raise_error AufAktienException
    end
    
    it "if we upgrade 2 times and want to turn it" do
      lambda {
        2.times {@street.upgrade!}
        @street.turn!
      }.should raise_error AufAktienException
    end
    
    it "if we upgrade when it is turned" do
      lambda {
        @street.turn!
        @street.upgrade!
      }.should raise_error AufAktienException
    end
    
    it "if we downgrade from level 0(after 1 upgrade and 1 downgrade)" do
      lambda {
        @street.upgrade!
        @street.downgrade!
        @street.downgrade!
      }.should raise_error AufAktienException
    end
    
  end

  describe "in any situation" do
   
    it "should have the level 1 costs with level 1"  do
      @street.upgrade!
      @street.entry_cost.should equal @entry_costs[1]
    end
    
    it "should be turnable with level 0 (after 1 upgrade and 1 downgrade)" do
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
    
    it "shouldn't be downgradable after upgrades and downgrades 2 times" do
      @street.upgrade!
      @street.upgrade!
      @street.downgrade!        
      @street.downgrade!        
      @street.should_not be_downgradable
    end
    
    it "should upgradable after upgrades and downgrades 2 times" do
      @street.upgrade!
      @street.upgrade!
      @street.downgrade!        
      @street.downgrade!        
      @street.should be_upgradable
    end

  end

end
