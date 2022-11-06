package com.lancrypt.lctenantmgmcmp.enums;

public enum KeyCloakEventType {
    LOGIN,
    LOGIN_ERROR,
    CODE_TO_TOKEN,
    SEND_VERIFY_EMAIL,
    SEND_VERIFY_EMAIL_ERROR,
    VERIFY_EMAIL, //account confirmed
    VERIFY_EMAIL_ERROR,
    CUSTOM_REQUIRED_ACTION
}
