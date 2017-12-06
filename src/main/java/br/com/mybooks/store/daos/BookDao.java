package br.com.mybooks.store.daos;

import br.com.mybooks.store.models.Book;
import br.com.mybooks.store.models.PriceType;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import java.math.BigDecimal;
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

    public BigDecimal sumPricesByPriceType(PriceType priceType) {
        TypedQuery<BigDecimal> query = manager
            .createQuery("select sum(price.value) from Book b " +
                "join b.prices price where price.type = :priceType", BigDecimal.class);

        query.setParameter("priceType", priceType);

        return query.getSingleResult();
    }
}
