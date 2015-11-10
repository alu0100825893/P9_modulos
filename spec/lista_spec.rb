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
    
end