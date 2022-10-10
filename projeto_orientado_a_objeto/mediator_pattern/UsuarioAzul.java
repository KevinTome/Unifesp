public class UsuarioAzul extends Usuario {

  public UsuarioAzul(Mediator m) {
        super(m);
        m.adicionarUsuario(this);
    }

    public void receber(String msg) {
        System.out.println("(Azul) Mensagem recebida: " + msg);
    }

}