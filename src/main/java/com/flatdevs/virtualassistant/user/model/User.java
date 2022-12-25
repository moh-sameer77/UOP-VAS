package com.flatdevs.virtualassistant.user.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Builder;
import lombok.Data;

import java.time.LocalDateTime;

@Builder
@Data
public class User
{
    private String firstName;
    private String lastName;
    private String email;
    private String gender;
    private LocalDateTime dateOfBirth;
    private String password;
    private String studentType;
    private String token;
}
