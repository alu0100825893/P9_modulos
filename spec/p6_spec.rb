require 'p6'

describe Biblio do
    describe "Autores correctos" do
        it "Hay al menos un autor almacenado" do
            p = Biblio.new("pablo sebastian")
            p.get_autor.should eq("pablo sebastian")
        end
        it "varios autores almacenados correctamente" do
            p = Biblio.new("pablo sebastian, oscar catari")
            p.get_autor.should eq("pablo sebastian, oscar catari")
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