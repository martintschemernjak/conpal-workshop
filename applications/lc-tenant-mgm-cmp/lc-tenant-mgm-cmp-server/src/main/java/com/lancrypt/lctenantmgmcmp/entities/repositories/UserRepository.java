package com.lancrypt.lctenantmgmcmp.entities.repositories;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.lancrypt.lctenantmgmcmp.entities.User;

@Repository
public interface UserRepository extends CrudRepository<User, UUID> {

    boolean existsByEmailAddress(String emailAddress);

    Optional<User> findByTenantIdAndId(UUID tenantId, UUID id);

    User findByKeyCloakIdClient(String keyCloakIdClient);

    List<User> findAllByTenantId(UUID tenantId);

    @Query("select u from User u join u.groups g where u.tenantId = :tenantId and :groupId = g.id")
    List<User> findAllByTenantIdAndGroupId(@Param("tenantId") UUID tenantId, @Param("groupId") UUID groupId);
}
