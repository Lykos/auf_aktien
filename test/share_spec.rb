# aktie_spec.rb
# author: Bernhard Brodowsky

require 'code/model/share.rb'
require 'code/model/street.rb'

describe Model::Share do
  before do
    @price = 2320
    @street = mock("street")
    @street.stub!(:price).and_return(@price)
  end
  
  describe "while creating" do
    it "should accept a street we assigned to it" do
      lambda {
        Model::Share.new(@street)
      }.should_not raise_error
    end
  end
  describe "in any situation" do
    before do
      @share = Model::Share.new(@street)
    end
    
    it "should have the street we specified." do
      @share.street.should equal @street
    end

    it "should have 1.5 times the price of the street we specified." do
      @share.price.should == @price*1.5
    end
  end
end
