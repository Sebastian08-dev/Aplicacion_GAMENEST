package modelo.dto;

import java.io.InputStream;

public class Producto {
    int id;
    String nombre;
    InputStream foto;
    String Descripcion;
    Double precio;
    
    public  Producto(){
        
    }
public Producto(int id, String nombre, InputStream foto, String Descripcion, Double precio){
    this.id=id;
    this.nombre=nombre;
    this.foto=foto;
    this.Descripcion=Descripcion;
    this.precio=precio;
}

    public int getId()                              {return id;}
    public void setId(int id)                       {this.id = id;}
    public String getNombre()                       {return nombre;}
    public void setNombre(String nombre)            {this.nombre = nombre;}
    public InputStream getFoto()                    {return foto;}
    public void setFoto(InputStream foto)           {this.foto = foto;}
    public String getDescripcion()                  {return Descripcion;}
    public void setDescripcion(String Descripcion)  {this.Descripcion = Descripcion;}
    public Double getPrecio()                       {return precio;}
    public void setPrecio(Double precio)            {this.precio = precio;}

}
