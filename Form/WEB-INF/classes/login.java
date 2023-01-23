import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;


@WebServlet("/login")
public class login extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String username = request.getParameter("username");
		String password = request.getParameter("password");
        if(username.equals("admin")&&password.equals("1234")){
				
			request.login(username, password);
            response.sendRedirect("admin.jsp");
        }
        else{
		try {
			Class.forName("org.postgresql.Driver");
			Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/trainDB", "postgres","Admin@123");
            Statement stmt = con.createStatement();
			String check = "select * from users where username ='" + username + "'and password = '"+password+"'";
			ResultSet rs = stmt.executeQuery(check);
			if (rs.next()) {
				String phone_number = rs.getString("phone_number");
				HttpSession session = request.getSession();
				session.setAttribute("phNumber", phone_number );	
				session.setAttribute("username", username);
                session.setAttribute("password",password);
				request.login(username, password);
				response.sendRedirect("twoFactorAuth.jsp");
			}
			else {
			
				request.setAttribute("status", "Failed");
				request.getRequestDispatcher("login.jsp").forward(request,response);
						}
		} catch (SQLException | ClassNotFoundException e) {
           			e.printStackTrace();
		}
    }
   
	}
}
