import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;
import javax.servlet.http.HttpSession;


@WebServlet("/TwoFactor")
public class TwoFactor extends HttpServlet {

	

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession(false);  
         String username = (String)session.getAttribute("username");
		 String password = (String)session.getAttribute("password");
	     String code = request.getParameter("code");
		try {
			Class.forName("org.postgresql.Driver");
			Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/trainDB", "postgres","Admin@123");
            Statement stmt = con.createStatement();
			String check = "select * from users where username ='" + username + "'and password = '"+password+"'";
			ResultSet rs = stmt.executeQuery(check);
			if (rs.next()) {
				String secret = rs.getString("secret_key");
			    String otp = TwoAuth.getTOTPCode(secret);
                if(code.equals("1")){
				
				response.sendRedirect("user.jsp");
                }
				else{
					request.setAttribute("status", "Failed");
					response.sendRedirect("twoFactorAuth.jsp");
				}
			}
			
		} catch (SQLException | ClassNotFoundException e) {
           			e.printStackTrace();
					System.out.println(e);
		}
    }
   
	}

