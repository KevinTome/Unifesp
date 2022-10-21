public class Factory {
	private String estado = "";
	
	public Memento createMemento() {
		return new Memento(estado);
	}
	
	public String setMemento(Memento m) {
		this.estado = m.getState();
		return estado;
	}
	
	public void AdicionaTexto(String texto) {
		this.estado = texto;
	}
	
	public static Figura criaFigura(int key) {
		
	if (key == 1) {
			estado = "Circulo 4";
			return new Circulo(4);
		} else if(key == 2) {
			estado = "Quadrado 4";
			return new Quadrado(2);
		} else if(key == 3) {
		    estado = "Triangulo 3"
			return new Triangulo(3);
		} 
		return null;
	}
}