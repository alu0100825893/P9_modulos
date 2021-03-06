
module P6
     class Biblio
     
          include Comparable
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
          
          def formateo
               aux=""
               aux=aux<<"#{get_autor}\n#{get_titulo}\n(#{get_serie})\n#{get_editorial}; #{get_edicion} edition (#{get_fecha})\n#{get_isbn}"
        
          end
          def to_s
               formateo
          end
          
          def <=> other
               get_autor <=> other.get_autor
          end
          
          def == (other)
               if (get_autor == other.get_autor)
                    if (get_titulo == other.get_titulo)
                         if (get_serie == other.get_serie)
                              if (get_editorial == other.get_editorial)
                                   if (get_edicion == other.get_edicion)
                                        if (get_fecha == other.get_fecha)
                                             if (get_isbn == other.get_isbn)
                                                  return true
                                             end
                                        end
                                   end
                              end
                         end
                    end
               end
               return false
          end
          
          def < (other)
               get_edicion < other.get_edicion
          end
          
          def > (other)
               get_edicion > other.get_edicion
          end
          
          def >= (other)
               get_edicion >= other.get_edicion
          end
          
          def <= (other)
               get_edicion <= other.get_edicion
          end
          
     end

end