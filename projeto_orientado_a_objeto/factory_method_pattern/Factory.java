
public class Factory {
	public static Figura criaFigura(int key) {
		if (key == 1) {
			return new Circulo(4);
		} else if(key == 2) {
			return new Quadrado(2);
		} else if(key == 3) {
			return new Triangulo(3);
		} 
		return null;
	}
}
