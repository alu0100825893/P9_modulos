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
            expect(@p.get_autor).to eq("pablo sebastian")
        end
        it "varios autores almacenados correctamente" do
            expect(@q.get_autor).to eq("pablo sebastian, oscar catari")
        end
    end
    
    describe "Titulo Correcto" do
        it "Hay un titulo almacenado" do
            expect(@p.get_titulo).to eq("Lenguajes y Paradigmas")
        end
    end
    
    describe "Debe existir o no una serie" do
        it "Existe una serie" do
            expect(@p.get_serie).to eq("Ruby")
        end
        it "No existe una serie" do
            expect(@q.get_serie).to eq("")
        end
    end
    
    describe "Debe existir una editorial" do
        it "Existe editorial" do
            expect(@p.get_editorial).to eq("Santillana")
        end
        it " No existe editorial" do
            expect(@q.editorial_poner("")).to eq(RuntimeError)
        end
    end
    
     describe "Debe existir un numero de edicion." do
        it "Existe numero edicion" do
            expect(@p.get_edicion).to eq(4)
        end
        it "No existe numero edicion" do
            expect(@q.edicion_poner("4")).to eq(RuntimeError)
        end
    end
    
    describe "Debe existir una fecha de publicacion" do
        it "Existe fecha de publicacion" do
            expect(@p.get_fecha).to eq("july 7,2015")
        end
        it "No existe fecha de publicacion" do
            expect(@q.fecha_poner("")).to eq(RuntimeError)
        end
    end
    describe "Debe existir uno o mas numeros ISBN" do
        it "Existe un numero ISBN" do
            expect(@p.get_isbn).to eq("ISBN-10: 1234512345")
        end
        it "Existe varios numeros ISBN" do
            expect(@q.get_isbn).to eq("ISBN-10: 1234512345,ISBN-13:1234512345123")
        end
    end
    describe "Referencia formateada" do
        it "Formateo de la referencia" do
            expect(@p.formateo).to eq("pablo sebastian\nLenguajes y Paradigmas\n(Ruby)\nSantillana; 4 edition (july 7,2015)\nISBN-10: 1234512345")
        end
    end
    
end