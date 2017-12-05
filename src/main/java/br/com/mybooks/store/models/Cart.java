package br.com.mybooks.store.models;


import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Component;
import org.springframework.web.context.WebApplicationContext;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.Map;

@Component
@Scope(value = WebApplicationContext.SCOPE_SESSION, proxyMode = ScopedProxyMode.TARGET_CLASS)
public class Cart implements Serializable {

    private static final long serialVersionUID = 1L;

    private Map<CartItem, Integer> items = new LinkedHashMap<CartItem, Integer>();

    public Collection<CartItem> getItems() {
        return items.keySet();
    }

    public void add(CartItem item) {
        items.put(item, getQuantity(item) + 1);
    }

    public Integer getQuantity(CartItem item) {
        if (!items.containsKey(item)) {
            items.put(item, 0);
        }

        return items.get(item);
    }

    public int getQuantity() {
        return items.values().stream().reduce(0, (next, counter) -> next + counter);
    }

    public BigDecimal getTotal(CartItem item) {
        return item.getTotal(getQuantity(item));
    }

    public BigDecimal getTotal() {
        BigDecimal total = BigDecimal.ZERO;

        for (CartItem item : items.keySet()) {
            total = total.add(getTotal(item));
        }

        return total;
    }

    public void remove(Integer bookId, PriceType priceType) {
        Book book = new Book();
        book.setId(bookId);
        items.remove(new CartItem(book, priceType));
    }
}
