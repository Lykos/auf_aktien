require "..aktie.rb"

describe Aktie do
  before do
    @aktiv
  end
  
  it "sollte den Kurs haben, der ihm zugewiesen wurde." do
    @aktie.should haben_kurs(@kurs)
  end
end