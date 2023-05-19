package com.skilldistillery.skyreport.entities;

import java.time.LocalDateTime;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name="sighting_rating")
public class SightingRating{
	
	@EmbeddedId
	private SightingRatingId id;
	
	private int rating;
	
	@Column(name="rating_date")
	private LocalDateTime ratingDate;

	@Column(name="rating_comment")
	private String ratingComment;

	public SightingRating() {
		super();
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
		SightingRating other = (SightingRating) obj;
		return Objects.equals(id, other.id);
	}



	
	
	
}
