package modelo.dto;

import java.util.Date;
public class detalleJuego {
    
    private int detalleJuegoId;
    private int idJuego;
    private String descripcionJuego;
    private Date fechaEsterno;
    private String plataforma;
    private String idiomaTexto;
    private String idiomaAudio;
    private String urlVideo;

    public detalleJuego() {
    }

    public detalleJuego(int detalleJuegoId, int idJuego, String descripcionJuego, Date fechaEsterno, String plataforma, String idiomaTexto, String idiomaAudio, String urlVideo) {
        this.detalleJuegoId = detalleJuegoId;
        this.idJuego = idJuego;
        this.descripcionJuego = descripcionJuego;
        this.fechaEsterno = fechaEsterno;
        this.plataforma = plataforma;
        this.idiomaTexto = idiomaTexto;
        this.idiomaAudio = idiomaAudio;
        this.urlVideo = urlVideo;
    }

    public int getDetalleJuegoId() {
        return detalleJuegoId;
    }

    public void setDetalleJuegoId(int detalleJuegoId) {
        this.detalleJuegoId = detalleJuegoId;
    }

    public int getIdJuego() {
        return idJuego;
    }

    public void setIdJuego(int idJuego) {
        this.idJuego = idJuego;
    }

    public String getDescripcionJuego() {
        return descripcionJuego;
    }

    public void setDescripcionJuego(String descripcionJuego) {
        this.descripcionJuego = descripcionJuego;
    }

    public Date getFechaEsterno() {
        return fechaEsterno;
    }

    public void setFechaEsterno(Date fechaEsterno) {
        this.fechaEsterno = fechaEsterno;
    }

    public String getPlataforma() {
        return plataforma;
    }

    public void setPlataforma(String plataforma) {
        this.plataforma = plataforma;
    }

    public String getIdiomaTexto() {
        return idiomaTexto;
    }

    public void setIdiomaTexto(String idiomaTexto) {
        this.idiomaTexto = idiomaTexto;
    }

    public String getIdiomaAudio() {
        return idiomaAudio;
    }

    public void setIdiomaAudio(String idiomaAudio) {
        this.idiomaAudio = idiomaAudio;
    }

    public String getUrlVideo() {
        return urlVideo;
    }

    public void setUrlVideo(String urlVideo) {
        this.urlVideo = urlVideo;
    }

}
