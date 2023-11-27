package BASE_DE_DATOS;

public class Usuarios_Prestamos extends Usuarios{
    private String id_usuarioP;
    private  String id_prestamoU;

    Prestamos objP = new Prestamos();

    public String getId_usuarioP() {
        return id_usuarioP;
    }

    public void setId_usuarioP() {
        this.id_usuarioP = getId_usuario();
    }

    public String getId_prestamoU() {
        return id_prestamoU;
    }

    public void setId_prestamoU() {
        this.id_prestamoU = objP.getId_prestamos();
    }
}
