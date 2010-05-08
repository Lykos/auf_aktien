# author: Bernhard F. Brodowsky

$:.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$:.unshift(File.join(File.dirname(__FILE__)))

require 'model/possession'
require 'all_possessions_spec'

describe Model::Possession do
  
  before(:each) do
    @price = 1500
    @name = "Doneliostrasse"
    @possession = Model::Possession.new(:name => @name, :price => @price)
  end

  it_should_behave_like "all possessions"

end

