import java.util.HashMap;
import java.util.Map;

public class BookSearch implements BookSearchInterface  {

	private Map<String, Book> books;

    public BookSearch() {
        books = new HashMap<String, Book>();
    }

    public String getBook(String titulo) {
        if (books.containsKey(titulo))
            return titulo + ": encontrado na busca padrão";           

        return titulo + ": não encontrado";
    }

    public boolean addBook(Book book) {
        Book copy = new Book(book);
        return books.put(copy.getTitulo(), copy) == null;
    }
    
}