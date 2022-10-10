public class UsuarioVerde extends Usuario {

  public UsuarioVerde(Mediator m) {
	super(m);
	m.adicionarUsuario(this);
   }

    public void receber(String msg) {
        System.out.println("(Verde) Mensagem Rebebida: " + msg);

    }

}