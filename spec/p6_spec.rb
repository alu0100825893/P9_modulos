require 'p6'

describe Biblio do
    describe "Autores correctos" do
        it "Hay al menos un autor almacenado" do
            p = Biblio.new("pablo")
            p.autor.should eq("pablo")
        end
    end
    
    describe "Titulo Correcto" do
        it "Hay un titulo almacenado" do
            p = Biblio.new("Pablo")
            p.titulo_poner("Lenguajes y Paradigmas")
            p.titulo.should eq("Lenguajes y Paradigmas")
        end
    end
end