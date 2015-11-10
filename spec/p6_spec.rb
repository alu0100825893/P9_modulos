require 'spec_helper'
require 'p6'

describe P6::Biblio do
    before :each do
        @p = P6::Biblio.new("pablo sebastian")
        @p.titulo_poner("Lenguajes y Paradigmas")
        @p.serie_poner("Ruby")
        @p.editorial_poner("Santillana")
        @q = P6::Biblio.new("pablo sebastian, oscar catari")
        @q.serie_poner("")
        @p.edicion_poner(4)
        @p.fecha_poner("july 7,2015")
        @p.isbn_poner("ISBN-10: 1234512345")
        @q.isbn_poner("ISBN-10: 1234512345,ISBN-13:1234512345123")
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
    
    describe "Debe existir una editorial" do
        it "Existe editorial" do
            @p.get_editorial.should eq("Santillana")
        end
        it " No existe editorial" do
            @q.editorial_poner("").should eq(RuntimeError)
        end
    end
    
     describe "Debe existir un numero de edicion." do
        it "Existe numero edicion" do
            @p.get_edicion.should eq(4)
        end
        it "No existe numero edicion" do
            @q.edicion_poner("4").should eq(RuntimeError)
        end
    end
    
    describe "Debe existir una fecha de publicacion" do
        it "Existe fecha de publicacion" do
            @p.get_fecha.should eq("july 7,2015")
        end
        it "No existe fecha de publicacion" do
            @q.fecha_poner("").should eq(RuntimeError)
        end
    end
    describe "Debe existir uno o mas numeros ISBN" do
        it "Existe un numero ISBN" do
            @p.get_isbn.should eq("ISBN-10: 1234512345")
        end
        it "Existe varios numeros ISBN" do
            @q.get_isbn.should eq("ISBN-10: 1234512345,ISBN-13:1234512345123")
        end
    end
    describe "Referencia formateada" do
        it "Formateo de la referencia" do
            @p.formateo.should eq("pablo sebastian\nLenguajes y Paradigmas\n(Ruby)\nSantillana; 4 edition (july 7,2015)\nISBN-10: 1234512345")
        end
    end
    
end