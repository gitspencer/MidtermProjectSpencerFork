package com.skilldistillery.skyreport.entities;

import java.time.LocalDateTime;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
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

	@Column(name = "location_id")
	private int locationId;

	@Column(name = "known_object_id")
	private int knownObjectId;
	
	@Column(name = "date_created")
	private LocalDateTime dateCreated;

	@Column(name = "last_update")
	private LocalDateTime lastUpdate;
	
	private String title;
	
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

	public int getLocationId() {
		return locationId;
	}

	public void setLocationId(int locationId) {
		this.locationId = locationId;
	}

	public int getKnownObjectId() {
		return knownObjectId;
	}

	public void setKnownObjectId(int knownObjectId) {
		this.knownObjectId = knownObjectId;
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
		return "Sighting [id=" + id + ", sightingDate=" + sightingDate + ", description=" + description + ", userId="
				+ userId + ", locationId=" + locationId + ", knownObjectId=" + knownObjectId + ", dateCreated="
				+ dateCreated + ", lastUpdate=" + lastUpdate + ", title=" + title + "]";
	}
	
	
}