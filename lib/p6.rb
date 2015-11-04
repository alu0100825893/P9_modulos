#require "p6/version"

class Biblio

     attr_reader :autor
     attr_reader :titulo
     def initialize(nombre)
         @autor = []
         @autor.push(nombre)
     end
     def get_autor
          @autor.join(",")
     end
     def titulo_poner(titulo)
          @titulo=titulo
     end
     def get_titulo
          @titulo
     end
     
     def serie_poner(serie)
          @serie = serie
     end

     def get_serie
          @serie
     end
end
