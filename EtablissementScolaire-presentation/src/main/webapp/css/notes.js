function fildForm() {
    
  
    document.getElementById("idEtu").value = etu.id;
    document.getElementById("idCours").value = etu.name;
    document.getElementById("note").value = etu.lastName;

}


if (document.getElementById("studentselect") != null && document.getElementById("courseselect") != null && document.getElementById("noteselect") != null)
{
    let course ;
    let etudiant;
    let note;

    document.getElementById("courseselect").addEventListener("change",() =>{
        course = document.getElementById("courseselect").selectedOptions[0].value
        noteCoursEtudiant(course ,etudiant,note)
    });

    document.getElementById("studentselect").addEventListener("change",() =>{
        etudiant = document.getElementById("studentselect").selectedOptions[0].value
        noteCoursEtudiant(course ,etudiant,note)
    });

    document.getElementById("noteselect").addEventListener("change",() =>{
        note = document.getElementById("noteselect").selectedOptions[0].value
        noteCoursEtudiant(course ,etudiant,note)
    });



}

function noteCoursEtudiant(course ,etudiant, note){
    if (course != null && etudiant != null && note != null )
    {
        document.getElementById("button").setAttribute("value",course +" "+ etudiant+" "+note)
    }

}