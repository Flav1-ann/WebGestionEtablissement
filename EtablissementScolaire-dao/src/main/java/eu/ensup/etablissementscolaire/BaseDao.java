package eu.ensup.etablissementscolaire;

import eu.ensup.etablissementscolaire.exceptions.CRUDException;
import eu.ensup.etablissementscolaire.exceptions.DaoException;

import java.sql.*;
import java.util.ResourceBundle;
import java.util.logging.Logger;


/**
 * The type Base dao.
 */
public class BaseDao {

    private final String url;
    private final String login;
    private final String password;
    private static Connection cn = null;
    private static Statement st = null;
    private static ResultSet rs = null;

    private static PreparedStatement ps = null;

    private static CallableStatement cs = null;

    private  static int result;

    /**
     * The constant logger.
     */
    final static Logger logger = Logger.getLogger(String.valueOf(BaseDao.class));


    /**
     * Instantiates a new Base dao.
     */
    public BaseDao() {
        ResourceBundle bundle = ResourceBundle.getBundle("db");
        this.url =bundle.getString("db.url");
        this.login = bundle.getString("db.username");
        this.password =bundle.getString("db.password");
    }

    /**
     * Connexion.
     *
     * @throws DaoException the dao exception
     */
    public void connexion() throws DaoException
    {
            try {
				cn = DriverManager.getConnection(url, login, password);
				st = cn.createStatement();
			}
            catch (SQLException e) {throw new CRUDException(e, "Database", "connexion");}
    }

    /**
     * Disconnect.
     *
     * @throws DaoException the dao exception
     */
    public void disconnect() throws DaoException
    {
        try {
        	if( rs != null )
        		rs.close();
        	if( cs != null )
        		cs.close();
        	if( ps != null )
        		ps.close();
        	if( st != null )
        		st.close();
        	if( cn != null )
        		cn.close();
        }
        catch (SQLException e) {
        	throw new CRUDException(e, "Database", "disconnect");
        }
    }

    /**
     * Gets ps.
     *
     * @return the ps
     */
    public static PreparedStatement getPs() {
        return ps;
    }

    /**
     * Sets ps.
     *
     * @param ps the ps
     */
    public static void setPs(PreparedStatement ps) {
        BaseDao.ps = ps;
    }

    /**
     * Gets cs.
     *
     * @return the cs
     */
    public static CallableStatement getCs() {
        return cs;
    }

    /**
     * Sets cs.
     *
     * @param cs the cs
     */
    public static void setCs(CallableStatement cs) {
        BaseDao.cs = cs;
    }

    /**
     * Gets cn.
     *
     * @return the cn
     */
    public static Connection getCn() {
        return cn;
    }

    /**
     * Sets cn.
     *
     * @param cn the cn
     */
    public static void setCn(Connection cn) {
        BaseDao.cn = cn;
    }

    /**
     * Gets st.
     *
     * @return the st
     */
    public static Statement getSt() {
        return st;
    }

    /**
     * Sets st.
     *
     * @param st the st
     */
    public static void setSt(Statement st) {
        BaseDao.st = st;
    }

    /**
     * Gets rs.
     *
     * @return the rs
     */
    public static ResultSet getRs() {
        return rs;
    }

    /**
     * Sets rs.
     *
     * @param rs the rs
     */
    public static void setRs(ResultSet rs) {
        BaseDao.rs = rs;
    }

    /**
     * Gets result.
     *
     * @return the result
     */
    public static int getResult() {
        return result;
    }

    /**
     * Sets result.
     *
     * @param result the result
     */
    public static void setResult(int result) {
        BaseDao.result = result;
    }
}
