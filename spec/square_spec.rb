# author: Bernhard F. Brodowsky

$:.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$:.unshift(File.join(File.dirname(__FILE__)))

require 'model/square'
require 'all_squares_spec'

describe Model::Square do

  before do
    @name = "Testname"
    @square = Model::Square.new(@name)
  end

  it_should_behave_like "all squares"

end
