import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;

@WebServlet("/showTrain")
public class showTrain extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
        try{
            Class.forName("org.postgresql.Driver");
            Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/trainDB", "postgres","Admin@123");
            Statement stmt = con.createStatement() ;
            String starting = request.getParameter("starting");
            String ending = request.getParameter("ending");
            ResultSet rs =stmt.executeQuery("select * from trains where starting_point ='"+starting+"' and ending_point='"+ending+"'");
            String phone_number = request.getParameter("phNum");
if(rs.next()){
    request.setAttribute("starting", starting);
    request.setAttribute("ending", ending);
    request.setAttribute("phNum", phone_number );
    request.getRequestDispatcher("trainlist.jsp").include(request,response);
}
else{
    out.println("<html><body><b> No train available in this route" + "</b></body></html>");
    request.getRequestDispatcher("user.jsp").include(request,response);
}



        }
        catch(Exception e ){
            e.printStackTrace();

        }
    }
}