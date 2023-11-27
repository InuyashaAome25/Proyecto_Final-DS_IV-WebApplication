package BASE_DE_DATOS;

public class Telefono extends Usuarios{
    private int id_telefono;
    private int numTelefono;
    private String id_usuarioT;

    public int getId_telefono() {
        return id_telefono;
    }

    public void setId_telefono(int id_telefono) {
        this.id_telefono = id_telefono;
    }

    public int getNumTelefono() {
        return numTelefono;
    }

    public void setNumTelefono(int numTelefono) {
        this.numTelefono = numTelefono;
    }

    public String getId_usuarioT() {
        return id_usuarioT;
    }

    public void setId_usuarioT(String id_usuarioT) {
        this.id_usuarioT = id_usuarioT;
    }
}
