package com.lancrypt.lctenantmgmcmp.mapper;

import com.lancrypt.lctenantmgmcmp.api.dto.ContactMessageCreateDto;
import com.lancrypt.lctenantmgmcmp.entities.ContactMessage;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.ReportingPolicy;

@Mapper(componentModel = "spring", unmappedTargetPolicy = ReportingPolicy.ERROR)
public interface ContactMessageMapper {
    @Mapping(target = "userId", ignore = true)
    @Mapping(target = "updateDateTime", ignore = true)
    @Mapping(target = "creationDateTime", ignore = true)
    ContactMessage map(ContactMessageCreateDto createDto);
}
