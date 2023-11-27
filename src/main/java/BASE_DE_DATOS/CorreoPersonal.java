package BASE_DE_DATOS;

public class CorreoPersonal extends Personal{
    private int id_correoP;
    private String correoPersonal;
    private  String id_personalCP;

    public int getId_correoP() {
        return id_correoP;
    }

    public void setId_correoP(int id_correoP) {
        this.id_correoP = id_correoP;
    }

    public String getCorreoPersonal() {
        return correoPersonal;
    }

    public void setCorreoPersonal(String correoPersonal) {
        this.correoPersonal = correoPersonal;
    }

    public String getId_personalCP() {
        return id_personalCP;
    }

    public void setId_personalCP(String id_personalCP) {
        this.id_personalCP = id_personalCP;
    }
}
