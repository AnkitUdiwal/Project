import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/tableServlet")
public class TableServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<String> tableNames = getTableNames();
        request.setAttribute("tableNames", tableNames);
        request.getRequestDispatcher("show.jsp").forward(request, response);
    }

    private List<String> getTableNames() {
        List<String> tableNames = new ArrayList<>();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mvc", "root", "root");
            Statement statement = con.createStatement();
            ResultSet resultSet = statement.executeQuery("SHOW TABLES");

            while (resultSet.next()) {
                tableNames.add(resultSet.getString(1));
            }

            resultSet.close();
            statement.close();
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return tableNames;
    }
}
