import java.util.ArrayList;
import java.util.List;

public class ArrayListQueueLifo implements Index {

	List arrayQueue;
	
	public ArrayListQueueLifo() {
		arrayQueue = new ArrayList<>();
	}
	
	@Override
	public void enqueue(Object n) {
		arrayQueue.add(n);
	}

	@Override
	public void dequeue() {
		arrayQueue.remove( arrayQueue.size()-1  );
	}

	@Override
	public boolean isEmpty() {
		return arrayQueue.isEmpty();
	}

	@Override
	public int size() {
		return arrayQueue.size();
	}
	
}