package BASE_DE_DATOS;

public class Autor extends Libros{
    private String id_autor;
    private String nombreAct;
    private String apellidoAtc;

    public String getId_autor() {
        return id_autor;
    }

    public void setId_autor(String id_autor) {
        this.id_autor = id_autor;
    }

    public String getNombreAct() {
        return nombreAct;
    }

    public void setNombreAct(String nombreAct) {
        this.nombreAct = nombreAct;
    }

    public String getApellidoAtc() {
        return apellidoAtc;
    }

    public void setApellidoAtc(String apellidoAtc) {
        this.apellidoAtc = apellidoAtc;
    }
}
