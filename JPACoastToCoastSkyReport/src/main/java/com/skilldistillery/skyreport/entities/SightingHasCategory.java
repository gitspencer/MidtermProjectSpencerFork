package com.skilldistillery.skyreport.entities;

import java.util.Objects;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;

@Entity
@Table(name=" sighting_has_category")
public class SightingHasCategory{
@EmbeddedId
private SightingHasCategoryId id;

@ManyToOne
@JoinColumn(name = "category_id")
@MapsId(value = "categoryId")
private Category category;

@ManyToOne
@JoinColumn(name = "sighting_id")
@MapsId(value = "sightingId")
private Sighting sighting;

public SightingHasCategory() {
	super();
}

public SightingHasCategoryId getId() {
	return id;
}

public void setId(SightingHasCategoryId id) {
	this.id = id;
}

public Category getCategory() {
	return category;
}

public void setCategory(Category category) {
	this.category = category;
}

public Sighting getSighting() {
	return sighting;
}

public void setSighting(Sighting sighting) {
	this.sighting = sighting;
}

@Override
public String toString() {
	return "SightingHasCategory [id=" + id + ", category=" + category + ", sighting=" + sighting + "]";
}

@Override
public int hashCode() {
	return Objects.hash(id);
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
	return Objects.equals(id, other.id);
}


}