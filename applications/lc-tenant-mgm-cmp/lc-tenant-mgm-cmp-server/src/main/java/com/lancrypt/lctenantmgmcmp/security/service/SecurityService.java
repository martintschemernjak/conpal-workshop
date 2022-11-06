package com.lancrypt.lctenantmgmcmp.security.service;

import com.lancrypt.lctenantmgmcmp.security.model.CurrentUser;

public interface SecurityService {

    CurrentUser getCurrentUser();

    String getUserName();
}
