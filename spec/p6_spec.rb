require 'lib/p6'

describe P6 do
    describe "Autores correctos" do
        it "Hay al menos un autor almacenado" do
            p = P6.new('pablo')
            p.autor.should eq('pablo')
        end
    end
end