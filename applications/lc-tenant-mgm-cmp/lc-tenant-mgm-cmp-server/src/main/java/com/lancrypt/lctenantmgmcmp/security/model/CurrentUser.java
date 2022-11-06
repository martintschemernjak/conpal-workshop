package com.lancrypt.lctenantmgmcmp.security.model;

import com.lancrypt.lctenantmgmcmp.security.UserRoles;
import org.springframework.security.core.GrantedAuthority;

import java.util.Collection;

public interface CurrentUser {

    String getFirstName();
    String getLastName();
    String getUserName();
    boolean isAdmin();
    String getTenantId();

    Collection<GrantedAuthority> getAuthorities();

    boolean hasRole(UserRoles role);

}
