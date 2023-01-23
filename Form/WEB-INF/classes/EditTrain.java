import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;

@WebServlet("/editTrain")
public class EditTrain extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
        try{
            Class.forName("org.postgresql.Driver");
            Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/trainDB", "postgres","Admin@123");
            Statement stmt = con.createStatement() ;
            String number = request.getParameter("number");
            ResultSet rs =stmt.executeQuery("select * from trains where train_number ='"+number+"'") ;
if(rs.next()){
    request.setAttribute("number", number);
    request.getRequestDispatcher("editTrainForm.jsp").include(request,response);

}
else{
    out.println("<html><body><b> No train found in this number!!" + "</b></body></html>");

    request.getRequestDispatcher("editTrain.jsp").include(request,response);
}
}
        catch(Exception e ){
            e.printStackTrace();

        }
    }
}