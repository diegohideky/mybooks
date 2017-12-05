package br.com.mybooks.store.models;


import java.io.Serializable;
import java.math.BigDecimal;

public class CartItem implements Serializable {

    private static final long serialVersionUID = 1L;

    private Book book;
    private PriceType priceType;

    public CartItem(Book book, PriceType priceType) {
        this.setBook(book);
        this.setPriceType(priceType);
    }

    public BigDecimal getPrice() {
        return book.priceTo(priceType);
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public PriceType getPriceType() {
        return priceType;
    }

    public void setPriceType(PriceType priceType) {
        this.priceType = priceType;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((book == null) ? 0 : book.hashCode());
        result = prime * result + ((priceType == null) ? 0 : priceType.hashCode());
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;

        CartItem other = (CartItem) obj;
        if (book == null) {
            if (other.book != null)
                return false;
        } else if (!book.equals(other.book))
            return false;

        if (priceType != other.priceType)
            return false;

        return true;
    }

    public BigDecimal getTotal(int quantity) {
        return this.getPrice().multiply(new BigDecimal(quantity));
    }
}
