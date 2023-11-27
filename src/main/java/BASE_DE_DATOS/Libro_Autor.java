package BASE_DE_DATOS;

public class Libro_Autor extends Libros{
    private int id_libroAct;
    private String id_actorLib;
    private String descripcionAct;

    public int getId_libroAct() {
        return id_libroAct;
    }

    public void setId_libroAct(int id_libroAct) {
        this.id_libroAct = id_libroAct;
    }

    public String getId_actorLib() {
        return id_actorLib;
    }

    public void setId_actorLib(String id_actorLib) {
        this.id_actorLib = id_actorLib;
    }

    public String getDescripcionAct() {
        return descripcionAct;
    }

    public void setDescripcionAct(String descripcionAct) {
        this.descripcionAct = descripcionAct;
    }
}
