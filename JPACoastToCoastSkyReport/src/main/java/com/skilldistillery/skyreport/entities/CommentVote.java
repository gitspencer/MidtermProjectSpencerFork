package com.skilldistillery.skyreport.entities;

import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;

@Entity
@Table(name = "user_has_comment")
public class CommentVote {
	@EmbeddedId
	private CommentVoteId id;

	@Column(name = "comment_vote")
	private Boolean commentVote;

	@ManyToOne
	@JoinColumn(name = "user_id")
	@MapsId(value = "userId")
	private User user;

	@ManyToOne
	@JoinColumn(name = "comment_id")
	@MapsId(value = "commentId")
	private Comment comment;

	public CommentVote() {
		super();
	}

	public CommentVoteId getId() {
		return id;
	}

	public void setId(CommentVoteId id) {
		this.id = id;
	}

	public Boolean getCommentVote() {
		return commentVote;
	}

	public void setCommentVote(Boolean commentVote) {
		this.commentVote = commentVote;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Comment getComment() {
		return comment;
	}

	public void setComment(Comment comment) {
		this.comment = comment;
	}

	@Override
	public String toString() {
		return "CommentVote [id=" + id + ", commentVote=" + commentVote + ", user=" + user + ", comment=" + comment
				+ "]";
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
		CommentVote other = (CommentVote) obj;
		return Objects.equals(id, other.id);
	}

}
