require "aktie.rb"
describe Aktie do
  it "sollte den Kurs haben, der ihm zugewiesen wurde." do
    aktie.should haben_kurs(24.2)
  end
end