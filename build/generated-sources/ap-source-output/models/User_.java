package models;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import models.Profile;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2019-04-17T00:39:13")
@StaticMetamodel(User.class)
public class User_ { 

    public static volatile SingularAttribute<User, String> password;
    public static volatile SingularAttribute<User, Profile> profile;
    public static volatile SingularAttribute<User, String> photo;
    public static volatile SingularAttribute<User, Integer> id;
    public static volatile SingularAttribute<User, String> login;
    public static volatile SingularAttribute<User, String> nom;
    public static volatile SingularAttribute<User, String> prenom;
    public static volatile SingularAttribute<User, Boolean> changed;

}