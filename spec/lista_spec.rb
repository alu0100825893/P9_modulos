require 'spec_helper'
require 'p6/lista'

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
       
    end
end