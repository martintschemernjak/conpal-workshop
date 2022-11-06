package com.lancrypt.lctenantmgmcmp.services.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lancrypt.lctenantmgmcmp.entities.ConfigurationValue;
import com.lancrypt.lctenantmgmcmp.entities.repositories.ConfigurationValueRepository;
import com.lancrypt.lctenantmgmcmp.services.ConfigurationValueService;

@Service
public class ConfigurationValueServiceImpl implements ConfigurationValueService {

    private final ConfigurationValueRepository configurationValueRepository;

    public ConfigurationValueServiceImpl(ConfigurationValueRepository configurationValueRepository) {
        this.configurationValueRepository = configurationValueRepository;
    }

    @Transactional(readOnly = true)
    @Override
    public int findIntegerByKey(String key) {
        return Integer.parseInt(
            configurationValueRepository.findByConfigKey(key).getConfigValue());
    }

    @Transactional(readOnly = true)
    @Override
    public int findIntegerByKey(String key, int defaultValue) {
        ConfigurationValue result = configurationValueRepository.findByConfigKey(key);
        return result != null ? Integer.parseInt(result.getConfigValue()) : defaultValue;
    }

    @Transactional(readOnly = true)
    @Override
    public String findStringByKey(String key) {
        return configurationValueRepository.findByConfigKey(key).getConfigValue();
    }

    @Transactional(readOnly = true)
    @Override
    public String findStringByKey(String key, String defaultValue) {
        ConfigurationValue result = configurationValueRepository.findByConfigKey(key);
        return result != null ? result.getConfigValue() : defaultValue;
    }

    @Transactional(readOnly = true)
    @Override
    public String[] findStringArrayByKey(String key) {
        String configValue =
            configurationValueRepository.findByConfigKey(key).getConfigValue();
        return configValue.split(";");
    }

    @Transactional(readOnly = true)
    @Override
    public double findDoubleByKey(String key) {
        return Double.parseDouble(
            configurationValueRepository.findByConfigKey(key).getConfigValue());
    }

    @Transactional(readOnly = true)
    @Override
    public double findDoubleByKey(String key, double defaultValue) {
        ConfigurationValue result = configurationValueRepository.findByConfigKey(key);
        return result != null ? Double.parseDouble(result.getConfigValue()) : defaultValue;
    }

    @Transactional(readOnly = true)
    @Override
    public boolean findBooleanByKey(String key) {
        return Boolean.parseBoolean(
            configurationValueRepository.findByConfigKey(key).getConfigValue());
    }

    @Transactional(readOnly = true)
    @Override
    public boolean findBooleanByKey(String key, boolean defaultValue) {
        ConfigurationValue result = configurationValueRepository.findByConfigKey(key);
        return result != null ? Boolean.parseBoolean(result.getConfigValue()) : defaultValue;
    }
}
