package com.lancrypt.lctenantmgmcmp.entities.repositories;

import com.lancrypt.lctenantmgmcmp.entities.ContactMessage;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface ContactMessageRepository extends CrudRepository<ContactMessage, UUID> {
}
