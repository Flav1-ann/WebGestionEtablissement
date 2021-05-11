<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="eu.ensup.etablissementscolaire.exceptions.DaoException" %>
<%@ page import="eu.ensup.etablissementscolaire.EtudiantService" %>
<%@ page import="eu.ensup.etablissementscolaire.NoteEleveService" %>
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.1.1/chart.min.js"
            integrity="sha512-BqNYFBAzGfZDnIWSAEGZSD/QFKeVxms2dIBPfw11gZubWwKUjEgmFUtUls8vZ6xTRZN/jaXGHD/ZaxD9+fDo0A=="
            crossorigin="anonymous"></script>
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

            <div class="row">
                <div class="col-5 chart-container">
                    <canvas id="myChart" width="800" height="450"></canvas>
                </div>
                <%
                    EtudiantService etudiantService = new EtudiantService();
                    NoteEleveService eleveService = new NoteEleveService();
                    int[] repartition = {0, 0, 0, 0};

                    try {
                        Map<Integer, List<Float>> etudiantsNotes  = eleveService.FindNoteEtudiant();

                        for (Map.Entry<Integer, List<Float>> entry : etudiantsNotes.entrySet()) {
                            repartition = etudiantService.niveauEleve(repartition, entry.getValue());
                        }

                    } catch (DaoException e) {
                        request.setAttribute("error", e.getMessage());
                    }

                %>
                <script>
                    var ctx = document.getElementById('myChart').getContext('2d');
                    var myChart = new Chart(ctx, {
                        type: 'bar',
                        data: {
                            labels: ['Mauvais', 'Moyens', 'Bons', 'Excellents'],
                            datasets: [{
                                label: 'Niveau des élèves',
                                data: [<%= repartition[0]%>, <%= repartition[1]%>,  <%= repartition[2]%>,  <%= repartition[3]%>],
                                backgroundColor: [
                                    'rgba(255, 99, 132, 1)',
                                    'rgba(54, 162, 235, 1)',
                                    'rgba(255, 206, 86, 1)',
                                    'rgba(75, 192, 192, 1)',
    
                                ],
                                borderColor: [
                                    'rgba(255, 99, 132, 1)',
                                    'rgba(54, 162, 235, 1)',
                                    'rgba(255, 206, 86, 1)',
                                    'rgba(75, 192, 192, 1)',
    
                                ],
                                borderWidth: 1
                            }]
                        },
                        options: {
                            scales: {
                                y: {
                                    beginAtZero: true
                                }
                            }
                        }
                    });
    
    
                </script>
                <div class="col-2"></div>
                <div class="col-5 chart-container">
                    <canvas id="myChart2" width="800" height="450"></canvas>
                </div>
                <script>
                    var ctx = document.getElementById('myChart2').getContext('2d');
                    const data = {
                        labels: ['Mauvais', 'Moyens', 'Bons', 'Excellents'],
                        datasets: [{
                            label: 'My First Dataset',
                            data: [<%= repartition[0]%>, <%= repartition[1]%>,  <%= repartition[2]%>,  <%= repartition[3]%>],
                            backgroundColor: [
                                'rgb(255, 99, 132)',
                                'rgb(54, 162, 235)',
                                'rgb(255, 205, 86)',
                                'rgb(255, 120, 86)'
                            ],
                            hoverOffset: 4
                        }]
                    };
                    const config = {
                        type: 'doughnut',
                        data: data,
                    };
    
                    var myChart = new Chart(ctx, config);
    
    
                </script>
                <div class="form_error col-12">
                    <% if (request.getAttribute("error") !=null) {%>
                    <p id="form_info_text">${error}</p>
                    <% request.removeAttribute("error"); } %>
                </div>
            </div>

            
        </main>
    </body>
    </html>