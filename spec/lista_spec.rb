require 'spec_helper'
require 'p6/lista'
require 'p6/p6'

describe Lista do
    context "Debe crearse un nodo" do
        before :each do
            @nodo = Nodo.new(5,nil)
        end
        it "El nodo tiene un valor" do
            expect(@nodo.valor).to eq(5)
        end
        it "El nodo tiene un siguiente nil" do
            expect(@nodo.siguiente).to eq(nil)
        end
    end
    
    context "Debe crearse una lista" do
        before :each do
            @lista = Lista.new
        end
        it "La lista es vacia" do
            expect(@lista.vacio).to eq(true)
        end
    end
    
    context "Operaciones con lista" do
        before :each do
            @lista = Lista.new
            @nodo = Nodo.new(5,nil)
        end
        it "Insercion de un elemento" do
            @lista.insertar([@nodo])
            expect(@lista.to_s).to eq("5->nil")
        end
        it "Insercion de varios elementos" do
            @lista.insertar([@nodo,Nodo.new(7,nil),Nodo.new(10,nil)])
            expect(@lista.to_s).to eq("10->7->5->nil")
        end
       
        it "Eliminacion del primer elemento" do
            @lista.insertar([@nodo,Nodo.new(7,nil),Nodo.new(10,nil)])
            expect(@lista.extracion.valor).to eq(5)
            expect(@lista.to_s).to eq("10->7->nil")
        end
        it "Lista de referencias bibliograficas" do
            @ref = P6::Biblio.new("Dave Thomas, Andy Hunt, Chad Fowler")
            @ref.titulo_poner("Programming Ruby 1.9 & 2.0: The Pragmatic Programmers Guide")
            @ref.serie_poner("The Facets of Ruby")
            @ref.editorial_poner("Pragmatic Bookshelf")
            @ref.edicion_poner(4)
            @ref.fecha_poner("july 7,2013")
            @ref.isbn_poner("ISBN-13: 978-1937785499,ISBN-10: 1937785491")
            @nodo = Nodo.new(@ref,nil)
            @lista.insertar([@nodo])
            
            @ref = P6::Biblio.new("Scott Chacon")
            @ref.titulo_poner("Pro Git 2009th Edition")
            @ref.serie_poner("Pro")
            @ref.editorial_poner("Apress")
            @ref.edicion_poner(2009)
            @ref.fecha_poner("August 27, 2009")
            @ref.isbn_poner("ISBN-13: 978-1430218333,ISBN-10: 1430218339")
            @nodo = Nodo.new(@ref,nil)
            @lista.insertar([@nodo])
            
            @ref = P6::Biblio.new("David Flanagan, Yukihiro Matsumoto")
            @ref.titulo_poner("The Ruby Programming Language")
            @ref.serie_poner("")
            @ref.editorial_poner("O’Reilly Media")
            @ref.edicion_poner(1)
            @ref.fecha_poner("February 4, 2008")
            @ref.isbn_poner("ISBN-10: 0596516177,ISBN-13: 978-0596516178")
            @nodo = Nodo.new(@ref,nil)
            @lista.insertar([@nodo])
            
            @ref = P6::Biblio.new("David Chelimsky, Dave Astels, Bryan Helmkamp, Dan North, Zach Dennis, Aslak Hellesoy")
            @ref.titulo_poner("The RSpec Book: Behaviour Driven Development with RSpec, Cucumber, and Friends")
            @ref.serie_poner("The Facets of Ruby")
            @ref.editorial_poner("Pragmatic Bookshelf")
            @ref.edicion_poner(1)
            @ref.fecha_poner("December 25, 2010")
            @ref.isbn_poner("ISBN-10: 1934356379,ISBN-13: 978-1934356371")
            @nodo = Nodo.new(@ref,nil)
            @lista.insertar([@nodo])
            
            @ref = P6::Biblio.new("Richard E")
            @ref.titulo_poner("Silverman Git Pocket Guide")
            @ref.serie_poner("")
            @ref.editorial_poner("O’Reilly Media")
            @ref.edicion_poner(1)
            @ref.fecha_poner("August 2, 2013")
            @ref.isbn_poner("ISBN-10: 1449325866,ISBN-13: 978-1449325862")
            @nodo = Nodo.new(@ref,nil)
            @lista.insertar([@nodo])
          
            expect(@lista.to_s).to eq("Richard E\nSilverman Git Pocket Guide\n()\nO’Reilly Media; 1 edition (August 2, 2013)\nISBN-10: 1449325866,ISBN-13: 978-1449325862->David Chelimsky, Dave Astels, Bryan Helmkamp, Dan North, Zach Dennis, Aslak Hellesoy\nThe RSpec Book: Behaviour Driven Development with RSpec, Cucumber, and Friends\n(The Facets of Ruby)\nPragmatic Bookshelf; 1 edition (December 25, 2010)\nISBN-10: 1934356379,ISBN-13: 978-1934356371->David Flanagan, Yukihiro Matsumoto\nThe Ruby Programming Language\n()\nO’Reilly Media; 1 edition (February 4, 2008)\nISBN-10: 0596516177,ISBN-13: 978-0596516178->Scott Chacon\nPro Git 2009th Edition\n(Pro)\nApress; 2009 edition (August 27, 2009)\nISBN-13: 978-1430218333,ISBN-10: 1430218339->Dave Thomas, Andy Hunt, Chad Fowler\nProgramming Ruby 1.9 & 2.0: The Pragmatic Programmers Guide\n(The Facets of Ruby)\nPragmatic Bookshelf; 4 edition (july 7,2013)\nISBN-13: 978-1937785499,ISBN-10: 1937785491->nil")
        end
        
        it "Ls lista debe recorrerse al reves" do
            @lista.insertar([@nodo,Nodo.new(7,nil),Nodo.new(10,nil)])
            expect(@lista.to_s_inv).to eq("5->7->10->nil")
        end
    end
    
    context "Incluyendo el modulo enumerable a la lista" do
        before :each do
            @lista = Lista.new
            @lista.insertar([Nodo.new(7,nil),Nodo.new(10,nil),Nodo.new(5,nil)])
        end
        it "metodo max" do
            expect(@lista.max).to eq(10)
        end
        it "metodo min" do
            expect(@lista.min).to eq(5)
        end
        it "metodo sort" do
            expect(@lista.sort).to eq([5,7,10])
        end
        it "metodo drop" do
          expect(@lista.drop(1)).to eq([10,7])
        end
        it "metodo count" do
          expect(@lista.count).to eq(3)
        end
        it "metodo collect" do
          expect(@lista.collect{|i| i*2}).to eq([10,20,14])
        end
        it "metodo all" do
          expect(@lista.all?).to eq(true)
        end
    end
    
end