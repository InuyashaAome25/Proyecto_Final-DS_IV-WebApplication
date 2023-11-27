package BASE_DE_DATOS;

public class DireccionPersonal extends Personal{
    private int id_direccionP;
    private String distritoP;
    private String corregimientoP;
    private String calleP;
    private  String id_personal;

    public int getId_direccionP() {
        return id_direccionP;
    }

    public void setId_direccionP(int id_direccionP) {
        this.id_direccionP = id_direccionP;
    }

    public String getDistritoP() {
        return distritoP;
    }

    public void setDistritoP(String distritoP) {
        this.distritoP = distritoP;
    }

    public String getCorregimientoP() {
        return corregimientoP;
    }

    public void setCorregimientoP(String corregimientoP) {
        this.corregimientoP = corregimientoP;
    }

    public String getCalleP() {
        return calleP;
    }

    public void setCalleP(String calleP) {
        this.calleP = calleP;
    }

    @Override
    public String getId_personal() {
        return id_personal;
    }

    @Override
    public void setId_personal(String id_personal) {
        this.id_personal = id_personal;
    }
}
