package BASE_DE_DATOS;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.PrimitiveIterator;

public class Prestamos  {
    private int idPrestamo;
    private int idLibro;
    private String idUsuario;
    private String fechaPrestamo;
    private String fechaDevolucion;

    private String fechaDevoReal;
    private String estadoPrestamo;
    private String nombre;
    private String apellido;
    private String titulo;
    private String autor;

    private int cantidadPrestamo;

    private String correo;

    // Setters para asignar valores a los campos de la clase
    public void setCorreo(String correo){

        this.correo = correo;
    }

    public void setIdPrestamo(int idPrestamo){

        this.idPrestamo = idPrestamo;
    }

    public void setIdLibro(int idLibro){

        this.idLibro = idLibro;
    }

    public void setIdUsuario(String idUsuario){

        this.idUsuario = idUsuario;
    }

    public void setNombre(String nombre){

        this.nombre = nombre;
    }

    public void setApellido(String apellido){

        this.apellido = apellido;
    }

    public void setTitulo(String titulo){

        this.titulo = titulo;
    }

    public void setAutor(String autor){

        this.autor = autor;
    }

    public void setCantidadPrestamo(int cantidadPrestamo){

        this.cantidadPrestamo = cantidadPrestamo;
    }

    // Getters para obtener los valores de los campos de la clase
    public int getIdPrestamo(){

        return idPrestamo;
    }

    public int getIdLibro(){

        return idLibro;
    }

    public String getIdUsuario(){

        return idUsuario;
    }

    public String getFechaPrestamo(){

        return fechaPrestamo;
    }

    public String getFechaDevolucion(){

        return fechaDevolucion;
    }

    public String getEstadoPrestamo(){

        return estadoPrestamo;
    }

    public String getFechaDevoReal() {

        return fechaDevoReal;
    }

    public String getNombre(){

        return nombre;
    }

    public String getApellido(){

        return apellido;
    }

    public String getTitulo(){

        return titulo;
    }

    public String getAutor(){

        return autor;
    }

    public int getCantidadPrestamo(){

        return cantidadPrestamo;
    }

    public String getCorreo(){

        return correo;
    }
}
