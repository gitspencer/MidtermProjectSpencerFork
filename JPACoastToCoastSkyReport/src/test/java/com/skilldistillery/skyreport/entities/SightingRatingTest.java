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

class SightingRatingTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private SightingRating sightingRating;
	
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
		SightingRatingId sri = new SightingRatingId();
		sri.setSightingId(1);
		sri.setUserId(1);
		sightingRating = em.find(SightingRating.class, sri);
	}
	@AfterEach
	void tearDown() throws Exception {
		em.close();
		sightingRating = null;
	}

	@Test
	void test() {
		assertNotNull(sightingRating);
		assertEquals(4, sightingRating.getRating());
		assertEquals(2023, sightingRating.getRatingDate().getYear());
	}
	
	@Test
	void test_SightingRating_Sighting() {
		assertNotNull(sightingRating);
		assertNotNull(sightingRating.getSighting());
		assertEquals(1947, sightingRating.getSighting().getSightingDate().getYear());
	}
	
	@Test
	void test_SightingRating_User() {
		assertNotNull(sightingRating);
		assertNotNull(sightingRating.getUser());
		assertEquals("John", sightingRating.getUser().getFirstName());
	}


}
