package com.easybank.dao;

import java.util.Collection;
import java.util.List;

import lombok.NonNull;
import org.springframework.data.jpa.repository.JpaRepository;

import com.easybank.model.Complaint;
import org.springframework.data.jpa.repository.Query;

public interface ComplaintRepository extends JpaRepository<Complaint, String>{

	//List<Complaint> findByFirstname(String firstname);

	List<Complaint> findAllByAssigntoIsNull();

	@Query("select c from Complaint c " +
			"where c.assignto is null or c.assignto is not null and c.status = ?1")
	List<Complaint> findByAssigntoNullOrAssigntoNotNullAndStatusAndAssigntoNotIn(@NonNull String status);
}
