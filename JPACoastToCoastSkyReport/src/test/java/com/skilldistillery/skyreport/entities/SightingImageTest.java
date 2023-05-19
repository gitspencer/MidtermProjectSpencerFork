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

class SightingImageTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private SightingImage sightingImage;
	
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
		sightingImage = em.find(SightingImage.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		sightingImage = null;
	}

	@Test
	void test() {
		assertNotNull(sightingImage);
		assertNotNull(sightingImage.getCaption());
		assertEquals("Air Force personnel identify metallic fragments found by a farmer near Roswell, New Mexico, in 1947 as pieces of a weather balloon. The discovery of the fragments became the basis of the Roswell incident.", sightingImage.getCaption());
	}


}
