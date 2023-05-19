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

class CommentTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Comment comment;

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
		comment = em.find(Comment.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		comment = null;
	}

	@Test
	void test() {
		assertNotNull(comment);
		assertNotNull(comment.getCommentDate());
		assertEquals(2023, comment.getCommentDate().getYear());
	}

	@Test
	void test_UserHasComment_to_comment() {
		assertNotNull(comment);
		assertNotNull(comment.getCommentVotes());
		assertTrue(comment.getCommentVotes().size() > 0);
	}
	
	@Test
	void test_Comment_User() {
		assertNotNull(comment);
		assertNotNull(comment.getUser());
		assertEquals("John", comment.getUser().getFirstName());
	}
	
	@Test
	void test_Comment_Sighting() {
		assertNotNull(comment);
		assertNotNull(comment.getSighting());
		assertEquals(1947, comment.getSighting().getSightingDate().getYear());
	}
	
	@Test
	void test_Comment_SelfJoin() {
		assertNotNull(comment);
		assertNull(comment.getOriginalComment());
		comment = em.find(Comment.class, 2);
		assertNotNull(comment.getOriginalComment());
		assertEquals("John", comment.getOriginalComment().getUser().getFirstName());		
		assertTrue(comment.getOriginalComment().getReplies().size() > 0);
	}

}
