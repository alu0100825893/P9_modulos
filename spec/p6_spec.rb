require 'p6'

describe Biblio do
    before :each do
        @p = Biblio.new("pablo sebastian")
        @p.titulo_poner("Lenguajes y Paradigmas")
        @p.serie_poner("Ruby")
        @q = Biblio.new("pablo sebastian, oscar catari")
        @q.serie_poner("")
        
    end
    
    describe "Autores correctos" do
        it "Hay al menos un autor almacenado" do
            @p.get_autor.should eq("pablo sebastian")
        end
        it "varios autores almacenados correctamente" do
            @q.get_autor.should eq("pablo sebastian, oscar catari")
        end
    end
    
    describe "Titulo Correcto" do
        it "Hay un titulo almacenado" do
            @p.get_titulo.should eq("Lenguajes y Paradigmas")
        end
    end
    
    describe "Debe existir o no una serie" do
        it "Existe una serie" do
            @p.get_serie.should eq("Ruby")
        end
        it "No existe una serie" do
            @q.get_serie.should eq("")
        end
    end
    
    
end