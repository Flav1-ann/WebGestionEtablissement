package eu.ensup.etablissementscolaire;


import eu.ensup.etablissementscolaire.exception.CredentialException1;
import eu.ensup.etablissementscolaire.exception.responsableExceptions.*;
import eu.ensup.etablissementscolaire.exceptions.DaoException;



import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import java.util.Set;


/**
 * The type Responsable service.
 */
public class ResponsableService implements IResponsableService {

    private final ResponsableDao responsableDao = new ResponsableDao();
    private final PersonnePhysiqueService personnePhysiqueService = new PersonnePhysiqueService();

    @Override
    public int create(Responsable r) throws CredentialException1, AddResponsableServiceException {
        byte[] salt = personnePhysiqueService.createSalt();
        String hash = null;
        try {
            hash = personnePhysiqueService.generateHashPassword(r.getMotDePasse(), salt);
        }catch (NoSuchAlgorithmException e){
            throw new CredentialException1();
        }

        r.setSalt(Base64.getEncoder().encodeToString(salt));
        r.setMotDePasse(hash);
        try{
            return responsableDao.create(r);
        }catch (DaoException e){
            throw new AddResponsableServiceException();
        }
    }

    @Override
    public int update(Responsable r) throws UpdateResponsableServiceException {
        try{
            return responsableDao.update(r);
        }catch (DaoException e){
            throw new UpdateResponsableServiceException();
        }
    }

    @Override
    public int delete(int id) throws DeleteResponsableServiceException {
        try{
            return responsableDao.delete(id);
        }catch (DaoException e){
            throw new DeleteResponsableServiceException();
        }
    }

    @Override
    public Responsable get(int id) throws GetResponsableServiceException {
        try {
            return responsableDao.get(id);
        }catch (DaoException e){
            throw new GetResponsableServiceException();
        }
    }

    @Override
    public Set<Responsable> getAll() throws GetAllResponsableServiceException {
        try{
            return responsableDao.getAll();
        }catch (DaoException e){
            throw new GetAllResponsableServiceException();
        }
    }

    @Override
    public int validResponsableAuthentification(Responsable r, String password) throws NoSuchAlgorithmException {
        return personnePhysiqueService.validPersonnePhysique(r,password);
    }

    @Override
    public Responsable getCredentialByEmail(String email)  {
        try {
            return responsableDao.getCredentialByEmail(email);
        }  catch (DaoException e) {
            e.printStackTrace();
        }

        return null;
    }
    @Override
    public int validAuthentification(Responsable r, String password) throws NoSuchAlgorithmException, CredentialException1 {
        int errorCode = 0;
        if(r != null) {
            errorCode = personnePhysiqueService.validPersonnePhysique(r,password);
        }
        if(r == null || errorCode == 0){
            throw new CredentialException1();
        }
        else {
            return errorCode;
        }
    }
}
