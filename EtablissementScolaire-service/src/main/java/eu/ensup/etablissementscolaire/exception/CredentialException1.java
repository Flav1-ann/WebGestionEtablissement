package eu.ensup.etablissementscolaire.exception;

/**
 * The type Credential exception.
 */
public class CredentialException1 extends ServiceException {

    /**
     * Instantiates a new Credential exception.
     */
    public CredentialException1() {
        super("Le mot de passe ou l'adresse mail..ne sont pas correcte... veuillez réessayer !");
    }
}