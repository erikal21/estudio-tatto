package br.com.estudio.config;

import org.apache.commons.dbcp2.BasicDataSource;

import java.sql.Connection;
import java.sql.SQLException;

public class ConnectionPoolConfig {

    //Esse código vai abrir um datasource e gerenciar as conexões, reaproveitando conexões que foram abertas antes através do método getconection
    private static BasicDataSource dataSource;

    private ConnectionPoolConfig() {
        getDataSource();
    }
    private static BasicDataSource getDataSource() {

        if (dataSource == null) {

            dataSource = new BasicDataSource();
            dataSource.setUrl("jdbc:h2:~/test");
            dataSource.setUsername("sa");
            dataSource.setPassword("sa");
            dataSource.setMinIdle(5);   // Número mínimo de conexões ociosas no pool
            dataSource.setMaxIdle(10);  // Número máximo de conexões ociosas no pool
            dataSource.setMaxTotal(50); // Número máximo de conexões totais no pool

            System.out.println("Novo pool de conexões criado com sucesso.");

        }

        return dataSource;

    }

    public static Connection getConnection() throws SQLException {

        return getDataSource().getConnection();

    }

}


