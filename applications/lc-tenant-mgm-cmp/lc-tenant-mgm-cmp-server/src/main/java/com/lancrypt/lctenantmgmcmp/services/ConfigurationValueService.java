package com.lancrypt.lctenantmgmcmp.services;

public interface ConfigurationValueService {

    int findIntegerByKey(String key);

    int findIntegerByKey(String key, int defaultValue);

    String findStringByKey(String key);

    String findStringByKey(String key, String defaultValue);

    String[] findStringArrayByKey(String key);

    double findDoubleByKey(String key);

    double findDoubleByKey(String key, double defaultValue);

    boolean findBooleanByKey(String key);

    boolean findBooleanByKey(String key, boolean defaultValue);
}
