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
     
     def editorial_poner(editorial)
          @editorial = editorial
          if (@editorial == "") 
               return RuntimeError
          end
     end

     def get_editorial
          @editorial
     end
     
     def edicion_poner(edicion)
          
          if(edicion.is_a? Integer)
               @edicion = edicion
          else
               return RuntimeError
          end
     end

     def get_edicion
          @edicion
     end
     
     def fecha_poner(fecha)
          @fecha = fecha
          if (@fecha == "") 
               return RuntimeError
          end
     end

     def get_fecha
          @fecha
     end
     
     def isbn_poner(isbn)
         @isbn = []
         @isbn.push(isbn)
     end
     def get_isbn
          @isbn.join(",")
          
     end
end
