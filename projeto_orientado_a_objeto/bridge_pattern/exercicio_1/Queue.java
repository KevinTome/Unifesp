public abstract class Queue {
	Index idx;
	
	public abstract void enqueue(Object n);
	public abstract void dequeue();
	public abstract boolean isEmpty();
	public abstract int size();
}