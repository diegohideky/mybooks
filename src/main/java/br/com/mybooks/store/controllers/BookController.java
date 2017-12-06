package br.com.mybooks.store.controllers;

import br.com.mybooks.store.daos.BookDao;
import br.com.mybooks.store.infra.FileSaver;
import br.com.mybooks.store.models.Book;
import br.com.mybooks.store.models.PriceType;
import br.com.mybooks.store.validation.BookValidation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.persistence.NoResultException;
import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/books")
public class BookController {

    @Autowired
    private BookDao bookDao;

    @Autowired
    private FileSaver fileSaver;

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.addValidators(new BookValidation());
    }

    @RequestMapping("/form")
    public ModelAndView form(Book book) {
        ModelAndView modelAndView = new ModelAndView("books/form");
        modelAndView.addObject("types", PriceType.values());

        return modelAndView;
    }

    @RequestMapping(method = RequestMethod.POST)
    @CacheEvict(value = "booksHome", allEntries = true)
    public ModelAndView submit(MultipartFile summary, @Valid Book book, BindingResult result,
                               RedirectAttributes redirectAttributes) {
        System.out.print(summary.getOriginalFilename());

        if (result.hasErrors()) {
            return form(book);
        }

        String path = fileSaver.write("summary-files", summary);
        book.setSummaryPath(path);

        bookDao.save(book);

        redirectAttributes.addFlashAttribute("success", "Book inserted successfully");

        return new ModelAndView("redirect:books");
    }

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView list() {
        List<Book> books = bookDao.list();
        ModelAndView modelAndView = new ModelAndView("books/list");
        modelAndView.addObject("books", books);

        return modelAndView;
    }

    @RequestMapping("/detail/{id}")
    public ModelAndView detail(@PathVariable("id") Integer id) {
        ModelAndView modelAndView = new ModelAndView("books/detail");
        Book book = bookDao.find(id);

        modelAndView.addObject("book", book);

        return modelAndView;
    }
}
