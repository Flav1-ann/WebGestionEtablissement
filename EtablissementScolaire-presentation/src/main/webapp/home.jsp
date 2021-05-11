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
    <script type="text/javascript" src="css/app.js"  defer> </script>
</head>

<body>
    <main class="container-fluid">
        <div class="row h-100">
            <div class="col-4 d-none d-lg-block"></div>
            <div class="col-lg-4 col-12 my-auto">
                <div class="row form_div">
                        <div class="row">
                            <div class="menu-button col-12">
                                <a href="createUser.jsp" class="col-12"> <button type="button" class="btn btn-primary btn-form col-12">Ajouter un étudiant</button></a>
                            </div>

                            <div class="menu-button col-12">
                                <a href="editEtudiant"> <button formmethod="post" type="submit" class="btn btn-primary btn-form col-12">Editer un étudiant</button></a>
                            </div>

                            <div class="menu-button col-12">
                                <a href="setCourse"> <button type="submit" formmethod="post" class="btn btn-primary btn-form col-12">Associer un cours à un étudiant</button></a>
                            </div>

                            <div class="menu-button col-12">
                                <a href="etudiantList">  <button formmethod="get" type="submit" class="btn btn-primary btn-form col-12">Lister les étudiants</button> </a>
                            </div>

                            <div class="menu-button col-12">
                                <a href="addNote" class="col-12"> <button type="button" class="btn btn-primary btn-form col-12">Ajouter une note</button></a>
                            </div>

                            <div class="menu-button col-12">
                                <a href="stat.jsp" class="col-12"> <button type="button" class="btn btn-primary btn-form col-12">Statistiques</button></a>
                            </div>
                            <div class="menu-button col-12">
                                <a href="disconnect" class="col-12"> <button type="button" class="btn btn-primary btn-form col-12">Déconnexion</button></a>
                            </div>
                        </div>

            </div>
            <div class="col-4 d-none d-lg-block"></div>
        </div>
        </div>
    </main>
</body>
</html>