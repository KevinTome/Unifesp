public class Book {

    private String titulo, genero;

    public Book(String titulo, String genero) {
        this.titulo = titulo;
        this.genero = genero;
    }

    public Book(Book book) {
        this.titulo = book.titulo;
        this.genero = book.genero;
    }
    
	public String getTitulo() {
		return this.titulo;
	}
   
}