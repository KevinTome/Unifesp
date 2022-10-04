public class FifoQueue extends Queue {
	public void enqueue(Object n) {
		idx.enqueue(n);
	}
	
	public void dequeue() {
		idx.dequeue();	
	}
	
	public boolean isEmpty() {
		return idx.isEmpty();
	}
	
	public int size() {
		return idx.size();
	}
	
}