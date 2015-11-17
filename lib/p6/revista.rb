class Revista < P6::Biblio
    def initialize(nombre,paginas)
        super(nombre)
        @paginas = paginas
    end
    def to_s
        "#{super.to_s}\nNº Paginas: #{@paginas}"
    end
end