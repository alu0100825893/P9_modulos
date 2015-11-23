
class Libro < P6::Biblio
    def initialize(nombre,color,capitulos)
        super(nombre)
        @color = color
        @capitulos = capitulos
    end
    def to_s
        "#{super.to_s}\nColor: #{@color}\nCapitulos: #{@capitulos}"
    end
end