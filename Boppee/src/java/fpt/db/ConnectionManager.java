/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fpt.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author NGUYEN THANH LUAN
 */
public class ConnectionManager {

    private static final String jdbcUrl = "jdbc:sqlserver://localhost:1433;databaseName=BoppeeDatabase;"
            + "encrypt=true;trustServerCertificate=true";
    private static final String jdbcUserName = "sa";
    private static final String jdbcPassword = "123";

    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        // Dung Class.forName de chuyen ten load
    	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        Connection conn = DriverManager.getConnection(jdbcUrl, jdbcUserName, jdbcPassword);
        return conn;
    }

    public static void closeConnection(ResultSet rs, PreparedStatement pstm, Connection conn) throws SQLException {
        if (rs != null) {
            rs.close();
        }
        if (pstm != null) {
            pstm.close();  
        }
        if (conn != null) {
            conn.close();
        }
    }
}
