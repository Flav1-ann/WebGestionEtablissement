package Servlets;

import eu.ensup.etablissementscolaire.Etudiant;
import eu.ensup.etablissementscolaire.EtudiantService;
import eu.ensup.etablissementscolaire.exception.CredentialException1;
import eu.ensup.etablissementscolaire.exception.etudiantExceptions.AddEtudiantServiceException;
import eu.ensup.etablissementscolaire.exception.etudiantExceptions.GetAllEtudiantServiceException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.Set;

@WebServlet(name = "AllEtudiant", value = "/etudiantList")
public class ListEtudiantController extends HttpServlet {

    public void init() {
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            operations(request,response);

    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            operations(request,response);

    }

    protected void operations(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EtudiantService etudiantService = new EtudiantService();
        HttpSession userSession = request.getSession();

        Set<Etudiant> List = null;
        try {
            List = etudiantService.getAll();

            userSession.setAttribute("listEtudiant",List);
        } catch (GetAllEtudiantServiceException  e) {
            request.setAttribute("error", e.getMessage());
        }
        request.getRequestDispatcher("userList.jsp").forward(request,response);

    }
}
