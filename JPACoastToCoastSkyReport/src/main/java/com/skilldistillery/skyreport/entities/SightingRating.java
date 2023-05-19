package com.skilldistillery.skyreport.entities;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class SightingRating implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	@Column(name="user_id")
	private int userId;
	
	@Column(name="sighting_id")
	private int sightingId;
	
	private int rating;
	
	@Column(name="rating_date")
	private LocalDateTime ratingDate;

	@Column(name="rating_comment")
	private String ratingComment;

	public SightingRating() {
		super();
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



	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public LocalDateTime getRatingDate() {
		return ratingDate;
	}

	public void setRatingDate(LocalDateTime ratingDate) {
		this.ratingDate = ratingDate;
	}

	public String getRatingComment() {
		return ratingComment;
	}

	public void setRatingComment(String ratingComment) {
		this.ratingComment = ratingComment;
	}

	@Override
	public String toString() {
		return "SightingRating [ rating=" + rating + ", ratingDate=" + ratingDate + ", ratingComment="
				+ ratingComment + "]";
	}



	@Override
	public int hashCode() {
		return Objects.hash(rating, ratingComment, ratingDate, sightingId, userId);
	}



	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		SightingRating other = (SightingRating) obj;
		return rating == other.rating && Objects.equals(ratingComment, other.ratingComment)
				&& Objects.equals(ratingDate, other.ratingDate) && sightingId == other.sightingId
				&& userId == other.userId;
	}
	
	
	
	
}
