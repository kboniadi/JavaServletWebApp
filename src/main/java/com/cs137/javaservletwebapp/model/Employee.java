package com.cs137.javaservletwebapp.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class Employee {
    private String profilePicUrl;
    private String name;
    private String title;
    private String email;
}
