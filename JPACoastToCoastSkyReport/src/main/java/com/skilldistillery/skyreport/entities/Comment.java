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

@Entity
public class Comment {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String content;
	
	@ManyToOne
	@JoinColumn(name = "in_reply_to")
	private Comment originalComment;
	
	@OneToMany(mappedBy = "originalComment")
	private List<Comment> replies;

	@Column(name = "comment_date")
	private LocalDateTime commentDate;

	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;

	@OneToMany(mappedBy = "comment")
	private List<UserHasComment> userHasComments;
	
	@ManyToOne
	@JoinColumn(name = "sighting_id")
	private Sighting sighting;
	
	public Comment() {
		super();
	}
	
	public Sighting getSighting() {
		return sighting;
	}

	public void setSighting(Sighting sighting) {
		this.sighting = sighting;
	}

	public List<UserHasComment> getUserHasComments() {
		return userHasComments;
	}

	public void setUserHasComments(List<UserHasComment> userHasComments) {
		this.userHasComments = userHasComments;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public LocalDateTime getCommentDate() {
		return commentDate;
	}

	public void setCommentDate(LocalDateTime commentDate) {
		this.commentDate = commentDate;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Comment getOriginalComment() {
		return originalComment;
	}

	public void setOriginalComment(Comment originalComment) {
		this.originalComment = originalComment;
	}

	public List<Comment> getReplies() {
		return replies;
	}

	public void setReplies(List<Comment> replies) {
		this.replies = replies;
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
		Comment other = (Comment) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "Comment [id=" + id + ", content=" + content + ", inReplyTo=" + ", commentDate=" + commentDate + "]";
	}

}
