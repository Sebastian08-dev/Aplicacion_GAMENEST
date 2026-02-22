package modelo.dto;

public class reclamaciones {
    private int id;
    private String nombre;
    private String apellidos;
    private String correo;
    private String telefono;
    private String producto;
    private double monto_reclamado;
    private String descripcion_problema;
    private String evidencia;
    private String estado;

    // Constructor
    public reclamaciones(int id, String nombre, String apellidos, String correo, String telefono, String producto, double monto_reclamado, String descripcion_problema, String evidencia) {
        this.id = id;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.correo = correo;
        this.telefono = telefono;
        this.producto = producto;
        this.monto_reclamado = monto_reclamado;
        this.descripcion_problema = descripcion_problema;
        this.evidencia = evidencia;
        this.estado = "P";
    }
    
    public reclamaciones(){}

    // Getters y Setters
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    
    public String getNombre() {
        return nombre;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    public String getApellidos() {
        return apellidos;
    }
    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }
    
    public String getCorreo() {
        return correo;
    }
    public void setCorreo(String correo) {
        this.correo = correo;
    }
    
    public String getTelefono() {
        return telefono;
    }
    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }
    
    public String getProducto() {
        return producto;
    }
    public void setProducto(String producto) {
        this.producto = producto;
    }
    
    public double getMonto_reclamado() {
        return monto_reclamado;
    }
    public void setMonto_reclamado(double monto_reclamado) {
        this.monto_reclamado = monto_reclamado;
    }
    
    public String getDescripcion_problema() {
        return descripcion_problema;
    }
    public void setDescripcion_problema(String descripcion_problema) {
        this.descripcion_problema = descripcion_problema;
    }
    
    public String getEvidencia() {
        return evidencia;
    }
    public void setEvidencia(String evidencia) {
        this.evidencia = evidencia;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
    
    
}
