
public class Factory {
	public static Figura criaFigura(int key) {
		if (key == 1) {
			return new FiguraConcreta("Circulo", 4, 0, 0, 5);
		} else if(key == 2) {
			return new FiguraConcreta("Retangulo", 4, 5, 0, 0);
		} else if(key == 3) {
			return new FiguraConcreta("Triangulo", 3, 4, 5, 0);
		} 
		return null;
	}
}
