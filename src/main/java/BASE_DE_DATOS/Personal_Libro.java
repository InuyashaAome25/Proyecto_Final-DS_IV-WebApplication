package BASE_DE_DATOS;

import java.time.LocalDateTime;

public class Personal_Libro {
    private String id_personalReg;
    private int id_libroReg;
    private LocalDateTime fechaRegistro;

    Libros objEx = new Libros();
    Personal objPer = new Personal();
    public String getId_personalReg() {
        return id_personalReg;
    }

    public void setId_personalReg() {
        this.id_personalReg = objPer.getId_personal();
    }

    public int getId_libroReg() {
        return id_libroReg;
    }

    public void setId_libroReg() {
        this.id_libroReg = objEx.getId_libro();
    }

    public LocalDateTime getFechaRegistro() {
        return fechaRegistro;
    }

    public void setFechaRegistro(LocalDateTime fechaRegistro) {
        this.fechaRegistro = fechaRegistro;
    }
}
