import java.util.Vector;

public class VectorQueueLifo implements Index {

	Vector<Object> vectorQueue;
	
	public VectorQueueLifo() {
		vectorQueue = new Vector<Object>();
	}
	
	@Override
	public void enqueue(Object n) {
		vectorQueue.add(n);
	}

	@Override
	public void dequeue() {
		vectorQueue.remove( vectorQueue.size()-1  );
	}

	@Override
	public boolean isEmpty() {
		return vectorQueue.isEmpty();
	}

	@Override
	public int size() {
		return vectorQueue.size();
	}

}