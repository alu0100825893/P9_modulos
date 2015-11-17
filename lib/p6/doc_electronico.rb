class Doc_electronico < P6::Biblio
    def initialize(nombre,precio)
        super(nombre)
        @precio = precio
    end
    def to_s
        "#{super.to_s}\nPrecio: #{@precio}$"
    end
end