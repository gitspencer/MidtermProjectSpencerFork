package com.skilldistillery.skyreport.entities;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;

@Entity
public class Category {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String name;

	private String description;

	@Column(name = "picture_url")
	private String pictureUrl;

	@OneToMany(mappedBy = "category")
	private List<KnownObject> knownObjects;

	@ManyToMany
	@JoinTable(name = "sighting_has_category", 
	joinColumns = @JoinColumn(name = "sighting_id"), 
	inverseJoinColumns = @JoinColumn(name = "category_id"))
	private List<Sighting> sightings;

	public Category() {
		super();
	}

	public List<Sighting> getSightings() {
		return sightings;
	}

	public void setSightings(List<Sighting> sightings) {
		this.sightings = sightings;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getPictureUrl() {
		return pictureUrl;
	}

	public void setPictureUrl(String pictureUrl) {
		this.pictureUrl = pictureUrl;
	}

	public List<KnownObject> getKnownObjects() {
		return knownObjects;
	}

	public void setKnownObjects(List<KnownObject> knownObjects) {
		this.knownObjects = knownObjects;
	}

	public void addSighting(Sighting sighting) {
		if (sightings == null) {
			sightings = new ArrayList<>();
		}
		if (!sightings.contains(sighting)) {
			sightings.add(sighting);
			sighting.addCategory(this);
		}
	}

	public void removeSighting(Sighting sighting) {
		if (sightings != null && sightings.contains(sighting)) {
			sightings.remove(sighting);
			sighting.removeCategory(this);
		}
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
		Category other = (Category) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "Category [id=" + id + ", name=" + name + ", description=" + description + "]";
	}

}
