package com.nddmwdf.program.servlet;

import com.nddmwdf.program.dao.AdminDao;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServlet;

public class CheckServlet extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        String username = new String(request.getParameter("username"));
        String pass = request.getParameter("password");
        AdminDao adminDao=new AdminDao();
            if(adminDao.isExists(username)==0)
            {
                adminDao.addUser(username,pass);
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
            else {
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }
        }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException
    {
        this.doGet(request,response);
    }
}
