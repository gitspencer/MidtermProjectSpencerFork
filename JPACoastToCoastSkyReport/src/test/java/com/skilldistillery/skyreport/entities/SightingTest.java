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

class SightingTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Sighting sighting;

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
		sighting = em.find(Sighting.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		sighting = null;
	}

	@Test
	void test() {
		assertNotNull(sighting);
		assertNotNull(sighting.getSightingDate());
		assertEquals(1947, sighting.getSightingDate().getYear());
	}

}