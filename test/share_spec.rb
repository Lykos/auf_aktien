# aktie_spec.rb
# author: Bernhard Brodowsky

require "../code/model/share.rb"

describe Model::Share do
  before do
    @price = 2320
    @street = mock("street")
    @street.stub!(:price).and_return(@price)
    @share = Model::Share.new(@street)
  end
  
  it "should have the street we assigned to it." do
    @share.street.should equal @street
  end

  it "should have 1.5 times the price of the street we assigned to it." do
    @share.price.should == @price*1.5
  end
end