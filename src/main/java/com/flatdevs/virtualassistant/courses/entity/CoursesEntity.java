package com.flatdevs.virtualassistant.courses.entity;

import com.flatdevs.virtualassistant.entity.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "courses")
@Data
@EqualsAndHashCode(callSuper = true)
@NoArgsConstructor
public class CoursesEntity extends BaseEntity
{
    private String name;
}
