package com.lancrypt.lctenantmgmcmp.security.model;

import com.lancrypt.lctenantmgmcmp.security.UserRoles;

import org.springframework.security.core.GrantedAuthority;

import java.util.Collection;
import java.util.Collections;

public class CurrentUserImpl implements CurrentUser {

    @Override
    public boolean isAdmin() {
        return hasRole(UserRoles.ROLE_ADMIN);
    }

    public String password;
    public Collection<GrantedAuthority> authorities = Collections.emptyList();
    public String userName;
    public String firstName;
    public String lastName;

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setAuthorities(Collection<GrantedAuthority> authorities) {
        this.authorities = authorities;
    }

    @Override
    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    @Override
    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    @Override
    public String getTenantId() {
        return null;
    }

    @Override
    public Collection<GrantedAuthority> getAuthorities() {
        return authorities;
    }

    @Override
    public boolean hasRole(UserRoles role) {
        return getAuthorities().stream().anyMatch(r -> r.getAuthority().equalsIgnoreCase(role.toString()));
    }
}
