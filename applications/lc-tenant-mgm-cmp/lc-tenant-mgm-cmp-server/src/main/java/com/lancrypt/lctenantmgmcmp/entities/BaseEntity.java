package com.lancrypt.lctenantmgmcmp.entities;

import java.time.LocalDateTime;
import java.util.Objects;
import java.util.UUID;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

import org.hibernate.Hibernate;
import org.hibernate.annotations.TypeDef;
import org.hibernate.type.UUIDCharType;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

@MappedSuperclass
@TypeDef(typeClass = UUIDCharType.class, defaultForType = UUID.class)
@EntityListeners(AuditingEntityListener.class)
public abstract class BaseEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private UUID id;

    @Version
    @NotNull
    protected Long version;

    @CreatedDate
    @NotNull
    @Column(updatable = false)
    protected LocalDateTime creationDateTime;
    @LastModifiedDate
    @NotNull
    protected LocalDateTime updateDateTime;

    public LocalDateTime getCreationDateTime() {
        return creationDateTime;
    }

    public LocalDateTime getUpdateDateTime() {
        return updateDateTime;
    }

    public UUID getId() {
        return id;
    }

    public Long getVersion() {
        return version;
    }

    @Override
    public boolean equals(Object o)
    {
        if (this == o)
        {
            return true;
        }
        // Note: Hibernate.getClass important here because for the entities it could be a proxy and then it is a
        // different class -> then equals would not work correctly
        if (o == null || Hibernate.getClass(this) != Hibernate.getClass(o))
        {
            return false;
        }
        BaseEntity that = (BaseEntity) o;
        return Objects.equals(id, that.id);
    }

    @Override
    public int hashCode()
    {
        return Objects.hash(id);
    }
}
