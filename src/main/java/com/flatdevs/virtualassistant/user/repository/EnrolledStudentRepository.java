package com.flatdevs.virtualassistant.user.repository;

import com.flatdevs.virtualassistant.user.entity.student.EnrolledStudentEntity;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface EnrolledStudentRepository extends CrudRepository<EnrolledStudentEntity, Long> {
}
