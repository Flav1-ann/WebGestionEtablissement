package Servlets;

import eu.ensup.etablissementscolaire.Etudiant;
import eu.ensup.etablissementscolaire.EtudiantService;
import eu.ensup.etablissementscolaire.exception.CredentialException1;
import eu.ensup.etablissementscolaire.exception.etudiantExceptions.AddEtudiantServiceException;
import eu.ensup.etablissementscolaire.exception.etudiantExceptions.GetAllEtudiantServiceException;
import eu.ensup.etablissementscolaire.exception.etudiantExceptions.UpdateEtudiantServiceException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Set;

@WebServlet(name = "editEtudiant", value = "/editEtudiant")
public class EditEtudiant extends HttpServlet {
    public void init() {
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
            operations(request,response);

    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
            operations(request,response);

    }

    protected void operations(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        EtudiantService etudiantService = new EtudiantService();
        HttpSession userSession = request.getSession();
        Set<Etudiant> List = null;
        try {
            List = etudiantService.getAll();

        userSession.setAttribute("listEtudiant",List);

        if(request.getParameter("id") != null && !request.getParameter("id").equals("")){
            Date date = null;
            if(request.getParameter("birthDate") != null && !request.getParameter("birthDate").equals("")){
                date = Date.valueOf(request.getParameter("birthDate"));
            }
            Etudiant etudiant = new Etudiant(Integer.parseInt(request.getParameter("id")),request.getParameter("firstName"), request.getParameter("email"), request.getParameter("address"), request.getParameter("phone"), request.getParameter("lastName"), "", "", date);

            if(etudiant.getNom() == null  || etudiant.getPrenom() == null || etudiant.getEmail() == null || etudiant.getTelephone() == null || etudiant.getAdresse() == null ){
                request.setAttribute("info", "Veuillez remplir tous les champs");
            } else {
                request.setAttribute("info", "Modification réussie");
                etudiantService.update(etudiant);

            }
            request.getRequestDispatcher("editEtudiant.jsp").forward(request,response);

        } else {
            request.setAttribute("info", "Veuillez sélectionnez un étudiant");
            request.getRequestDispatcher("editEtudiant.jsp").forward(request,response);
        }
        } catch (GetAllEtudiantServiceException | UpdateEtudiantServiceException e) {
            request.setAttribute("info", e.getMessage());
            request.getRequestDispatcher("editEtudiant.jsp").forward(request,response);
        }

    }
}
