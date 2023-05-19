package com.skilldistillery.skyreport.entities;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class SightingRatingId implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	
	@Column(name="user_id")
	private int userId;
	

	@Column(name="sighting_id")
	private int sightingId;

	
	

	public SightingRatingId() {
		super();
	}


	public SightingRatingId(int userId, int sightingId) {
		super();
		this.userId = userId;
		this.sightingId = sightingId;
	}


	public int getUserId() {
		return userId;
	}


	public void setUserId(int userId) {
		this.userId = userId;
	}


	public int getSightingId() {
		return sightingId;
	}


	public void setSightingId(int sightingId) {
		this.sightingId = sightingId;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	

	@Override
	public int hashCode() {
		return Objects.hash(sightingId, userId);
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		SightingRatingId other = (SightingRatingId) obj;
		return sightingId == other.sightingId && userId == other.userId;
	}


	@Override
	public String toString() {
		return "SightingId [userId=" + userId + ", sightingId=" + sightingId + "]";
	}
	
	

}
