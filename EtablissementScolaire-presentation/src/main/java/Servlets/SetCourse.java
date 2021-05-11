package Servlets;

import eu.ensup.etablissementscolaire.Cours;
import eu.ensup.etablissementscolaire.CoursService;
import eu.ensup.etablissementscolaire.Etudiant;
import eu.ensup.etablissementscolaire.EtudiantService;
import eu.ensup.etablissementscolaire.exception.CredentialException1;
import eu.ensup.etablissementscolaire.exception.coursExceptions.GetAllCoursServiceException;
import eu.ensup.etablissementscolaire.exception.coursExceptions.GetCoursServiceException;
import eu.ensup.etablissementscolaire.exception.coursExceptions.InscriptionCoursServiceException;
import eu.ensup.etablissementscolaire.exception.etudiantExceptions.AddEtudiantServiceException;
import eu.ensup.etablissementscolaire.exception.etudiantExceptions.GetAllEtudiantServiceException;
import eu.ensup.etablissementscolaire.exception.etudiantExceptions.GetEtudiantServiceException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.Set;

@WebServlet(name = "setCourse", value = "/setCourse")
public class SetCourse extends HttpServlet {
    public void init() {
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            operations(request,response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            operations(request,response);
    }

    protected void operations(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Set<Cours> listeCours = null;
        try {
            EtudiantService etudiantService = new EtudiantService();
            CoursService coursService = new CoursService();

            HttpSession userSession = request.getSession();


                listeCours = coursService.getAll();

            userSession.setAttribute("listCourse",listeCours);
            request.setAttribute("error", "");

            Set<Etudiant> List = etudiantService.getAll();
            userSession.setAttribute("listEtudiant",List);
            if (request.getParameter("error") != null){
                request.setAttribute("error", "");
            }
            if (request.getParameter("button") != null && !request.getParameter("button").isEmpty() && request.getParameter("button").split(" ").length >= 2){
                coursService.inscription(coursService.get(Integer.parseInt(request.getParameter("button").split(" ")[0]) ),etudiantService.get(Integer.parseInt(request.getParameter("button").split(" ")[1])));
                request.setAttribute("error", "Attribution du cour à réussi");

            }

        } catch (GetAllCoursServiceException | GetAllEtudiantServiceException | GetCoursServiceException |  GetEtudiantServiceException | InscriptionCoursServiceException e) {
            request.setAttribute("error", e.getMessage());
        }
        request.getRequestDispatcher("setCourse.jsp").forward(request,response);

    }
}
