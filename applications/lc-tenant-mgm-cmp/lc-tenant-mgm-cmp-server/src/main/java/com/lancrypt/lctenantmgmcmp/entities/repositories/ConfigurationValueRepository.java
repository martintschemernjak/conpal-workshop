package com.lancrypt.lctenantmgmcmp.entities.repositories;

import java.util.UUID;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.lancrypt.lctenantmgmcmp.entities.ConfigurationValue;

@Repository
public interface ConfigurationValueRepository extends CrudRepository<ConfigurationValue, UUID> {

    ConfigurationValue findByConfigKey(String key);
}
