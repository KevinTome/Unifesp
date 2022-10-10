//Nome: Kevin Tomé 135065
//      Vitor Carvalho 111840

public class ClassMain {

  public static void main(String[] args) {

    ConcreteChat mediator = new ConcreteChat();

    UsuarioVermelho usuarioVermelho = new UsuarioVermelho(mediator);
    UsuarioAzul usuarioAzul = new UsuarioAzul(mediator);
    UsuarioVerde usuarioVerde = new UsuarioVerde(mediator);

    usuarioVermelho.enviar("Mensagem do Vermelho");
    usuarioAzul.enviar("Mensagem do Azul");
    usuarioVerde.enviar("Mensagem do Verde");

  }

}