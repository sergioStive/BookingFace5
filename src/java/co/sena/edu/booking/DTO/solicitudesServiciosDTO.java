/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.sena.edu.booking.DTO;

/**
 *
 * @author Sergio
 */
public class solicitudesServiciosDTO {

    @Override
    public String toString() {
        return "solicitudesServiciosDTO{" + "servicio=" + servicio 
                + ", direccionDestino=" + direccionDestino 
                + ", numeroSolicitudes=" + numeroSolicitudes + '}';
    }
    
   private String servicio;
    private String direccionDestino;
    private int numeroSolicitudes;

    /**
     * @return the servicio
     */
    public String getServicio() {
        return servicio;
    }

    /**
     * @param servicio the servicio to set
     */
    public void setServicio(String servicio) {
        this.servicio = servicio;
    }

    /**
     * @return the direccionDestino
     */
    public String getDireccionDestino() {
        return direccionDestino;
    }

    /**
     * @param direccionDestino the direccionDestino to set
     */
    public void setDireccionDestino(String direccionDestino) {
        this.direccionDestino = direccionDestino;
    }

    /**
     * @return the numeroSolicitudes
     */
    public int getNumeroSolicitudes() {
        return numeroSolicitudes;
    }

    /**
     * @param numeroSolicitudes the numeroSolicitudes to set
     */
    public void setNumeroSolicitudes(int numeroSolicitudes) {
        this.numeroSolicitudes = numeroSolicitudes;
    }
}
