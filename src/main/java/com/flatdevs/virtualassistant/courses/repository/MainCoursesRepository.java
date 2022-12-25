package com.flatdevs.virtualassistant.courses.repository;

import com.flatdevs.virtualassistant.courses.entity.MainCoursesEntity;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MainCoursesRepository extends CrudRepository<MainCoursesEntity, Long> {
}
