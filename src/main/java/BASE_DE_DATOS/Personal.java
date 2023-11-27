package BASE_DE_DATOS;

public class Personal {
    private String id_personal;
    private String nombreP;
    private String apellidoP;
    protected String userNameP;
    protected String passwordP;
    private int id_libroPer;

    public String getId_personal() {
        return id_personal;
    }

    public void setId_personal(String id_personal) {
        this.id_personal = id_personal;
    }

    public String getNombreP() {
        return nombreP;
    }

    public void setNombreP(String nombreP) {
        this.nombreP = nombreP;
    }

    public String getApellidoP() {
        return apellidoP;
    }

    public void setApellidoP(String apellidoP) {
        this.apellidoP = apellidoP;
    }

    public String getUserNameP() {
        return userNameP;
    }

    public void setUserNameP(String userNameP) {
        this.userNameP = userNameP;
    }

    public String getPasswordP() {
        return passwordP;
    }

    public void setPasswordP(String passwordP) {
        this.passwordP = passwordP;
    }

    public int getId_libroPer() {
        return id_libroPer;
    }

    public void setId_libroPer(int id_libroPer) {
        this.id_libroPer = id_libroPer;
    }
}
