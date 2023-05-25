package com.skilldistillery.skyreport.entities;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Sighting {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "sighting_date")
	private LocalDate sightingDate;

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

	@OneToMany(mappedBy = "sighting")
	private List<SightingImage> sightingImage;

	@ManyToOne
	@JoinColumn(name = "known_object_id")
	private KnownObject knownObject;

	@OneToMany(mappedBy = "sighting")
	private List<SightingRating> sightingRating;

	@ManyToMany(mappedBy = "sightings")
	private List<Category> categories;

	@OneToMany(mappedBy = "sighting")
	private List<Comment> comments;
	
	private boolean enabled;

	public Sighting() {
		super();
	}

	public List<Comment> getComments() {
		return comments;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}

	public List<Category> getCategories() {
		return categories;
	}

	public void setSightingHasCategory(List<Category> sightingHasCategory) {
		this.categories = sightingHasCategory;
	}

	public List<SightingRating> getSightingRating() {
		return sightingRating;
	}

	public void setSightingRating(List<SightingRating> sightingRating) {
		this.sightingRating = sightingRating;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public LocalDate getSightingDate() {
		return sightingDate;
	}

	public void setSightingDate(LocalDate sightingDate) {
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

	public void addCategory(Category category) {
		if (categories == null) {
			categories = new ArrayList<>();
		}
		if (!categories.contains(category)) {
			categories.add(category);
			category.addSighting(this);
		}

	}

	public void removeCategory(Category category) {
		if (categories != null && categories.contains(category)) {
			categories.remove(category);
			category.addSighting(this);
		}
	}

	public void addSightingRating(SightingRating sightingRatin) {
		if (sightingRating == null) {
			sightingRating = new ArrayList<>();
		}
		if (!sightingRating.contains(sightingRatin)) {
			sightingRating.add(sightingRatin);
			if (sightingRatin.getSighting() != null) {
				sightingRatin.getSighting().removeSightingRating(sightingRatin);
			}
			sightingRatin.setSighting(this);
		}
	}

	public void removeSightingRating(SightingRating sightingRatin) {
		if (sightingRating != null && sightingRating.contains(sightingRatin))
			;
		sightingRating.remove(sightingRatin);
		sightingRatin.setSighting(null);
	}

	public void addComment(Comment comment) {
		if (comments == null) {
			comments = new ArrayList<>();
		}
		if (!comments.contains(comment)) {
			comments.add(comment);
			if (comment.getSighting() != null) {
				comment.getSighting().removeComment(comment);
			}
			comment.setSighting(this);
		}
	}

	public void removeComment(Comment comment) {
		if (comments != null && comments.contains(comment))
			;
		comments.remove(comment);
		comment.setSighting(this);
	}

	public void addSightingImage(SightingImage sightingImag) {
		if (sightingImage == null) {
			sightingImage = new ArrayList<>();
		}
		if (!sightingImage.contains(sightingImag)) {
			sightingImage.add(sightingImag);
			if (sightingImag.getSighting() != null) {
				sightingImag.getSighting().removeSightingImage(sightingImag);
			}
			sightingImag.setSighting(this);
		}
	}

	public void removeSightingImage(SightingImage sightingImag) {
		if (sightingImage != null && sightingImage.contains(sightingImag))
			;
		sightingImage.remove(sightingImag);
		sightingImag.setSighting(this);
	}
	
	

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public void setCategories(List<Category> categories) {
		this.categories = categories;
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
				+ knownObject + ", enabled=" + enabled + "]";
	}

}