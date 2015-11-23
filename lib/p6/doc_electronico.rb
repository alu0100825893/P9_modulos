class Doc_electronico < P6::Biblio
    def initialize(nombre,precio,tienda)
        super(nombre)
        @precio = precio
        @tienda = tienda
    end
    def to_s
        "#{super.to_s}\nPrecio: #{@precio}$\nTienda: #{@tienda}"
    end
end