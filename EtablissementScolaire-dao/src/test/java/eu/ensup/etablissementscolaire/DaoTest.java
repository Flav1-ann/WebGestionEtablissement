package eu.ensup.etablissementscolaire;
/*
import eu.ensup.etablissementscolaire.exceptions.DaoException;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import static org.hamcrest.Matchers.*;
import static org.hamcrest.Matchers.instanceOf;

import eu.ensup.etablissementscolaire.exceptions.DaoException;
import org.hamcrest.MatcherAssert;
import org.hamcrest.collection.*;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.fail;
import static org.mockito.Mockito.*;
import java.sql.Connection;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashSet;
/*
/**
 * Unit test for simple App.
 */
/*
public class DaoTest
{

    @Test
    @DisplayName("Test for database connexion")
    public void testConnection() {
        MatcherAssert.assertThat(BaseDao.getCn(), is(notNullValue()));
        MatcherAssert.assertThat( BaseDao.getCn(), instanceOf(Connection.class));
    }

    @Test
    @DisplayName("Test get Etudiant")
    public void testgetEtudiant() throws ParseException {
        try {

           EtudiantDao etudiantDao = new EtudiantDao();
            Etudiant thomas = etudiantDao.get(14);

            Etudiant thomasMock = when(etudiantDao.get(14)).thenReturn();
            System.out.println("thomas.getClass() : " + thomas.getClass());
            MatcherAssert.assertThat(thomas, is(notNullValue()));
            MatcherAssert.assertThat(thomas, instanceOf(Etudiant.class));
            //etudiantDao.get(1);
        } catch (DaoException de) {
            fail("Une erreur est survenue lors de la récupération de l'étudiant");
        }
    }
/*
    @Test
    @DisplayName("Test get all etudiant")
    public void testgetAllEtudiant() {
        try {
            EtudiantDao etudiantDao = new EtudiantDao();
            MatcherAssert.assertThat(etudiantDao.getAll().isEmpty(),  is(false) );
            MatcherAssert.assertThat( etudiantDao.getAll(), hasItems(is(instanceOf(Etudiant.class))) );
        } catch (DaoException de) {
           // fail("Une erreur est survenue lors de la récupération de l'étudiant");
        }
    }

   /* @Test
    @Disabled
    @DisplayName("Test for  connexion")
    public void testCreateEtudiant() {
        try {

            EtudiantDao etudiantDao = new EtudiantDao();
            long dateEtudiant = new SimpleDateFormat("yyyy/MM/dd").parse("1999/08/23").getTime();
            Etudiant maxime = new Etudiant("Dazin","maxime.dazin@gmail.com", " 1 bis avenue du 8 mai 1945", "0656889759", "Maxime", "RofHqpYnFRJzFfNs6J85/gMaepdLTPVQcM7eGcueY8E=","9S2dd0Xh0NMT6yUzd3bMFhfiui8=", new Date(dateEtudiant));
            int result = etudiantDao.create(maxime);
            MatcherAssert.assertThat( result, equalTo(0) );
        } catch (DaoException | ParseException de) {
            fail("Une erreur est survenue lors de du test de création de l'étudiant");
        }
    }


    @Test
    @DisplayName("Test get cours")
    public void testgetCours() {
        try {
            CoursDao coursDao = new CoursDao();

            Cours cours1 = coursDao.get(1);

            //System.out.println("thomas.getClass() : " + thomas.getClass());
            MatcherAssert.assertThat( cours1, is(notNullValue()) );
            MatcherAssert.assertThat( cours1, instanceOf(Cours.class) );
            /*Etudiant thomas = etudiantDao.get(1);
            System.out.println("thomas.getClass() : " + thomas.getClass());
            MatcherAssert.assertThat(thomas, instanceOf(Etudiant.class));
            //etudiantDao.get(1);
        } catch (DaoException de) {

        }
    }

    @Test
    @DisplayName("Test get Enseignant")
    public void testgetEnseignant() {
        try {
            EnseignantDao enseignantDao = new EnseignantDao();

            Enseignant enseignant1 = enseignantDao.get(1);

            //System.out.println("thomas.getClass() : " + thomas.getClass());
            MatcherAssert.assertThat( enseignant1, is(notNullValue()) );
            MatcherAssert.assertThat( enseignant1, instanceOf(Enseignant.class) );
            //etudiantDao.get(1);
        } catch (DaoException de) {
            //fail("Une erreur est survenue lors de la récupération de l'étudiant");
        }
    }

    @Test
    @DisplayName("Test get directeur")
    public void testgetDirecteur() {
        try {
            DirecteurDao directeurDao = new DirecteurDao();

            Directeur directeur1 = directeurDao.get(7);

            //System.out.println("thomas.getClass() : " + thomas.getClass());
            MatcherAssert.assertThat( directeur1, is(notNullValue()) );
            MatcherAssert.assertThat( directeur1, instanceOf(Directeur.class) );
            //etudiantDao.get(1);
        } catch (DaoException de) {
            //fail("Une erreur est survenue lors de la récupération de l'étudiant");
        }
    }

    @Test
    @DisplayName("Test get responsable")
    public void testgetResponsable() {
        try {
            ResponsableDao responsableDao = new ResponsableDao();

            Responsable responsable1 = responsableDao.get(9);

            //System.out.println("thomas.getClass() : " + thomas.getClass());
            MatcherAssert.assertThat( responsable1, is(notNullValue()) );
            MatcherAssert.assertThat( responsable1, instanceOf(Responsable.class) );
            //etudiantDao.get(1);

        } catch (DaoException de) {
            //fail("Une erreur est survenue lors de la récupération du responsable");
        }
    }

    @Test
    @DisplayName("Test get Matiere")
    public void testgetMatiere() {
        try {
            MatiereDao matiereDao = new MatiereDao();

            Matiere matiere1 = matiereDao.get(1);

            //System.out.println("thomas.getClass() : " + thomas.getClass());
            MatcherAssert.assertThat( matiere1, is(notNullValue()) );
            MatcherAssert.assertThat( matiere1, instanceOf(Matiere.class) );
            //etudiantDao.get(1);
        } catch (DaoException de) {
            //fail("Une erreur est survenue lors de la récupération de l'étudiant");
        }
    }*//*
}
*/