require 'p6'

describe Biblio do
    describe "Autores correctos" do
        it "Hay al menos un autor almacenado" do
            p = Biblio.new("pablo")
            p.autor.to_s.should eq("pablo")
        end
    end
end