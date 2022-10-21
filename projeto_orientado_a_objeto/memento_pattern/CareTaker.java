import java.util.Stack;

public class CareTaker {
    
	private Stack<Memento> estados = new Stack<Memento>();
	private Factory f;
	
	public CareTaker(Factory f) {
		this.f = f;
	}
	
	public void saveState() {
		estados.push(f.createMemento());
	}
	
	public String undo() {
		return f.setMemento(estados.pop());
	}
}