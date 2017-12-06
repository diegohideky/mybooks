package br.com.mybooks.store.builders;

import br.com.mybooks.store.models.Book;
import br.com.mybooks.store.models.Price;
import br.com.mybooks.store.models.PriceType;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

public class BookBuilder {
    private List<Book> books = new ArrayList<>();

    private BookBuilder(Book book) {
        books.add(book);
    }

    public static BookBuilder newBook(PriceType priceType, BigDecimal value) {
        Book book = create("book 1", priceType, value);
        return new BookBuilder(book);
    }

    public static BookBuilder newBook() {
        Book book = create("book 1", PriceType.COMBO, BigDecimal.TEN);
        return new BookBuilder(book);
    }

    private static Book create(String Bookname, PriceType priceType, BigDecimal value) {
        Book book = new Book();
        book.setTitle(Bookname);
        book.setReleaseDate(Calendar.getInstance());
        book.setPages(150);
        book.setDescription("Top book about tests");
        Price price = new Price();
        price.setType(priceType);
        price.setValue(value);
        book.getPrices().add(price);
        return book;
    }

    public BookBuilder more(int number) {
        Book base = books.get(0);
        Price price = base.getPrices().get(0);
        for (int i = 0; i < number; i++) {
            books.add(create("Book " + i, price.getType(), price.getValue()));
        }
        return this;
    }

    public Book buildOne() {
        return books.get(0);
    }

    public List<Book> buildAll() {
        return books;
    }
}
