import java.util.ArrayList;
import java.util.Iterator;

public class ListaFiguras extends AbstractList{

	private ArrayList lista = new ArrayList();
	
	@Override
	public Iterator iterator() {
		return new IteratorFiguras(this);
	}

	@Override
	public void appent(Object o) {		
		lista.add(o);
	}

	@Override
	public int size() {
		return lista.size();
	}

	@Override
	public Object get(int i) {
		return lista.get(i);
	}

}
