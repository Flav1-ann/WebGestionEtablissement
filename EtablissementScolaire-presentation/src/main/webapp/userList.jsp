<%@ page import="eu.ensup.etablissementscolaire.Etudiant" %>
<%@ page import="java.util.Set" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fr">

<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="UTF-8">
    <title>Appli étudiant</title>
    <link href="css/style.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <script type="text/javascript" src="assets/js/app.js" defer> </script>
</head>

<body>
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark ">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="home.jsp">ACCUEIL</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="createUser.jsp">AJOUTER UN ÉTUDIANT</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="editEtudiant">ÉDITER UN ÉTUDIANT</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="setCourse">ASSOCIER UN COURS À UN ÉTUDIANT</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="etudiantList">LISTER LES ÉTUDIANTS</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="addNote">AJOUTER UNE NOTE</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="stat.jsp">STATISTIQUES</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="disconnect">DÉCONNEXION</a>
                    </li>
                </ul>
            </div>
        </nav>
    <main class="container-fluid">
        <div class="row h-100">

            <div class="col-4 d-none d-lg-block"></div>
            <div class="col-lg-4 col-12 my-auto">
                <div class="row form_div">

                    <table class="table text-center">
                        <thead>
                            <tr>
                                <th class="table-title" colspan="4">Liste des étudiants</th>
                            </tr>
                          <tr>
                            <th scope="col">Prénom</th>
                            <th scope="col">Nom</th>
                            <th scope="col">E-mail</th>
                          </tr>
                        </thead>
                        <tbody>
                        <%
                            for(Etudiant e : (Set<Etudiant>) session.getAttribute("listEtudiant")){

                        %>
                          <tr>
                            <td><%= e.getPrenom()%></td>
                            <td><%= e.getNom()%></td>
                            <td><%= e.getEmail()%></td>
                          </tr>
                        <%
                            }
                        %>
                        </tbody>
                      </table>
                </div>

            </div>
            <div class="form_error col-12">
                <% if (request.getAttribute("error") !=null) {%>
                <p id="form_info_text">${error}</p>
                <% request.removeAttribute("error"); } %>
            </div>
            <div class="col-4 d-none d-lg-block"></div>

    

        </div>
        </div>
    </main>
</body>

</html>