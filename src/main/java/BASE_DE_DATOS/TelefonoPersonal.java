package BASE_DE_DATOS;

public class TelefonoPersonal extends Personal{
    private int id_telefonoP;
    private int numTelefonoP;
    private String id_personalT;

    public int getId_telefonoP() {
        return id_telefonoP;
    }

    public void setId_telefonoP(int id_telefonoP) {
        this.id_telefonoP = id_telefonoP;
    }

    public int getNumTelefonoP() {
        return numTelefonoP;
    }

    public void setNumTelefonoP(int numTelefonoP) {
        this.numTelefonoP = numTelefonoP;
    }

    public String getId_personalT() {
        return id_personalT;
    }

    public void setId_personalT(String id_personalT) {
        this.id_personalT = id_personalT;
    }
}
