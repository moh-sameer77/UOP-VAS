package com.flatdevs.virtualassistant.user.entity.student;

import com.flatdevs.virtualassistant.courses.entity.MainCoursesEntity;
import com.flatdevs.virtualassistant.entity.BaseEntity;
import com.flatdevs.virtualassistant.user.entity.UserEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

@Entity
@Table(name = "enrolled_users")
@Data
@EqualsAndHashCode(callSuper = true)
@NoArgsConstructor
public class EnrolledStudentEntity extends BaseEntity {
    @OneToOne
    private UserEntity user;
    private LocalDateTime dateOfBirth;
    private BigDecimal yearOfEnrollment;
    private String major;
    private BigDecimal academicYear;
    @ManyToMany
    private List<MainCoursesEntity> passedMainCourses;
}
