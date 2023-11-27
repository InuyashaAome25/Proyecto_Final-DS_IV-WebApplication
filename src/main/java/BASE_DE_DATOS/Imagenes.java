package BASE_DE_DATOS;

public class Imagenes extends Libros{
    private int id_imagen;
    private String nombreImg;
    private byte[] imagen;
    private int id_libroImg;

    public int getId_imagen() {
        return id_imagen;
    }

    public void setId_imagen(int id_imagen) {
        this.id_imagen = id_imagen;
    }

    public String getNombreImg() {
        return nombreImg;
    }

    public void setNombreImg(String nombreImg) {
        this.nombreImg = nombreImg;
    }

    public byte[] getImagen() {
        return imagen;
    }

    public void setImagen(byte[] imagen) {
        this.imagen = imagen;
    }

    public int getId_libroImg() {
        return id_libroImg;
    }

    public void setId_libroImg(int id_libroImg) {
        this.id_libroImg = id_libroImg;
    }
}
