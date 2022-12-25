package com.flatdevs.virtualassistant.courses.entity;

import com.flatdevs.virtualassistant.entity.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import java.util.List;

@Entity
@Table(name = "main_courses")
@Data
@EqualsAndHashCode(callSuper = true)
@NoArgsConstructor
public class MainCoursesEntity extends BaseEntity
{
    private String name;
    @OneToMany
    private List<CoursesEntity> courses;
}
