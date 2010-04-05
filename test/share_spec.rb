# aktie_spec.rb
# author: Bernhard Brodowsky

require "code/model/share.rb"

describe Model::Share do
  before do
    @price = 2320
    @street = mock("street")
    @street.stub!(:price).and_return(@price)
    @street.stub!(:class).and_return(Model::Street)
  end
  
  describe "while creating" do
    it "should accept a street we assigned to it" do
      lambda {
        Model::Share.new(@street)
      }.should_not raise_error
    end

    it "should raise an exception if we created it with a nonstreet argument" do
      lambda {
        Model::Share.new("street")
      }.should raise_error(ArgumentError)
    end
  end
  describe "in any situation" do
    before do
      @share = Model::Share.new(@share)
    end
    
    it "should have the street we assigned to it." do
      @share.street.should equal @street
    end

    it "should have 1.5 times the price of the street we assigned to it." do
      @share.price.should == @price*1.5
    end
  end
end