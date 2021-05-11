package Servlets;

import eu.ensup.etablissementscolaire.Etudiant;
import eu.ensup.etablissementscolaire.EtudiantService;
import eu.ensup.etablissementscolaire.exception.CredentialException1;
import eu.ensup.etablissementscolaire.exception.etudiantExceptions.AddEtudiantServiceException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.Date;


@WebServlet(name = "etudiantAdd", value = "/etudiantAdd")
public class AddEtudiantController extends HttpServlet {
    public void init() {
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
            operations(request, response);

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
            operations(request, response);

    }

    protected void operations(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        EtudiantService etudiantService = new EtudiantService();
        HttpSession userSession = request.getSession();
        try {
            Date date = null;
            if(request.getParameter("birthDate") != null && !request.getParameter("birthDate").equals("")){
                 date = Date.valueOf(request.getParameter("birthDate"));
            }
        Etudiant etudiant = new Etudiant(request.getParameter("lastName"), request.getParameter("email"), request.getParameter("address"), request.getParameter("phone"), request.getParameter("firstName"), "", "", date);
        int ret;
        if(etudiant.getNom() == null || etudiant.getPrenom() == null || etudiant.getEmail() == null || etudiant.getTelephone() == null || etudiant.getAdresse() == null){
            ret = -2;
        } else {
            ret = etudiantService.create(etudiant);
        }

        if (ret == 0) {
            userSession.setAttribute("info", "L'étudiant à été crée");
            request.getRequestDispatcher("createUser.jsp").forward(request, response);
        } else if (ret == -1) {
            userSession.setAttribute("info", "Erreur lors de la creation de l'étudiant");
            request.getRequestDispatcher("createUser.jsp").forward(request, response);
        } else if (ret == -2){
            request.setAttribute("info", "Veuillez remplir tous les champs");
            request.getRequestDispatcher("createUser.jsp").forward(request, response);
        }

        } catch (AddEtudiantServiceException | CredentialException1 e) {
            request.setAttribute("info", e.getMessage());
            request.getRequestDispatcher("createUser.jsp").forward(request, response);
        }


    }

    public void destroy() {
    }
}
