public class Teste {
	public static void main(String[] args) {
		
		FifoQueue fq = new FifoQueue();
		fq.idx = new VectorQueue();
		
		Object n = new Object();
		fq.enqueue(n);
		System.out.println("Tamanho(Fifo): " + fq.size() + " Vazia: " +  fq.isEmpty());
		
		LifoQueue lf = new LifoQueue();
		lf.idx = new VectorQueueLIFO();
		
		Object n2 = new Object();
		lf.enqueue(n);
		lf.enqueue(n2);
		System.out.println("Tamanho(Lifo): " + lf.size() + " Vazia: " +  lf.isEmpty());
	}
}