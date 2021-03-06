package br.com.mybooks.store.daos;

import br.com.mybooks.store.models.User;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Repository
public class UserDao implements UserDetailsService {

    @PersistenceContext
    private EntityManager manager;

    public User loadUserByUsername(String email) {
        List<User> users = manager
                .createQuery("select u from User u where u.email = :email",
                User.class)
                .setParameter("email", email)
                .getResultList();

        if (users.isEmpty()){
            throw new UsernameNotFoundException("User " + email + " not found.");
        }

        return users.get(0);
    }
}
