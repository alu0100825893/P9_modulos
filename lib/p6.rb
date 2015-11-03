#require "p6/version"

class Biblio

     attr_reader :autor
     attr_reader :titulo
     def initialize(nombre)
         @autor = nombre
     end
     
     def titulo_poner(titulo)
          @titulo=titulo
     end

end
