

Nodo = Struct.new(:valor,:siguiente)
class Lista
    def initialize 
          @cabeza = nil
    end

    def vacio
            if (@cabeza == nil)
                return true
            else
                return false
            end
    end
    
    def insertar(array)
            array.each do |elemento|
                if (self.vacio)
                    elemento.siguiente = nil
                    @cabeza = elemento
                else
                    elemento.siguiente = @cabeza
                    @cabeza = elemento
                end
            end
    end
    
    def to_s
            if (self.vacio)
                return ""
            else
                aux = ""
                iterador = @cabeza
                while (iterador != nil) do
                    aux = aux + iterador.valor.to_s + "->"
                    iterador = iterador.siguiente
                end
                aux = aux + "nil"
                return aux
            end
     end
end