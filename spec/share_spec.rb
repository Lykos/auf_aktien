# author: Bernhard F. Brodowsky

$:.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$:.unshift(File.join(File.dirname(__FILE__)))

require 'model/share'
require 'all_possessions_spec'

describe Model::Share do

  it_should_behave_like "all possessions"

  before do
    @street_price = 2320
    @price = (@street_price * 1.5).to_i
    @street = mock("street")
    @street.stub!(:price).and_return(@street_price)
    @street.stub!(:name).and_return("Some street")
    @name = @street.name + " share"
    @share = Model::Share.new(@street)
    @possession = @share
  end
  
  describe "while creating" do

    it "should accept a street we assigned to it" do
      lambda {
        Model::Share.new(@street)
      }.should_not raise_error
    end

    it "should have the name of the street assigned to it plus 'share'" do
      street = mock("street")
      street.stub!(:price).and_return(200)
      street.stub!(:name).and_return("Streetname")
      Model::Share.new(street).name.should == "Streetname share"
    end

  end

  describe "in any situation" do
    
    it "should have the street we specified." do
      @share.street.should equal @street
    end

    it "should have 1.5 times the price of the street we specified." do
      @share.price.should == (@street_price * 1.5).to_i
    end

  end

end
