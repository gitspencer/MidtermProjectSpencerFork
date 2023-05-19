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

//	@Column(name="in_reply_to")
//	private int parentComment;

	@Column(name = "comment_date")
	private LocalDateTime commentDate;

	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;

	@OneToMany(mappedBy = "comment")
	private List<UserHasComment> userHasComments;

	public Comment() {
		super();
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

//	public int getInReplyTo() {
//		return inReplyTo;
//	}
//
//	public void setInReplyTo(int inReplyTo) {
//		this.inReplyTo = inReplyTo;
//	}

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
