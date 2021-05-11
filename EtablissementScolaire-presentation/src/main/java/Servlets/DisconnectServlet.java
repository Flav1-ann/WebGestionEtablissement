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
import java.io.IOException;
import java.security.NoSuchAlgorithmException;

@WebServlet(name = "disconnect", value = "/disconnect")
public class DisconnectServlet extends HttpServlet {



    public void init() {
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException {
            operations(request,response);

    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws  ServletException {
            operations(request,response);

    }

    protected void operations(HttpServletRequest request, HttpServletResponse response) throws ServletException{
        HttpSession userSession = request.getSession();
        userSession.removeAttribute("user");
        try {
            request.getRequestDispatcher("login.jsp").forward(request,response);
        } catch (IOException e) {
            request.setAttribute("error", e.getMessage());
        }
    }

    public void destroy() {
    }


}
