package com.skilldistillery.skyreport.entities;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class SightingHasCategoryId implements Serializable{

	private static final long serialVersionUID = 1L;

	@Column(name = "sighting_id")
	private int sightingId;

	@Column(name = "category_id")
	private int categoryId;

	public SightingHasCategoryId() {
		super();
	}

	public SightingHasCategoryId(int sightingId, int categoryId) {
		super();
		this.sightingId = sightingId;
		this.categoryId = categoryId;
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
	public String toString() {
		return "SightingHasCategoryId [sightingId=" + sightingId + ", categoryId=" + categoryId + "]";
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
		SightingHasCategoryId other = (SightingHasCategoryId) obj;
		return categoryId == other.categoryId && sightingId == other.sightingId;
	}

}
