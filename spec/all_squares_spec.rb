# author: Bernhard F. Brodowsky

shared_examples_for "all squares", :shared => true do

  describe "after creation" do

    it "should have the name we gave it" do
      @square.name.should == @name
    end

  end

end
