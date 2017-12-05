package br.com.mybooks.store.controllers;

import br.com.mybooks.store.daos.BookDao;
import br.com.mybooks.store.models.Book;
import br.com.mybooks.store.models.Cart;
import br.com.mybooks.store.models.CartItem;
import br.com.mybooks.store.models.PriceType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

@Controller
@Scope(value = WebApplicationContext.SCOPE_REQUEST)
@RequestMapping("/cart")
public class CartController {

    @Autowired
    private BookDao bookDao;

    @Autowired
    private Cart cart;

    @RequestMapping("/add")
    public ModelAndView add(Integer bookId, PriceType priceType) {
        ModelAndView modelAndView = new ModelAndView("redirect:/cart");
        CartItem cartItem = createItem(bookId, priceType);

        cart.add(cartItem);

        return modelAndView;
    }

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView items() {
        return new ModelAndView("carts/items");
    }

    @RequestMapping("/remove")
    public ModelAndView remove(Integer bookId, PriceType priceType) {
        cart.remove(bookId, priceType);

        return new ModelAndView("redirect:/cart");
    }

    private CartItem createItem(Integer bookId, PriceType priceType) {
        Book book = bookDao.find(bookId);
        CartItem cartItem = new CartItem(book, priceType);
        return cartItem;
    }
}
