import java.sql.*;
import java.util.Map;

public class DBconnect {
    Connection connection;
    public DBconnect() {
        Connection c;

        try {
            Class.forName("org.sqlite.JDBC");
            this.connection = DriverManager.getConnection("jdbc:sqlite:accesDB.db");
            c = this.connection;
            Statement statement = c.createStatement();
            String s = "SELECT * FROM NumberPlates";
            ResultSet rs = statement.executeQuery(s);


        } catch ( Exception e ) {
            System.err.println( e.getClass().getName() + ": " + e.getMessage() );
            System.exit(0);
        }
        System.out.println("Opened database successfully");
    }
    private Map<Integer, NoPlate> numberPlates;

    public NoPlate get(String NumberPlate) {
        return numberPlates.get(NumberPlate);
    }

}
