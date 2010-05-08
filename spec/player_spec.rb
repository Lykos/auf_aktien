# author: Ulrich Brodowsky

$:.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$:.unshift(File.join(File.dirname(__FILE__)))

require 'model/player'

describe Model::Street do
  
  before do
    @name = "Testname"
    @player = Model::Player.new(@name)
    @possession = @player
  end
  
  describe "after creation" do

    it "should have no streets" do
      @player.streets.should be_empty
    end

    it "should have the name we gave it" do
      @possession.name.should == @name
    end

    it "should have no shares" do
      @player.shares.should be_empty
    end

    it "schould have no possession" do
      @player.possession.should be_empty
    end

  end
  
  describe "in any situation" do
    
    # it "should have the share given" do
      
    # end

  end

end
