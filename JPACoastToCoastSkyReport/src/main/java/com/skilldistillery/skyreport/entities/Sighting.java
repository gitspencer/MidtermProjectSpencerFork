package com.skilldistillery.skyreport.entities;

import java.time.LocalDateTime;
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
import javax.persistence.OneToOne;

@Entity
public class Sighting {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "sighting_date")
	private LocalDateTime sightingDate;

	@Column(name = "picture_url")
	private String pictureUrl;

	private String description;

	@Column(name = "user_id")
	private int userId;
	
	@Column(name = "date_created")
	private LocalDateTime dateCreated;

	@Column(name = "last_update")
	private LocalDateTime lastUpdate;
	
	private String title;
	
	@OneToOne
	@JoinColumn(name = "location_id")
	private Location location;
	
	@OneToMany(mappedBy= "sighting")
	private List<SightingImage> sightingImage;
	
	@ManyToOne
	@JoinColumn(name= "known_object_id")
	private KnownObject knownObject;
	
	
	public Sighting() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public LocalDateTime getSightingDate() {
		return sightingDate;
	}

	public void setSightingDate(LocalDateTime sightingDate) {
		this.sightingDate = sightingDate;
	}

	public String getPictureUrl() {
		return pictureUrl;
	}

	public void setPictureUrl(String pictureUrl) {
		this.pictureUrl = pictureUrl;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}


	public KnownObject getKnownObject() {
		return knownObject;
	}

	public void setKnownObject(KnownObject knownObject) {
		this.knownObject = knownObject;
	}

	public LocalDateTime getDateCreated() {
		return dateCreated;
	}

	public void setDateCreated(LocalDateTime dateCreated) {
		this.dateCreated = dateCreated;
	}

	public LocalDateTime getLastUpdate() {
		return lastUpdate;
	}

	public void setLastUpdate(LocalDateTime lastUpdate) {
		this.lastUpdate = lastUpdate;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Location getLocation() {
		return location;
	}

	public void setLocation(Location location) {
		this.location = location;
	}

	public List<SightingImage> getSightingImage() {
		return sightingImage;
	}

	public void setSightingImage(List<SightingImage> sightingImage) {
		this.sightingImage = sightingImage;
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
		Sighting other = (Sighting) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "Sighting [id=" + id + ", sightingDate=" + sightingDate + ", pictureUrl=" + pictureUrl + ", description="
				+ description + ", userId=" + userId + ", dateCreated=" + dateCreated + ", lastUpdate=" + lastUpdate
				+ ", title=" + title + ", location=" + location + ", sightingImage=" + sightingImage + ", knownObject="
				+ knownObject + "]";
	}
	
	
}