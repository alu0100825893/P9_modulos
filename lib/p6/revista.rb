class Revista < P6::Biblio
    def initialize(nombre,paginas,formato)
        super(nombre)
        @paginas = paginas
        @formato = formato
    end
    def to_s
        "#{super.to_s}\nNº Paginas: #{@paginas}\nFormato: #{@formato}"
    end
end