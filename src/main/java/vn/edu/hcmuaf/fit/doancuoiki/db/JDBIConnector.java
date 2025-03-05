package vn.edu.hcmuaf.fit.doancuoiki.db;

import com.mysql.cj.jdbc.MysqlDataSource;
import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.doancuoiki.model.Vehicle;

import java.sql.SQLException;
import java.util.List;
import java.util.stream.Collectors;

public class JDBIConnector {
    public static Jdbi jdbi;
    public static Jdbi getJdbi(){
        if(jdbi == null){
            connect();
        }
        return jdbi;
    }
    public static void connect(){
        MysqlDataSource dataSource = new MysqlDataSource();
//        url = jdbc:mysql://localhost:3306/minhdb
        dataSource.setURL("jdbc:mysql://"+Property.HOST+":"+Property.PORT+"/"+Property.DBNAME);
        dataSource.setUser(Property.USER);
        dataSource.setPassword(Property.PASSWORD);
        try {
            dataSource.setAutoReconnect(true);
            dataSource.setUseCompression(true);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        jdbi=Jdbi.create(dataSource);
    }

    public static void main(String[] args) {
        Jdbi jdbi = JDBIConnector.getJdbi();
        List<Vehicle> vehicles = jdbi.withHandle(handle -> {
            String sql = "SELECT * FROM vehicles";
            return handle.createQuery(sql).mapToBean(Vehicle.class).stream().collect(Collectors.toList());

        });
        System.out.println(vehicles);

    }
}
