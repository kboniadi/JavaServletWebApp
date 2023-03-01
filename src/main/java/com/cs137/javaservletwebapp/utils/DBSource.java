package com.cs137.javaservletwebapp.utils;


import org.apache.commons.dbcp2.BasicDataSource;

import javax.sql.DataSource;

public class DBSource {
    private static final BasicDataSource dataSource;

    static {
        dataSource = new BasicDataSource();
        dataSource.setDriverClassName("com.mysql.cj.jdbc.Driver"); //loads the jdbc driver
        dataSource.setUrl("jdbc:mysql://127.0.0.1:3306/db?allowPublicKeyRetrieval=true&autoReconnect=true&useSSL=false");
        dataSource.setUsername("user");
        dataSource.setPassword("secret");
        // Parameters for connection pooling
//        dataSource.setInitialSize(10);
//        dataSource.setMinIdle(1);
//        dataSource.setMaxIdle(6);
//        dataSource.setMaxTotal(10);
    }

    public static DataSource getDataSource() {
        return dataSource;
    }
}
