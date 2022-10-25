import java.util.GregorianCalendar;

public class main {

	public static void main(String[] args) {
		GregorianCalendar Calendario = new GregorianCalendar();
		int diaSemana = Calendario.get(Calendario.DAY_OF_WEEK);
		
		Semana semana = new Semana();
		if (diaSemana == 1 || diaSemana == 7)
			semana.setStrategy(new LazerStrategy());
		else
			semana.setStrategy(new TrabalhoStrategy());
		
		semana.Acao();
	}
}
