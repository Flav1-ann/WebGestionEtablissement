package Servlets;


import eu.ensup.etablissementscolaire.Responsable;
import eu.ensup.etablissementscolaire.ResponsableService;
import eu.ensup.etablissementscolaire.exception.CredentialException1;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.security.NoSuchAlgorithmException;


@WebServlet(name = "aut", value = "/aut")
public class AuthServlet extends HttpServlet {

    public void init() {
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            operations(request,response);

    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            operations(request,response);

    }

    protected void operations(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession userSession = request.getSession();
        try {
        String email = request.getParameter("login");
        String pwd = request.getParameter("password");

        userSession.removeAttribute("user");

        ResponsableService responsableService = new ResponsableService();

        Responsable user;

        user = responsableService.getCredentialByEmail(email);

            responsableService.validAuthentification(user, pwd);
            userSession.setAttribute("user",user);
            request.getRequestDispatcher("home.jsp").forward(request,response);
        } catch (CredentialException1 | NoSuchAlgorithmException | IOException e){
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("login.jsp").forward(request,response);
        }
    }

    public void destroy() {
    }
}
