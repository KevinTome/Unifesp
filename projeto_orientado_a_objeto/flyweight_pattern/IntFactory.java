import java.util.HashMap;
import java.util.Map;

public class IntFactory {
	private static Map<Integer, IntFlyweight> flyweight = new HashMap<>();
	
	public static IntFlyweight getFlyweight(int i) {
		
		IntFlyweight retorno = null;
		
		if(flyweight.get(i) == null) {
			retorno = new IntFlyweight(i);
			flyweight.put(i, retorno);
			
		}else{
			retorno = flyweight.get(i);
		}
		return retorno;
		
		
	}
}
