package br.com.mybooks.store.controllers;

import br.com.mybooks.store.conf.AppWebConfiguration;
import br.com.mybooks.store.conf.DataSourceConfigurationTest;
import br.com.mybooks.store.conf.JPAConfiguration;
import br.com.mybooks.store.conf.SecurityConfiguration;
import br.com.mybooks.store.daos.BookDao;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import javax.servlet.Filter;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(classes = {JPAConfiguration.class, AppWebConfiguration.class,
        DataSourceConfigurationTest.class, SecurityConfiguration.class})
@ActiveProfiles("test")
public class BookControllerTest {

    @Autowired
    private WebApplicationContext wac;

    private MockMvc mockMvc;

    @Autowired
    private Filter springSecurityFilterChain;

    @Before
    public void setup() {
        this.mockMvc = MockMvcBuilders.webAppContextSetup(wac)
                .addFilter(springSecurityFilterChain).build();
    }

    @Test
    public void mustReturnToHomeWithTheBooks() throws Exception {
        mockMvc.perform(MockMvcRequestBuilders.get("/"))
                .andExpect(MockMvcResultMatchers.model().attributeExists("books"))
                .andExpect(MockMvcResultMatchers
                        .forwardedUrl("/WEB-INF/views/home.jsp"));
    }

    @Test
    public void onlyAdminMustAccessBooksForm() throws Exception {
        mockMvc.perform(MockMvcRequestBuilders.get("/books/form")
                .with(SecurityMockMvcRequestPostProcessors
                    .user("user@mybooks.com").password("123456")
                    .roles("USER")))
                .andExpect(MockMvcResultMatchers.status().is(403));
    }
}
