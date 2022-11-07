package com.lancryptws.wsspringbackend.mapper;


import com.lancryptws.wsspringbackend.dto.UserCreateDto;
import com.lancryptws.wsspringbackend.dto.UserViewDto;
import com.lancryptws.wsspringbackend.entities.User;
import org.mapstruct.*;


@Mapper(componentModel = "spring", unmappedTargetPolicy = ReportingPolicy.ERROR)
public interface UserMapper {

    @Mapping(target = "updateDateTime", ignore = true)
    @Mapping(target = "creationDateTime", ignore = true)
    User map(UserCreateDto createDto);

    UserViewDto map(User user);
}
