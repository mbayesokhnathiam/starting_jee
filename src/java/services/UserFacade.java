/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import models.User;

/**
 *
 * @author THIAM
 */
@Stateless
public class UserFacade extends AbstractFacade<User> implements UserFacadeLocal {

    @PersistenceContext(unitName = "IntroJEEPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public UserFacade() {
        super(User.class);
    }

    @Override
    public User getUser(String login, String pass) {
        User u=null;
        
        try {
            u = em.createQuery("SELECT u FROM User u WHERE u.login=:login AND u.password=:pass",User.class)
                    .setParameter("login", login).setParameter("pass", pass).getSingleResult();
        } catch (Exception e) {
        }
        
        return u;
    }
    
}
