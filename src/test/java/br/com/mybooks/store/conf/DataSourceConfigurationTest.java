package br.com.mybooks.store.conf;


import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Profile;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import javax.sql.DataSource;

public class DataSourceConfigurationTest {

    @Bean
    @Profile("test")
    public DataSource dataSource() {
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setUsername("root");
        dataSource.setPassword("foto123");
        dataSource.setUrl("jdbc:mysql://localhost:3306/mybooks_test");
        dataSource.setDriverClassName("com.mysql.jdbc.Driver");

        return dataSource;
    }
}
