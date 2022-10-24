public class Sintomas {
    public final Estado Febre = new EstadoFebre();
    public final Estado Tosse = new EstadoTosse();
    public final Estado Vomito = new EstadoVomito();
    
    private Estado estado;
    
    public void setEstado(Estado estado) {
        this.estado = estado;
    }
    
    public void medicar(){
        estado.medicar();
    }
}