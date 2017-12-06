package br.com.mybooks.store.dao;

import br.com.mybooks.store.builders.BookBuilder;
import br.com.mybooks.store.conf.DataSourceConfigurationTest;
import br.com.mybooks.store.conf.JPAConfiguration;
import br.com.mybooks.store.daos.BookDao;
import br.com.mybooks.store.models.Book;
import br.com.mybooks.store.models.PriceType;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {JPAConfiguration.class, BookDao.class, DataSourceConfigurationTest.class})
@ActiveProfiles("test")
public class BookDaoTest {

    @Autowired
    private BookDao bookDao;

    @Test
    @Transactional
    public void mustSumAllPricesByPriceType() {
        List<Book> printedBooks = BookBuilder
                .newBook(PriceType.PRINTED, BigDecimal.TEN)
                .more(3).buildAll();

        List<Book> ebookBooks = BookBuilder
                .newBook(PriceType.EBOOK, BigDecimal.TEN)
                .more(3).buildAll();

        printedBooks.stream().forEach(bookDao::save);
        ebookBooks.stream().forEach(bookDao::save);

        BigDecimal value = bookDao.sumPricesByPriceType(PriceType.EBOOK);
        Assert.assertEquals(new BigDecimal(40).setScale(2), value);
    }
}
