import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/show1")
public class show1 extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/mvc", "root", "root");
			String tname = request.getParameter("tableName");
			String query = "SELECT * FROM " + tname;

			Statement statement = connection.createStatement();
			ResultSet resultSet = statement.executeQuery(query);

			out.println("<html>");
			out.println("<head><title>Data from Table</title></head>");
			out.println("<body>");

			while (resultSet.next()) {
				String name = resultSet.getString("name");
				out.println("Name: " + name + "<br>");
			}

			out.println("</body>");
			out.println("</html>");

			resultSet.close();
			statement.close();
			connection.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
