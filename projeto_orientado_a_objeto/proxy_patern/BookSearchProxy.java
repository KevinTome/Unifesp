import java.util.HashMap;
import java.util.Map;

public class BookSearchProxy implements BookSearchInterface  {

	private Map<String, Book> books;
	private BookSearch bs;
	
    public BookSearchProxy(BookSearch bs) {
        this.books = new HashMap<String, Book>();
        this.bs = bs;
    }

    public String getBook(String titulo) {
        if (books.containsKey(titulo)) {
        	return titulo + ": encontrado em cache";     
        } else {
        	return bs.getBook(titulo);
        }
    }

    public boolean addBook(Book book) {
        Book copy = new Book(book);
        return books.put(copy.getTitulo(), copy) == null;
    }
    
}