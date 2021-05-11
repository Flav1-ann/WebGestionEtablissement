<%@ page import="eu.ensup.etablissementscolaire.Etudiant" %>
<%@ page import="java.util.Set" %>
<%@ page import="eu.ensup.etablissementscolaire.Etudiant" %>
<%--
  Created by IntelliJ IDEA.
  User: Flavien
  Date: 22/04/2021
  Time: 16:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ajouter un éléve</title>
    <link href="css/style.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <script type="text/javascript" src="css/app.js" defer></script>
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
<main>
    <div class="container-fluid d-flex justify-content-center" >
        <div class="card shadow-lg">
                <fieldset class="form-row input">

                    <h2>Modification d'un étudiant</h2>
                    <div class="form-group" >
                        <label for="dropPicker">Sélectionner un étudiant:</label>
                        <select class="form-control" id="dropPicker">
                            <option value ="" selected disabled>--</option>

                            <% for(Etudiant e : (Set<Etudiant>) session.getAttribute("listEtudiant")){ %>
                                <option value="<%= e %>"><%= e.getNom() + " " +e.getPrenom() %></option>

                            <% } %>



                        </select>
                        <% for(Etudiant e : (Set<Etudiant>) session.getAttribute("listEtudiant")){ %>
                        <input type="hidden" id="<%= e.getId() %>" value="<%= e.getDateNaissance() %>">
                        <% } %>
                    </div>
                    <form action="editEtudiant">
                    <input type="hidden" class="form-control" id="id" placeholder="id" name="id">

                    <div class="form-group input">
                        <label for="name">Nom:</label>
                        <input  class="form-control" id="name" placeholder="Nom" name="lastName">
                    </div>

                    <div class="form-group input">
                        <label for="lastName">Prénom:</label>
                        <input  class="form-control" id="lastName" placeholder="Prénom" name="firstName">
                    </div>

                    <div class="form-group input">
                        <label for="address">Adresse:</label>
                        <input  class="form-control" id="address" placeholder="Adresse" name="address">
                    </div>

                    <div class="form-group input">
                        <label for="phone">Téléphone:</label>
                        <input  class="form-control" id="phone" placeholder="N° de téléphone" name="phone">
                    </div>

                    <div class="form-group input">
                        <label for="birthDate">Date de naissance:</label>
                        <input type="date" class="form-control" id="birthDate" placeholder="Date de naissance" name="birthDate">
                    </div>

                    <div class="form-group input">
                        <label for="email">Email:</label>
                        <input type="email" class="form-control" id="email" placeholder="Enter email" name="email">
                    </div>
                        <div class="form_error col-12">
                            <% if (request.getAttribute("info") !=null) {%>
                            <p id="form_info_text">${info}</p>
                            <% request.removeAttribute("info"); } %>
                        </div>
                    <div class="form-group btn-center" >
                      <button type="submit" class="btn btn-primary btn-form-udpate" formmethod="POST" id="btnUpdate" >Modifier</button>
                    </div>

                </form>
                </fieldset>
        </div>
    </div>
</main>
</body>
</html>

