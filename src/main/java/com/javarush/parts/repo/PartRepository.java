package com.javarush.parts.repo;

import com.javarush.parts.domain.Part;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.CrudRepository;



public interface PartRepository extends CrudRepository<Part, Integer> {
    Page<Part> findAll(Pageable pageable);
    Page<Part> findAllByPartNameLike(String partName, Pageable pageable);
    Page<Part> findAllByIsRequiredIsTrue(Pageable pageable);
    Page<Part> findAllByIsRequiredIsFalse(Pageable pageable);
}
