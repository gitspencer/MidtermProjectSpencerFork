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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="known_object")
public class KnownObject {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String name;
	
	private String description;

	@Column(name="picture_url")
	private String pictureUrl;
	
	@OneToMany(mappedBy="knownObject")
	private List<Sighting> sightings;
	
	@ManyToOne
	@JoinColumn(name="category_id")
	private Category category;
	
	public KnownObject() {
		super();
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

	public List<Sighting> getSightings() {
		return sightings;
	}

	public void setSightings(List<Sighting> sightings) {
		this.sightings = sightings;
	}
	
	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}
	public void addSighting(Sighting sighting) {
		if (sightings == null) {sightings = new ArrayList<>(); }
		if ( ! sightings.contains(sighting)) {
			sightings.add(sighting);
			if (sighting.getKnownObject() != null) {
				sighting.getKnownObject().removeSighting(sighting);
			} 
			sighting.setKnownObject(this);
		}
	}
	public void removeSighting(Sighting sighting) {
		if (sightings != null && sightings.contains(sighting));
		sightings.remove(sighting);
		sighting.setKnownObject(this);
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
		KnownObject other = (KnownObject) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "KnownObject [id=" + id + ", name=" + name + ", description=" + description + "]";
	}
	
	
	
}
