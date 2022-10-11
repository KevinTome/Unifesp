
public class Main {

	public static void main(String[] args) {
		
		// Cria m�todo original e intermedi�rio
		BookSearch bs = new BookSearch();
		BookSearchProxy bsCache = new BookSearchProxy(bs);

		// Cria os livros
		Book B1 = new Book("Harry Potter", "Aventura");
		Book B2 = new Book("Senhor dos An�is", "Aventura");
		Book B3 = new Book("Akira", "Fic��o Cient�fica");
		Book B4 = new Book("B�blia", "Religi�o");
		Book B5 = new Book("A vida e morte de z�zinho", "Biografia");
		
		// Adiciona os livros no booksearch
		bs.addBook(B1);
		bs.addBook(B2);
		bs.addBook(B3);
		bs.addBook(B4);
		bs.addBook(B5);
		
		// Adiciona os livros no cache
		bsCache.addBook(B1);
		bsCache.addBook(B2);
		bsCache.addBook(B3);
		
		// Pesquisa no cache
		System.out.println(bsCache.getBook("Harry Potter"));
		System.out.println(bsCache.getBook("B�blia"));
		System.out.println(bsCache.getBook("Por que fazemos o que fazemos?"));
	}

}
