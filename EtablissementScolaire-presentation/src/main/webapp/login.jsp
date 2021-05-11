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
    </head>

    <body>
        <main class="container-fluid">
            <div class="row h-100">
                <div class="col-4 d-none d-lg-block"></div>

                <div class="col-lg-4 col-12 my-auto">
                    <div class="row form_div">
                        <h2 class="col-12">Connexion</h2>
                        <form class="student_form col-12" action="aut">
                            <div class="row">
                                <div class="form-group col-12">
                                    <label for="login">Login</label>
                                    <input type="text" placeholder="login" class="form-control" name="login" id="login">
                                </div>

                                <div class="form-group col-12">
                                    <label for="password">Mot de passe</label>
                                    <input type="password" placeholder="mot de passe" class="form-control"
                                        name="password" id="password">
                                </div>

                                <div class="form_input col-12 ">
                                    <input class="btn btn-primary submit-btn-co" formmethod="post" type="submit"
                                        value="Connexion">
                                </div>

                                <div class="form_error col-12">
                                    <% if (request.getAttribute("error") !=null) {%>
                                        <p id="form_info_text">${error}</p>
                                        <% } %>
                                </div>

                            </div>


                        </form>
                    </div>

                </div>
                <div class="col-4 d-none d-lg-block"></div>
            </div>
            </div>
        </main>
    </body>

    </html>