import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;

@WebServlet("/register")
public class register extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		try {
			Class.forName("org.postgresql.Driver");
			Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/trainDB", "postgres","Admin@123");

			Statement stmt = con.createStatement();
			String check = "select * from users where phone_number='" + username + "'";
			ResultSet rs = stmt.executeQuery(check);
			String sec_key = TwoAuth.generateSecretKey();
			if (!rs.next()) {
				PreparedStatement ps = con.prepareStatement("insert into users (phone_number,username,age,gender,berth_preference,password,secret_key,email) values(?,?,?,?,?,?,?,?)");
				ps.setString(1, request.getParameter("number"));
				ps.setString(2, request.getParameter("name"));
				ps.setInt(3, Integer.valueOf(request.getParameter("age")));
				ps.setString(4, request.getParameter("gender"));
				ps.setString(5, request.getParameter("berth"));
				ps.setString(6, password);
				ps.setString(7,sec_key);
				ps.setString(8,request.getParameter("email"));
				ps.executeUpdate();
				request.getRequestDispatcher("code.jsp").include(request,response);
			}
			else {
				request.setAttribute("status", "Failed");
				out.println("<html><body><b> Phone number exists PLEASE LOGIN!!" + "</b></body></html>");
				request.getRequestDispatcher("login.jsp").include(request,response);
				
			}
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
	
		}
	}
}