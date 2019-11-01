import com.nddmwdf.program.dao.UserDao;
import com.nddmwdf.program.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/UserLogin")
public class UserLogin extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        User user=new User();
        UserDao userDao=new UserDao();
        String name=new String(request.getParameter("username").getBytes("iso-8859-1"),"utf-8");
        String pwd=new String(request.getParameter("password").getBytes("iso-8859-1"),"utf-8");
        user.setLoginName(name);
        user.setLoginPass(pwd);
        String userName=user.getLoginName();
        try
        {
            if(userDao.validateUser(user))
            {
                request.getSession().setAttribute("username",userName);
                request.getRequestDispatcher("forjsp/index.jsp").forward(request,response);
            }
            else
            {
                request.getRequestDispatcher("forjsp/login.jsp").forward(request,response);
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
}
