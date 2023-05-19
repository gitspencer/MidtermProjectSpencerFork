package com.skilldistillery.skyreport.entities;

import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class CommentVoteTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private CommentVote commentVote;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("CoastToCoastSkyReport");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		CommentVoteId uhc = new CommentVoteId();
		uhc.setCommentId(1);
		uhc.setUserId(1);
		commentVote = em.find(CommentVote.class, uhc);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		commentVote = null;
	}

	@Test
	void test() {
		assertNotNull(commentVote);
		assertTrue(commentVote.getCommentVote());

	}

	@Test
	void test_UserHasComment_User() {
		assertNotNull(commentVote);
		assertNotNull(commentVote.getUser());
		assertEquals("John", commentVote.getUser().getFirstName());

	}

	@Test
	void test_UserHasComment_Comment() {
		assertNotNull(commentVote);
		assertNotNull(commentVote.getComment());
		assertEquals(2023, commentVote.getComment().getCommentDate().getYear());
	}

}
