public abstract class Usuario{

  private Mediator mediator;

    public Usuario(Mediator m) {
        mediator = m;
    }

    public void enviar(String msg) {
        mediator.enviar(msg, this);
    }


    public Mediator getMediator() {
        return mediator;
    }

    public abstract void receber(String msg);

}