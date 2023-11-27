package BASE_DE_DATOS;

public class Correo extends Usuarios{
    private int id_correo;
    private String correoPer;
    private String id_usuarioC;

    public int getId_correo() {
        return id_correo;
    }

    public void setId_correo(int id_correo) {
        this.id_correo = id_correo;
    }

    public String getCorreoPer() {
        return correoPer;
    }

    public void setCorreoPer(String correoPer) {
        this.correoPer = correoPer;
    }

    public String getId_usuarioC() {
        return id_usuarioC;
    }

    public void setId_usuarioC(String id_usuarioC) {
        this.id_usuarioC = id_usuarioC;
    }
}
