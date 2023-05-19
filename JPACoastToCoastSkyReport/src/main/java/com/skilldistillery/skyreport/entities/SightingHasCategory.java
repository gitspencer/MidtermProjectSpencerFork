package com.skilldistillery.skyreport.entities;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class SightingHasCategory implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	@Column(name="sighting_id")
	private int sightingId;
	
	@Column(name="category_id")
	private int categoryId;

	public SightingHasCategory() {
		super();
	}

	public int getSightingId() {
		return sightingId;
	}

	public void setSightingId(int sightingId) {
		this.sightingId = sightingId;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public int hashCode() {
		return Objects.hash(categoryId, sightingId);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		SightingHasCategory other = (SightingHasCategory) obj;
		return categoryId == other.categoryId && sightingId == other.sightingId;
	}

	@Override
	public String toString() {
		return "SightingHasCategory [sightingId=" + sightingId + ", categoryId=" + categoryId + "]";
	}
	
	
	

}
