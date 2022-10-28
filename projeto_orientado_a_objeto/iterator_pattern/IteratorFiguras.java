import java.util.Iterator;

public class IteratorFiguras implements Iterator{

	private ListaFiguras l;
	private int position;
	
	public IteratorFiguras(ListaFiguras l) {
		this.l = l;
		position = 0;
	}
	
	public boolean hasNext() {
		return position != l.size();
	}

	public Object next() {
		int posicao = position;
		position++;		
		return l.get(posicao);		
	}
}
