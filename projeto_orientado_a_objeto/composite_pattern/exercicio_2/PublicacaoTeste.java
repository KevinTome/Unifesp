import java.util.List;

public class PublicacaoTeste {
    
    public static void main(String[] args) {
        
        Publicacao colecao = new Colecao();
        
        Publicacao artigo1 = new Artigo("artigo de biologia");
        Publicacao artigo2 = new Artigo("artigo de fisica");
        
        artigo1.addAutor("silvia");
        artigo2.addAutor("espirito");
        
        colecao.addPublicacao(artigo1);
        colecao.addPublicacao(artigo2);
        
        String nome = colecao.toString();
        System.out.println(nome);
    }
   
}