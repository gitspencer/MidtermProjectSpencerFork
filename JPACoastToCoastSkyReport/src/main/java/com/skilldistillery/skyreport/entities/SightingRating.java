package com.skilldistillery.skyreport.entities;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class SightingRating {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private int rating;
	
	@Column(name="rating_date")
	private LocalDateTime ratingDate;

	@Column(name="rating_comment")
	private String ratingComment;

	public SightingRating() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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
		return "SightingRating [id=" + id + ", rating=" + rating + ", ratingDate=" + ratingDate + ", ratingComment="
				+ ratingComment + "]";
	}
	
	
}
