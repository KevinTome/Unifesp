public class UsuarioVermelho extends Usuario {

    public UsuarioVermelho(Mediator m) {
	super(m);
	m.adicionarUsuario(this);
    }

    public void receber(String msg) {
        System.out.println("(Vermelho) Mensagem recebida: " + msg);
    }

}