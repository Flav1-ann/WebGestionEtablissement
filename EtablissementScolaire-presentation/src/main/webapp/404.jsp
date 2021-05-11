<%@ page language="java" isErrorPage="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
    </head>

    <body>
        <% if (session.getAttribute("user") !=null) { %>
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark ">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
                    aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
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
                            <a class="nav-link" href="   <a class="nav-link" href="addNote">AJOUTER UNE NOTE</a>">AJOUTER UNE NOTE</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="stat.jsp">STATISTIQUES</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="">DÉCONNEXION</a>
                        </li>
                    </ul>
                </div>
            </nav>
            <% } %>

                <main class="container-fluid">
                    <div class="row h-100">

                   

                        <div class="col-12 my-auto">
                            <div class="row form_div">
                         
                                <% if (session.getAttribute("user") !=null) { %>
                                    <h1>La page demandée est introuvable !</h1>
                                        <div class="menu-button col-12">
                                            <a href="home.jsp" class="col-12"> <button type="button"
                                                    class="btn btn-primary btn-form col-12">Retourner au
                                                    menu</button></a>
                                        </div>
                                        <% } else { %>
                                            <h1>La page demandée est introuvable et vous n'êtes pas connecté !</h1>
                                            <div class="menu-button col-12">
                                                <form action="login.jsp"> <button formmethod="post" type="submit"
                                                        class="btn btn-primary btn-form col-12">Me connecter</button></form>
                                            </div>
                                            <% } %>
                             
                                    </div>
                            </div>

                        </div>

                  

                   
                </main>
    </body>

    </html>