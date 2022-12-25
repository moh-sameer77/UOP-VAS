package com.flatdevs.virtualassistant.courses.repository;

import com.flatdevs.virtualassistant.courses.entity.CoursesEntity;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CoursesRepository extends CrudRepository<CoursesEntity, Long> {

}
