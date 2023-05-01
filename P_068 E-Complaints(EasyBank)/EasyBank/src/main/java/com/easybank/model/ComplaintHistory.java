package com.easybank.model;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;

import javax.persistence.*;

import org.hibernate.annotations.GenericGenerator;
import org.springframework.format.annotation.DateTimeFormat;

import com.easybank.enums.ComplaintActions;

import lombok.Data;

@Data
@Entity
@Table(name = "complaint_history")
public class ComplaintHistory implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;
	private String complaintId;
	private String name;
	@Lob
	private String feedback;
	private Integer modifiedEntityId;
	private String modifiedByRole;
	private LocalDateTime lastModifiedByDateTime=LocalDateTime.now();
	
	public ComplaintHistory() {
	}

	public ComplaintHistory(long id, String complaintId, String name, String feedback, Integer modifiedEntityId,
			String modifiedByRole, LocalDateTime lastModifiedByDateTime) {
		super();
		this.id = id;
		this.complaintId = complaintId;
		this.name = name;
		this.feedback = feedback;
		this.modifiedEntityId = modifiedEntityId;
		this.modifiedByRole = modifiedByRole;
		this.lastModifiedByDateTime = lastModifiedByDateTime;
	}

	
	
}
