package com.skilldistillery.skyreport.entities;

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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.hibernate.annotations.CreationTimestamp;

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

	@CreationTimestamp
	@Column(name = "comment_date")
	private LocalDateTime commentDate;

	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;

	@OneToMany(mappedBy = "comment")
	private List<CommentVote> commentVotes;
	
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

	public List<CommentVote> getCommentVotes() {
		return commentVotes;
	}

	public void setCommentVotes(List<CommentVote> commentVotes) {
		this.commentVotes = commentVotes;
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
	
	public void addCommentVote(CommentVote commentVote) {
		if (commentVotes == null) {
			commentVotes = new ArrayList<>();
		}
		if (!commentVotes.contains(commentVote)) {
			commentVotes.add(commentVote);
			if (commentVote.getComment() != null) {
			 commentVote.getComment().removeCommentVote(commentVote);
			}
			commentVote.setComment(this);
		}
	}

	public void removeCommentVote(CommentVote commentVote) {
		if (commentVotes != null && commentVotes.contains(commentVote)) {
			commentVotes.remove(commentVote);
			commentVote.setComment(null);
		}
	}
	
	public void addReply(Comment reply) {
		if (replies == null) {
			replies = new ArrayList<>();
		}
		if (!replies.contains(reply)) {
			replies.add(reply);
			if (reply.getOriginalComment() != null) {
			 reply.getOriginalComment().removeReply(reply);
			}
			reply.setOriginalComment(this);
		}
	}

	public void removeReply(Comment reply) {
		if (replies != null && replies.contains(reply)) {
			replies.remove(reply);
			reply.setOriginalComment(null);
		}
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
