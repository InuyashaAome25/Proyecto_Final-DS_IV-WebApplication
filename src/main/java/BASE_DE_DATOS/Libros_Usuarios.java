package BASE_DE_DATOS;

public class Libros_Usuarios extends Libros{
    private int id_libroU;
    private String id_usuarioL;

    Usuarios objU = new Usuarios();

    public int getId_libroU() {
        return id_libroU;
    }

    public void setId_libroU() {
        this.id_libroU = getId_libro();
    }

    public String getId_usuarioL() {
        return id_usuarioL;
    }

    public void setId_usuarioL() {
        this.id_usuarioL = objU.getId_usuario();
    }
}
