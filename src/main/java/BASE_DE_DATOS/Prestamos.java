package BASE_DE_DATOS;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.PrimitiveIterator;

public class Prestamos  {
    private String id_prestamos;
    private String id_usuariosPre;
    private int id_libroPre;
    private LocalDateTime fechaPrestamos;
    private LocalDate fechaDevolucion;

    public String getId_prestamos() {
        return id_prestamos;
    }

    public void setId_prestamos(String id_prestamos) {
        this.id_prestamos = id_prestamos;
    }

    public String getId_usuariosPre() {
        return id_usuariosPre;
    }

    public void setId_usuariosPre(String id_usuariosPre) {
        this.id_usuariosPre = id_usuariosPre;
    }

    public int getId_libroPre() {
        return id_libroPre;
    }

    public void setId_libroPre(int id_libroPre) {
        this.id_libroPre = id_libroPre;
    }

    public LocalDateTime getFechaPrestamos() {
        return fechaPrestamos;
    }

    public void setFechaPrestamos(LocalDateTime fechaPrestamos) {
        this.fechaPrestamos = fechaPrestamos;
    }

    public LocalDate getFechaDevolucion() {
        return fechaDevolucion;
    }

    public void setFechaDevolucion(LocalDate fechaDevolucion) {
        this.fechaDevolucion = fechaDevolucion;
    }
}
