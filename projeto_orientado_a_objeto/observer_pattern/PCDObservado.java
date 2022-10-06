import java.util.ArrayList;
import java.util.List;

public class PCDObservado 
{
	List<EstacaoObserver> observers;
	
	public PCDObservado()
	{
		observers = new ArrayList<>();
	}
	
	public void add (EstacaoObserver estObserver)
	{
		observers.add(estObserver);
	}
	
	public void notifyObserver(String alt)
	{
		for(EstacaoObserver o : observers)
		{
			o.update(this, alt);
		}
	}
	
}