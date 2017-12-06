package br.com.mybooks.store.controllers;

import br.com.mybooks.store.daos.BookDao;
import br.com.mybooks.store.models.Book;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class HomeController {

    @Autowired
    private BookDao bookDao;

    @RequestMapping("/")
    @Cacheable(value = "booksHome")
    public ModelAndView index() {

        List<Book> books = bookDao.list();

        ModelAndView modelAndView = new ModelAndView("home");
        modelAndView.addObject("books", books);

        return modelAndView;
    }
}
