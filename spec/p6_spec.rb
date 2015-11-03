require 'p6'

describe Biblio do
    describe "Autores correctos" do
        it "Hay al menos un autor almacenado" do
            p = Biblio.new('pablo')
            p.autor.should eq('pablo')
        end
        
        it "Hay mas de un autor" do
           p=Biblio.new("Pablo , Pepe , Juan")
           p=autor.should eq("Pablo , Pepe , Juan")
        end
    end
end