require 'spec_helper'
require 'p6'
require 'p6/libro'
require 'p6/revista'
require 'p6/doc_electronico'

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
    
    context "Autores correctos" do
        it "Hay al menos un autor almacenado" do
            expect(@p.get_autor).to eq("pablo sebastian")
        end
        it "varios autores almacenados correctamente" do
            expect(@q.get_autor).to eq("pablo sebastian, oscar catari")
        end
    end
    
    context "Titulo Correcto" do
        it "Hay un titulo almacenado" do
            expect(@p.get_titulo).to eq("Lenguajes y Paradigmas")
        end
    end
    
    context "Debe existir o no una serie" do
        it "Existe una serie" do
            expect(@p.get_serie).to eq("Ruby")
        end
        it "No existe una serie" do
            expect(@q.get_serie).to eq("")
        end
    end
    
    context "Debe existir una editorial" do
        it "Existe editorial" do
            expect(@p.get_editorial).to eq("Santillana")
        end
        it " No existe editorial" do
            expect(@q.editorial_poner("")).to eq(RuntimeError)
        end
    end
    
    context "Debe existir un numero de edicion." do
        it "Existe numero edicion" do
            expect(@p.get_edicion).to eq(4)
        end
        it "No existe numero edicion" do
            expect(@q.edicion_poner("4")).to eq(RuntimeError)
        end
    end
    
    context "Debe existir una fecha de publicacion" do
        it "Existe fecha de publicacion" do
            expect(@p.get_fecha).to eq("july 7,2015")
        end
        it "No existe fecha de publicacion" do
            expect(@q.fecha_poner("")).to eq(RuntimeError)
        end
    end
    context "Debe existir uno o mas numeros ISBN" do
        it "Existe un numero ISBN" do
            expect(@p.get_isbn).to eq("ISBN-10: 1234512345")
        end
        it "Existe varios numeros ISBN" do
            expect(@q.get_isbn).to eq("ISBN-10: 1234512345,ISBN-13:1234512345123")
        end
    end
    context "Referencia formateada" do
        it "Formateo de la referencia" do
            expect(@p.formateo).to eq("pablo sebastian\nLenguajes y Paradigmas\n(Ruby)\nSantillana; 4 edition (july 7,2015)\nISBN-10: 1234512345")
        end
    end
    
    context "Derivaciones de referencias bibliograficas" do
        it "Debe haber una clase libro" do
            @libro = Libro.new("Oscar Catari","rojo",7)
            @libro.titulo_poner("Lenguajes y Paradigmas")
            @libro.serie_poner("Ruby")
            @libro.editorial_poner("Santillana")
            @libro.edicion_poner(4)
            @libro.fecha_poner("july 7,2015")
            @libro.isbn_poner("ISBN-10: 1234512345")
            
            expect(@libro.is_a?P6::Biblio).to eq (true)
            expect(@libro.instance_of?P6::Biblio).to eq(false)
            expect(@libro.respond_to?('titulo_poner')).to eq(true)
            expect(@libro.to_s).to eq("Oscar Catari\nLenguajes y Paradigmas\n(Ruby)\nSantillana; 4 edition (july 7,2015)\nISBN-10: 1234512345\nColor: rojo\nCapitulos: 7")
        end
        it "Debe haber una clase revista" do
            @revista = Revista.new("Oscar Catari",35,"A4")
            @revista.titulo_poner("Lenguajes y Paradigmas")
            @revista.serie_poner("Ruby")
            @revista.editorial_poner("Santillana")
            @revista.edicion_poner(4)
            @revista.fecha_poner("july 7,2015")
            @revista.isbn_poner("ISBN-10: 1234512345")
            
            expect(@revista.is_a?P6::Biblio).to eq (true)
            expect(@revista.respond_to?('fecha_poner')).to eq(true)
            expect(@revista.to_s).to eq("Oscar Catari\nLenguajes y Paradigmas\n(Ruby)\nSantillana; 4 edition (july 7,2015)\nISBN-10: 1234512345\nNº Paginas: 35\nFormato: A4")
        end
        it "Debe haber una clase Doc_electronico" do
            @doc_elec = Doc_electronico.new("Oscar Catari",12,"Google Play")
            @doc_elec.titulo_poner("Lenguajes y Paradigmas")
            @doc_elec.serie_poner("Ruby")
            @doc_elec.editorial_poner("Santillana")
            @doc_elec.edicion_poner(4)
            @doc_elec.fecha_poner("july 7,2015")
            @doc_elec.isbn_poner("ISBN-10: 1234512345")
            
            expect(@doc_elec.is_a?P6::Biblio).to eq (true)
            expect(@doc_elec.respond_to?('edicion_poner')).to eq(true)
            expect(@doc_elec.to_s).to eq("Oscar Catari\nLenguajes y Paradigmas\n(Ruby)\nSantillana; 4 edition (july 7,2015)\nISBN-10: 1234512345\nPrecio: 12$\nTienda: Google Play")
        end
        
    end
    context "Comparacion entre referencias" do
        before :each do
            @ref1 = P6::Biblio.new("Oscar Catari")
            @ref1.titulo_poner("Lenguajes y Paradigmas")
            @ref1.serie_poner("Ruby")
            @ref1.editorial_poner("Santillana")
            @ref1.edicion_poner(4)
            @ref1.fecha_poner("july 7,2015")
            @ref1.isbn_poner("ISBN-10: 1234512345")
            
            @ref1_copia = P6::Biblio.new("Oscar Catari")
            @ref1_copia.titulo_poner("Lenguajes y Paradigmas")
            @ref1_copia.serie_poner("Ruby")
            @ref1_copia.editorial_poner("Santillana")
            @ref1_copia.edicion_poner(4)
            @ref1_copia.fecha_poner("july 7,2015")
            @ref1_copia.isbn_poner("ISBN-10: 1234512345")
            
            @ref2 = P6::Biblio.new("Oscar Catari")
            @ref2.titulo_poner("Lenguajes y Paradigmas")
            @ref2.serie_poner("C++") #diferencia
            @ref2.editorial_poner("Santillana")
            @ref2.edicion_poner(4)
            @ref2.fecha_poner("july 7,2015")
            @ref2.isbn_poner("ISBN-10: 1234512345")
            
            @libro = Libro.new("Oscar Catari","rojo",7)
            @libro.titulo_poner("Lenguajes y Paradigmas")
            @libro.serie_poner("Ruby")
            @libro.editorial_poner("Santillana")
            @libro.edicion_poner(4)
            @libro.fecha_poner("july 7,2015")
            @libro.isbn_poner("ISBN-10: 1234512345")
            
            @revista = Revista.new("Oscar Catari",35,"A4")
            @revista.titulo_poner("Lenguajes y Paradigmas")
            @revista.serie_poner("Ruby")
            @revista.editorial_poner("Santillana")
            @revista.edicion_poner(4)
            @revista.fecha_poner("july 7,2015")
            @revista.isbn_poner("ISBN-10: 1234512345")
        end
        
        it "ref1 y ref1_copia son iguales" do
            expect(@ref1 == @ref1_copia).to eq(true)
        end
        it "ref1 y ref2 son distintos" do
            expect(@ref1 == @ref2).to eq(false)
        end
        it "libro y ref1 son iguales" do 
            expect(@libro == @ref1).to eq(true)
        end
        it "revista y ref2 no son iguales" do
            expect(@revista == @ref2).to eq(false)
        end
        it "revista es menor que revista_mayor" do
            @revista_mayor = Revista.new("Oscar Catari",35,"A4")
            @revista_mayor.titulo_poner("Lenguajes y Paradigmas")
            @revista_mayor.serie_poner("Ruby")
            @revista_mayor.editorial_poner("Santillana")
            @revista_mayor.edicion_poner(10)
            @revista_mayor.fecha_poner("july 7,2015")
            @revista_mayor.isbn_poner("ISBN-10: 1234512345")
            
            expect(@revista < @revista_mayor).to eq(true)
        end
        it "libro es mayor o igual que ref_menor" do
            @ref_menor = P6::Biblio.new("Oscar Catari")
            @ref_menor.titulo_poner("Lenguajes y Paradigmas")
            @ref_menor.serie_poner("Ruby")
            @ref_menor.editorial_poner("Santillana")
            @ref_menor.edicion_poner(3)
            @ref_menor.fecha_poner("july 7,2015")
            @ref_menor.isbn_poner("ISBN-10: 1234512345")
            
            expect(@libro >= @ref_menor).to eq(true)
        end
        it "libro es menor o igual que revista" do
            expect(@libro <= @revista).to eq(true)
        end
        
    end
end