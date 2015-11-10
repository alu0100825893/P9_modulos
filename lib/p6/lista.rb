

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
    
end