package BASE_DE_DATOS;

public class Usuarios extends Dirreccion{
    protected String id_usuario;
    private String nombre;
    private String apellido;
    protected String loginUser;
    protected String contraseña;
    private int id_direccionU;

    public String getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(String id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getLoginUser() {
        return loginUser;
    }

    public void setLoginUser(String loginUser) {
        this.loginUser = loginUser;
    }

    public String getContraseña() {
        return contraseña;
    }

    public void setContraseña(String contraseña) {
        this.contraseña = contraseña;
    }

    public int getId_direccionU() {
        return id_direccionU;
    }

    public void setId_direccionU(int id_direccionU) {
        this.id_direccionU = id_direccionU;
    }
}
