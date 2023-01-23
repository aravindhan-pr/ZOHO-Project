
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.security.auth.Subject;
import javax.security.auth.callback.Callback;
import javax.security.auth.callback.CallbackHandler;
import javax.security.auth.callback.NameCallback;
import javax.security.auth.callback.PasswordCallback;
import javax.security.auth.login.LoginException;
import javax.security.auth.spi.LoginModule;


public class AuthLoginModule implements LoginModule {
    private CallbackHandler handler;
    private Subject subject;
    private UserPrincipal userPrincipal;
    private RolePrincipal rolePrincipal;
    private String login;
    private List<String> userGroups;
    
    @Override
    public void initialize(Subject subject, CallbackHandler callbackHandler, Map<String, ?> sharedState,
            Map<String, ?> options) {
        handler = callbackHandler;
        this.subject=subject;
       
    }
    private static boolean validate(String name,String password){
        return (
            name != null &&
            name.equals("admin") &&
            password !=null &&
            password.equals("1234")
        );
    }
    private static boolean check(String name,String password){
        
          try{
                Class.forName("org.postgresql.Driver");
                Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/trainDB", "postgres","Admin@123");
                Statement stmt = con.createStatement();
                String check = "select * from users where username = '" + name + "'and password = '"+password+"'";
                ResultSet rs = stmt.executeQuery(check);
                boolean flag = rs.next();
                return (flag);
          }
          catch(Exception e){
               return false;
          }
          
    }
    @Override
    public boolean login() throws LoginException {
        Callback[] callback = new Callback[2];
        callback[0] = new NameCallback("login");
        callback[1] = new PasswordCallback("password", true);
        try{
            handler.handle(callback);
            String name = ((NameCallback)callback[0]).getName();
            String password = String.valueOf(((PasswordCallback)callback[1]).getPassword());
            System.out.println(name);
            System.out.println(password);
            System.out.println(validate(name, password));
            System.out.println(check(name, password));
            if(
                validate(name, password)
            ){
            
                login=name;
                userGroups = new ArrayList<String>();
                userGroups.add("admin");
                return true;
            }
            else if (check(name,password)){
            
                login=name;
                userGroups = new ArrayList<String>();
                userGroups.add("user");
                return true;
            
            }else{
                throw new LoginException("Authentication Failed");
            }
        }catch(Exception ex){
            throw new LoginException(ex.getMessage());
        }
    }
    @Override
    public boolean abort() throws LoginException {
        return false;
    }

    @Override
    public boolean commit() throws LoginException {
        userPrincipal = new UserPrincipal(login);
        subject.getPrincipals().add(userPrincipal);
        if(
            userGroups != null &&
            userGroups.size()>0
        ){
            for(String groupName:userGroups){
                rolePrincipal = new RolePrincipal(groupName);
                subject.getPrincipals().add(rolePrincipal);
            }
        }
        return true;
    }
    @Override
    public boolean logout() throws LoginException {
        subject.getPrincipals().remove(userPrincipal);
        subject.getPrincipals().remove(rolePrincipal);
        return true;
    }
    
}
