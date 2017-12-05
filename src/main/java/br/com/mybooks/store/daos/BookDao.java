package br.com.mybooks.store.daos;

import br.com.mybooks.store.models.Book;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Repository
@Transactional
public class BookDao {

    @PersistenceContext
    private EntityManager manager;

    public void save(Book book) {
        manager.persist(book);
    }

    public List<Book> list() {
        return manager.createQuery("select b from Book b", Book.class).getResultList();
    }

    public Book find(Integer id) {
        return manager.createQuery("select distinct(b) from Book b " +
                "join fetch b.prices price where b.id = :id ", Book.class)
                .setParameter("id", id)
                .getSingleResult();
    }
}
