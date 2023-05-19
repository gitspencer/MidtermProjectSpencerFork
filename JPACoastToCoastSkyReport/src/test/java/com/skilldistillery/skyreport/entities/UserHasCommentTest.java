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

class UserHasCommentTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private UserHasComment userHasComment;
	
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
		UserHasCommentId uhc = new UserHasCommentId();
		uhc.setCommentId(1);
		uhc.setUserId(1);
		userHasComment = em.find(UserHasComment.class, uhc);
	}
	@AfterEach
	void tearDown() throws Exception {
		em.close();
		userHasComment = null;
	}

	@Test
	void test() {
		assertNotNull(userHasComment);
		assertTrue(userHasComment.getCommentVote());

	}


}
