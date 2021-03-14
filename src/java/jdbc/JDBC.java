package jdbc;

import java.util.*;
import java.sql.*;
/**
 *
 * @author User
 */
public class JDBC 
{
    Connection con;
    String driver;
    String db;
    String url;
    String userName;
    String password;

    //use this constructor if using ConnectionPool
    public JDBC(){}

    public  void jdbc()
    {
        try
	{
            Class.forName (driver);
            con = DriverManager.getConnection(url, userName, password);

            DatabaseMetaData dma = con.getMetaData ();
            System.out.println("\nConnected to " + dma.getURL());
            System.out.println("Driver       " + dma.getDriverName());
            System.out.println("Version      " + dma.getDriverVersion());
            System.out.println("");
	}
        
	catch (SQLException ex)
	{
            while (ex != null)
            {
		System.out.println ("SQLState: " +
                                    ex.getSQLState ());
                System.out.println ("Message:  " +
                                    ex.getMessage ());
		System.out.println ("Vendor:   " +
                                    ex.getErrorCode ());
                ex = ex.getNextException ();
		System.out.println ("");
            }

            System.out.println("Connection to the database error");
	}
	catch (java.lang.Exception ex)
	{
            ex.printStackTrace ();
	}
    }
    
    // first db
    public Connection db1_connect(){
        this.driver = "com.mysql.jdbc.Driver";
        this.db = "phms";
        this.url = "jdbc:mysql://localhost:3306/"+db+"?";
        this.userName = "root";
        this.password = "";
        this.jdbc();
        return con;
    }

    public void jdbcConClose()
    {
	try
	{
            con.close();
	}
	catch (Exception ex)
	{
	}
    }
}
