package com.easybank.model;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

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
