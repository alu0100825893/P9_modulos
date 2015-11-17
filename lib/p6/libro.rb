
class Libro < P6::Biblio
    def initialize(nombre,color)
        super(nombre)
        @color = color
    end
    def to_s
        "#{super.to_s}\nColor: #{@color}"
    end
end