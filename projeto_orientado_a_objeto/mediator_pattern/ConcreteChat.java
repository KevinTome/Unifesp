import java.util.ArrayList;

public class ConcreteChat implements Mediator {

  private ArrayList<Usuario> ListaUsuario;

    public ConcreteChat() {
        ListaUsuario = new ArrayList<Usuario>();
    }

    public void adicionarUsuario(Usuario usuario) {
        ListaUsuario.add(usuario);
    }

    public void enviar(String msg, Usuario originator) {
        for(Usuario usuario: ListaUsuario) {
            if(usuario != originator) {
                usuario.receber(msg);
            }
        }

    }

}